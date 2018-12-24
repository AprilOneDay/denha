<?php
/**
 * 支付回调处理
 */
namespace dao\base;

class PayCallBack
{
    public function main($param)
    {

        $result = $this->before($param);
        if (!$result['status']) {
            return $result;
        }

        $type = $result['type'];
        switch ($type) {
            case 1: //普通商品交易完成
                $result = $this->execute_1($param);
                break;
            default:
                # code...
                break;
        }

        return $result;
    }

    /** 验证通过 财务信息表处理 */
    public function before($param)
    {
        $map            = array();
        $map['pay_sn']  = $param['pay_sn'];
        $map['is_lock'] = 0;

        $finance = table('FinanceLog')->where($map)->field('id,is_pay,money,unit,type')->find();
        if (!$finance) {
            return array('status' => false, 'msg' => '支付回调信息异常');
        }

        if (isset($param['unit'])) {
            if ($finance['unit'] != $param['unit']) {
                table('FinanceLog')->where('id', $finance['id'])->save('issue_status', 2);
                return array('status' => false, 'msg' => '支付币种不一致');
            }
        }

        if ($finance['money'] - $param['pay_money'] > 0.1) {
            table('FinanceLog')->where('id', $finance['id'])->save('issue_status', 1);
            return array('status' => false, 'msg' => '支付金额不一致');
        }

        //修改支付记录信息
        $data              = array();
        $data['pay_money'] = $param['pay_money'];
        $data['is_pay']    = 1;

        $result = table('FinanceLog')->where('id', $finance['id'])->save($data);
        if ($result == false) {
            return array('status' => false, 'msg' => '支付信息保存失败');
        }

        return array('status' => true, 'msg' => '支付回调信息查询通过', 'type' => $finance['type']);
    }

    /** 普通商品支付成功后续操作 */
    public function execute_1($param)
    {
        $map            = array();
        $map['pay_sn']  = $param['pay_sn'];
        $map['is_lock'] = 0;

        $finance = table('FinanceLog')->where($map)->field('order_sn,uid')->find();

        $uid     = $finance['uid'];
        $orderSn = $finance['order_sn'];

        //查询订单信息
        $orders = table('Orders')->where('order_sn', $orderSn)->find();

        //开启事务
        table('Orders')->startTrans();

        //更订单支付状态
        $data   = array();
        $result = dao('OrdersLog')->add($uid, $orderSn, 2);
        if (!$result) {
            table('Orders')->rollback();
            return array('status' => false, 'msg' => '订单最终结算异常,请联系管理员处理');
        }

        //更改订单主表支付
        $result = table('Orders')->where('order_sn', $orderSn)->save('is_pay', 1);
        if (!$result) {
            table('Orders')->rollback();
            return array('status' => false, 'msg' => '订单最终结算异常,请联系管理员处理');
        }

        //更改抵扣卷状态
        if ($orders['coupon_id']) {
            $data             = array();
            $data['use_time'] = TIME;
            $data['order_sn'] = $orderSn;

            $result = table('CouponLog')->where('id', $orders['coupon_id'])->save($data);
            if (!$result) {
                table('Orders')->rollback();
                return array('status' => false, 'msg' => '抵扣卷消费失败,请联系管理员处理');
            }
        }

        //更改用户余额
        if ($orders['balance_price']) {
            $data = array();
            if ($orders['unit'] == 'CNY') {
                $data['moeny'] = array('less', $orders['balance_price']);
            } else {
                $data['moeny_' . $orders['unit']] = array('less', $orders['balance_price']);
            }

            $result = table('User')->where('uid', $uid)->save($data);
            if (!$result) {
                table('Orders')->rollback();
                return array('status' => false, 'msg' => '余额结算失败,请联系管理员处理');
            }
        }

        //更改积分
        if ($orders['use_integral']) {
            $result = dao('Integral')->addTemp($uid, $orderSn . '订单支付', -$orders['use_integral']);
            if (!$result['status']) {
                table('Orders')->rollback();
                return $result;
            }
        }

        //锁定财务表
        $result = table('FinanceLog')->where('pay_sn', $param['pay_sn'])->save('is_lock', 1);
        if (!$result) {
            table('Orders')->rollback();
            return array('status' => false, 'msg' => '财务表锁定失败');
        }

        table('Orders')->commit();
        return array('status' => true, 'msg' => '交易完成');
    }
}
