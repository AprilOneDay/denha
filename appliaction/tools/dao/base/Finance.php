<?php
/**
 * 财务模块
 */
namespace dao\base;

class Finance
{

    /** 直接财务记录 */
    public function addPay($param = [], $isPay = 0)
    {

        if (empty($param['money']) || empty($param['type']) || empty($param['order_sn'])) {
            return ['status' => false, 'msg' => '财务参数错误'];
        }

        $data['type']      = $param['type'];
        $data['money']     = $param['money'];
        $data['order_sn']  = $param['order_sn'];
        $data['uid']       = $param['uid'];
        $data['is_pay']    = $isPay;
        $data['refund_sn'] = isset($param['refund_sn']) ? $param['refund_sn'] : '';
        $data['pay_money'] = isset($param['pay_money']) ? $param['pay_money'] : 0;
        $data['unit']      = isset($param['unit']) ? $param['unit'] : 'CNY';
        $data['title']     = isset($param['title']) ? $param['title'] : '订单编号:' . $param['order_sn'] . ' 在线支付';
        $data['pay_type']  = isset($param['pay_type']) ? $param['pay_type'] : 0;
        $data['pay_sn']    = dao('Orders')->createOrderSn();
        $data['created']   = TIME;

        $result = table('FinanceLog')->add($data);
        if ($result === false) {
            return ['status' => false, 'msg' => '财务记录,执行失败'];
        }

        return ['status' => true, 'msg' => '财务记录添加成功'];
    }

    /**
     * 支付确认
     * @date   2017-10-13T11:51:46+0800
     * @author ChenMingjiang
     * @param  [type]                   $map [description]
     * @return [type]                        [description]
     */
    public function pay($map, $payMoney = 0, $unit = '')
    {
        if (!$map) {
            return ['status' => false, 'msg' => '参数错误'];
        }

        $map['is_pay'] = 0;

        $finance = table('FinanceLog')->where($map)->field('id,money,unit')->find();
        if (!$finance) {
            return ['status' => false, 'msg' => '财务信息不存在'];
        }

        if ($payMoney && $payMoney < $finance['money']) {
            table('FinanceLog')->where('id', $finance['id'])->save('issue_status', 1);
            return ['status' => false, 'msg' => '支付金额不一致'];
        }

        if ($unit && $finance['unit'] != $unit) {
            table('FinanceLog')->where('id', $finance['id'])->save('issue_status', 2);
            return ['status' => false, 'msg' => '支付币种不一致'];
        }

        $data              = [];
        $data['is_pay']    = 1;
        $data['pay_money'] = $payMoney;

        $result = table('FinanceLog')->where('id', $finance['id'])->save('is_pay', 1);
        if (!$result) {
            return ['status' => false, 'msg' => '修改失败'];
        }

        return ['status' => true, 'msg' => '操作成功'];

    }

    /** 待支付状态下 检测支付金额/币种是否一致 */
    public function checkPrice($params)
    {
        if (!$params['pay_sn'] || !$params['pay_money']) {
            return ['status' => false, 'msg' => '支付参数异常'];
        }

        $map           = [];
        $map['pay_sn'] = $params['pay_sn']; // 财务单号
        $map['is_pay'] = 0; // 支付状态

        $finance = table('FinanceLog')->where($map)->field('id,pay_money,money,unit')->find();
        if (!$finance) {
            return ['status' => false, 'msg' => '支付信息不存在'];
        }

        // 如果存在优惠金额
        if (!empty($param['coupon_fee']) && $params['coupon_fee'] > 0) {
            if ($finance['money'] - $params['pay_money'] - $params['coupon_fee'] > 0.1) {
                return ['status' => false, 'msg' => '[支付金额+优惠金额]不一致'];
            }
        } elseif ($finance['money'] - $params['pay_money'] > 0.1) {
            return ['status' => false, 'msg' => '[支付金额]不一致'];
        }

        if (isset($params['unit'])) {
            if ($params['unit'] != $finance['unit']) {
                return ['status' => false, 'msg' => '[支付货币种类]不一致'];
            }
        }

        $data               = [];
        $data['pay_money']  = $params['pay_money'];
        $data['coupon_fee'] = !empty($param['coupon_fee']) ? $param['coupon_fee'] : 0;
        $data['is_pay']     = 1;

        $result = table('FinanceLog')->where('id', $finance['id'])->save($data);
        if ($result === false) {
            return ['status' => false, 'msg' => '支付状态异常,请通知管理员'];
        }

        return ['status' => true, 'msg' => '[金额/币种]检验通过'];
    }

}
