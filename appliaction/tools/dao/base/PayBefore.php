<?php
/**
 * 支付前预处理
 */
namespace dao\base;

class PayBefore
{
    /**
     * 统一规划预处理接口 验证支付信息 进入支付调用接口
     * 支付流程 PayBefore->Pay->PayDeal[type]->PayNotify->PayCallBack
     * @date   2018-01-15T15:25:26+0800
     * @author ChenMingjiang
     * @param  [type]                   $data      [支付相关查询条件 type order_sn]
     *                                             type:财务交易类型
     *                                             order_sn:财务关联单号
     * @param  [type]                   $payMatch  [支付接口调用类型 3微信小程序支付接口 4微信小程序退款接口]
     * @param  [type]                   $returnUrl [支付完成通知地址]
     * @return [type]                              [description]
     */
    public function main($data, $payMatch, $returnUrl, $options = [])
    {
        $debug = isset($options['debug']) ? $options['debug'] : false;

        // 预处理信息 如果无需处理 则直接进入最终比较
        switch ($data['type']) {
            case '1239': // 商品支付
                $result = $this->pay_1239($data);
                break;
            case '1240': // 购买vip
                $result = $this->pay_1240($data);
                break;
            case '1241': // 退款
                $result = $this->pay_1241($data);
                break;
            default:
                return ['status' => false, 'msg' => '财务类型：' . $data['type'] . '不存在'];
                break;
        }

        // 返回初步检测错误信息
        if (isset($result['status'])) {
            return $result;
        }

        if ($debug) {
            print_r('-------ACTION-----' . PHP_EOL);
            print_r('PayBefore:main' . PHP_EOL);
            print_r('-------END-----' . PHP_EOL);
            print_r('-------参数Data-----' . PHP_EOL);
            print_r($data) . PHP_EOL;
            print_r('-------END-----' . PHP_EOL);
            print_r('-------参数Result-----' . PHP_EOL);
            print_r($result) . PHP_EOL;
            print_r('-------END-----' . PHP_EOL);
            print_r('-------参数payMatch-----' . PHP_EOL);
            print_r($payMatch . PHP_EOL);
            print_r('-------END-----' . PHP_EOL);
            print_r('-------ACTION END-----' . PHP_EOL);
        }

        // 检测财务数据与实际支付信息是否一致
        $data = array_merge($data, $result);

        // 最终比较
        $result = $this->checkPaySn($data);
        if (!$result['status']) {
            return $result;
        }

        // 执行支付接口
        $result = dao('Pay')->main($result['data'], $payMatch, $returnUrl, $options);

        return $result;
    }

    // 最终比较
    public function checkPaySn($param)
    {
        $map             = [];
        $map['type']     = $param['type'];
        $map['order_sn'] = $param['order_sn'];

        $finance = table('FinanceLog')->where($map)->field('uid,pay_sn,money,unit,title,pay_type,is_pay')->order('id desc')->find();
        if (!$finance) {
            return ['status' => false, 'msg' => '财务信息不存在'];
        }

        if ($finance['is_pay'] == 1) {
            return ['status' => false, 'msg' => '已经支付了'];
        }

        if ($finance['money'] != $param['money']) {
            return ['status' => false, 'msg' => '财务记录金额与支付金额不一致'];
        }

        if (isset($param['unit'])) {
            if ($param['unit'] != $param['unit']) {
                return ['status' => false, 'msg' => '财务记录金额与支付币种不一致'];
            }
        }

        if (!$finance['money']) {
            return ['status' => false, 'msg' => '支付金额不可为0'];
        }

        $data['uid']      = $finance['uid'];
        $data['money']    = $finance['money'];
        $data['pay_sn']   = $finance['pay_sn'];
        $data['unit']     = $finance['unit'];
        $data['title']    = $finance['title'];
        $data['pay_type'] = $finance['pay_type'];

        $data = array_merge($param, $data);

        return ['data' => $data, 'status' => true];
    }

    // 商品订单支付
    public function pay_1239($param)
    {

        $map             = [];
        $map['type']     = $param['type'];
        $map['order_sn'] = $param['order_sn'];
        $map['is_pay']   = 0;

        $finance = table('FinanceLog')->where($map)->field('uid,pay_sn,money,unit,title,pay_type')->find();

        $data['uid']      = $finance['uid'];
        $data['money']    = $finance['money'];
        $data['pay_sn']   = $finance['pay_sn'];
        $data['unit']     = $finance['unit'];
        $data['title']    = $finance['title'];
        $data['pay_type'] = $finance['pay_type'];

        $data['openid'] = table('UserThirdParty')->where('uid', $finance['uid'])->value('ouid');

        return $data;
    }

    // 购买vip
    public function pay_1240($param)
    {

        $map             = [];
        $map['type']     = $param['type'];
        $map['order_sn'] = $param['order_sn'];
        $map['is_pay']   = 0;

        $finance = table('FinanceLog')->where($map)->field('uid,pay_sn,money,unit,title,pay_type')->find();

        $data['uid']      = $finance['uid'];
        $data['money']    = $finance['money'];
        $data['pay_sn']   = $finance['pay_sn'];
        $data['unit']     = $finance['unit'];
        $data['title']    = $finance['title'];
        $data['pay_type'] = $finance['pay_type'];

        $data['openid'] = table('UserThirdParty')->where('uid', $finance['uid'])->value('ouid');

        return $data;
    }

    // 退款
    public function pay_1241($param)
    {

        $map             = [];
        $map['type']     = $param['type'];
        $map['order_sn'] = $param['order_sn'];
        $map['is_pay']   = 0;

        $finance = table('FinanceLog')->where($map)->field('uid,pay_sn,money,unit,title,pay_type,refund_sn')->find();

        $data['uid']       = $finance['uid'];
        $data['money']     = $finance['money'];
        $data['pay_sn']    = $finance['pay_sn'];
        $data['unit']      = $finance['unit'];
        $data['title']     = $finance['title'];
        $data['pay_type']  = $finance['pay_type'];
        $data['refund_sn'] = $finance['refund_sn'];

        $data['openid'] = table('UserThirdParty')->where('uid', $finance['uid'])->value('ouid');

        return $data;
    }

}
