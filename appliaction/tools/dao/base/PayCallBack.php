<?php
/**
 * 支付回调处理
 */
namespace dao\base;

class PayCallBack
{

    public $params; // 请求参数
    public $type = 0; // 请求类型

    /**
     * 支付回调信息处理
     * @date   2019-02-20T09:42:32+0800
     * @author ChenMingjiang
     * @param  [type]                   $param [description]
     *                                  pay_sn:财务交易记录单号
     * @return [type]                   [description]
     */
    public function main($params)
    {

        $this->params = $params;

        // 前置财务记录检查
        $result = $this->before();
        if (!$result['status']) {
            return $result;
        }

        // 根据前置财务记录检查获取财务记录类型
        switch ($this->type) {
            case 1: // 普通商品交易完成
                $result = $this->execute_1();
                break;
            case 2: // 购买vip
                $result = $this->execute_2();
            default:
                # code...
                break;
        }

        return $result;
    }

    /** 验证通过 财务信息表处理 */
    public function before()
    {

        if (!$this->params['pay_sn'] || !$this->params['pay_money']) {
            return ['status' => false, 'msg' => '支付参数异常'];
        }

        $map           = [];
        $map['pay_sn'] = $this->params['pay_sn']; // 财务单号

        $finance = table('FinanceLog')->where($map)->field('id,is_pay,type,pay_money,money,unit')->find();
        if (!$finance) {
            return ['status' => false, 'msg' => '支付信息不存在', 'sql' => table('FinanceLog')->getLastSql()];
        }

        if ($finance['is_pay'] == 1) {
            return ['status' => false, 'msg' => '已经支付了'];
        }

        // 如果存在优惠金额
        if (!empty($this->params['coupon_fee']) && $this->params['coupon_fee'] > 0) {
            if ($finance['money'] - $this->params['pay_money'] - $this->params['coupon_fee'] > 0.1) {
                return ['status' => false, 'msg' => '[支付金额+优惠金额]不一致'];
            }
        } elseif ($finance['money'] - $this->params['pay_money'] > 0.1) {
            return ['status' => false, 'msg' => '[支付金额]不一致'];
        }

        if (isset($this->params['unit'])) {
            if ($this->params['unit'] != $finance['unit']) {
                return ['status' => false, 'msg' => '[支付货币种类]不一致'];
            }
        }

        $data               = [];
        $data['pay_money']  = $this->params['pay_money'];
        $data['coupon_fee'] = !empty($this->params['coupon_fee']) ? $this->params['coupon_fee'] : 0;
        $data['is_pay']     = 1;

        $result = table('FinanceLog')->where('id', $finance['id'])->save($data);
        if ($result === false) {
            return ['status' => false, 'msg' => '支付状态异常,请通知管理员'];
        }

        $this->type = $finance['type'];

        return ['status' => true, 'msg' => '[金额/币种]检验通过'];

    }

    /** 普通商品支付成功后续操作 */
    public function execute_1()
    {
        $map            = [];
        $map['pay_sn']  = $this->params['pay_sn'];
        $map['is_lock'] = 0;

        list($uid, $orderSn) = table('FinanceLog')->where($map)->lists('uid,order_sn');

        // 查询订单信息
        $orders = table('Orders')->where('order_sn', $orderSn)->find();

        // 开启事务
        table('Orders')->startTrans();

        // 更订单支付状态 1186=>支付完成 1188=>订单完成
        $data   = [];
        $result = dao('ProcessLog')->add($uid, 1186, $orderSn, ['tables' => array(['Orders', 'order_sn', 'status'])]);
        if ($result === false) {
            table('Orders')->rollback();
            return ['status' => false, 'msg' => '增加订单操作记录失败,请联系管理员处理'];
        }

        // 更改订单主表支付
        $result = table('Orders')->where('order_sn', $orderSn)->save('is_pay', 1);
        if ($result === false) {
            table('Orders')->rollback();
            return ['status' => false, 'msg' => '修改订单支付状态失败,请联系管理员处理'];
        }

        // 更改抵扣卷状态
        if ($orders['coupon_id']) {

            $data             = [];
            $data['use_time'] = TIME;
            $data['order_sn'] = $orderSn;

            $result = table('CouponLog')->where('id', $orders['coupon_id'])->save($data);
            if ($result === false) {
                table('Orders')->rollback();
                return ['status' => false, 'msg' => '抵扣卷消费失败,请联系管理员处理'];
            }
        }

        // 更改用户余额
        if ($orders['balance_price'] > 0) {

            $data = [];

            if ($orders['unit'] == 'CNY') {
                $data['moeny'] = ['less', $orders['balance_price']];
            } else {
                $data['moeny_' . $orders['unit']] = ['less', $orders['balance_price']];
            }

            $result = table('User')->where('uid', $uid)->save($data);

            if ($result === false) {
                table('Orders')->rollback();
                return ['status' => false, 'msg' => '余额结算失败,请联系管理员处理'];
            }

        }

        /****** 检查分销 *****/
        if ($this->params['pay_money'] > 9.9) {
            // 是否存在1级分销
            $distributionUid_1 = (string) table('DistributionUser')->where('uid', $uid)->value('invitation_uid');

            // 存在1级分销
            if ($distributionUid_1) {
                // 1级分销 提成百分之10
                $data = [
                    'uid'     => $distributionUid_1,
                    'fr_uid'  => $uid,
                    'money'   => max($this->params['pay_money'] * 0.1, 0.01),
                    'params'  => json_encode(['order_sn' => $orderSn], JSON_UNESCAPED_UNICODE),
                    'created' => TIME,
                ];
                $result = table('DistributionCommission')->add($data);
                if ($result === false) {
                    table('Orders')->rollback();
                    return ['status' => false, 'msg' => '1级分销提成失败,请联系管理员处理'];
                }

                // 是否存在 2级分销
                $distributionUid_2 = (string) table('DistributionUser')->where('uid', $distributionUid_1)->value('invitation_uid');
                if ($result) {
                    $data = [
                        'uid'     => $distributionUid_2,
                        'fr_uid'  => $uid,
                        'money'   => max($this->params['pay_money'] * 0.05, 0.01),
                        'params'  => json_encode(['order_sn' => $orderSn], JSON_UNESCAPED_UNICODE),
                        'created' => TIME,
                    ];
                    $result = table('DistributionCommission')->add($data);
                    if ($result === false) {
                        table('Orders')->rollback();
                        return ['status' => false, 'msg' => '1级分销提成失败,请联系管理员处理'];
                    }

                }
            }
        }

        /****** 检查分销end *****/

        // 锁定财务表
        $result = table('FinanceLog')->where('pay_sn', $this->params['pay_sn'])->save('is_lock', 1);
        if (!$result) {
            table('Orders')->rollback();
            return ['status' => false, 'msg' => '财务表锁定失败'];
        }

        table('Orders')->commit();
        return ['status' => true, 'msg' => '商品购买交易完成'];
    }

    public function execute_2()
    {

        $map            = [];
        $map['pay_sn']  = $this->params['pay_sn'];
        $map['is_lock'] = 0;

        $uid = table('FinanceLog')->where($map)->value('uid');

        // 开启事务
        table('User')->startTrans();

        // 锁定财务表
        $result = table('FinanceLog')->where('pay_sn', $this->params['pay_sn'])->save('is_lock', 1);
        if ($result === false) {
            table('User')->rollback();
            return ['status' => false, 'msg' => '财务表锁定失败'];
        }

        // 增加用户表经验值100
        $result = table('User')->where('uid', $uid)->save('experience', 'add', 100);
        if ($result === false) {
            table('User')->rollback();
            return ['status' => false, 'msg' => '购买记录修改失败'];
        }

        $result = dao('User')->updateLevel($uid, 'experience');
        if (!$result['status']) {
            table('User')->rollback();
            return $result;
        }

        table('User')->commit();
        return ['status' => true, 'msg' => 'vip购买交易完成'];

    }
}
