<?php
/**
 * 商户财务模块
 */
namespace app\app\controller\v1\shop;

use app\app\controller;

class Finance extends \app\app\controller\Init
{
    public function index()
    {
        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 10);

        $offer = max(($pageNo - 1), 0) * $pageSize;

        $data['time'] = TIME;
        //本月营业额
        $startThismonth = mktime(0, 0, 0, date('m'), 1, date('Y'));
        $endThismonth   = mktime(23, 59, 59, date('m'), date('t'), date('Y'));

        $map                 = array();
        $map['status']       = 1;
        $map['order_status'] = array('>=', 3);
        $map['created']      = array('between', $startThismonth, $endThismonth);
        $map['seller_uid']   = $this->uid;

        $data['thismonth_turnover'] = (float) table('Orders')->where($map)->field('SUM(acount) as acount')->find('one');

        //本月订单
        $map               = array();
        $map['status']     = 1;
        $map['created']    = array('between', $startThismonth, $endThismonth);
        $map['seller_uid'] = $this->uid;

        $data['thismonth_num'] = table('Orders')->where($map)->field('count(*) as num')->find('one');
        //echo table('Orders')->getSql();die;
        //上月营业额
        $startLastmonth = mktime(0, 0, 0, date('m') - 1, 1, date('Y'));
        $endLastmonth   = mktime(0, 0, 0, date('m'), 1, date('Y')) - 24 * 3600;

        $map                        = array();
        $map['status']              = 1;
        $map['order_status']        = array('>=', 3);
        $map['created']             = array('between', $startLastmonth, $endLastmonth);
        $map['seller_uid']          = $this->uid;
        $data['lastmonth_turnover'] = (float) table('Orders')->where($map)->field('SUM(acount) as acount')->find('one');
        //echo table('Orders')->getSql();die;

        //上月总共订单
        $map                   = array();
        $map['status']         = 1;
        $map['created']        = array('between', $startLastmonth, $endLastmonth);
        $map['seller_uid']     = $this->uid;
        $data['lastmonth_num'] = (int) table('Orders')->where($map)->field('count(*) as num')->find('one');

        //待确认订单
        $map                 = array();
        $map['status']       = array('in', '0, 2');
        $map['seller_uid']   = $this->uid;
        $data['confirm_num'] = (int) table('Orders')->where($map)->field('count(*) as num')->find('one');

        //获取佣金比例
        $commission = dao('Param')->getValue(1);
        //待确认佣金
        $map                        = array();
        $map['status']              = 1;
        $map['order_status']        = array('<', 3);
        $data['confirm_commission'] = (float) table('Orders')->where($map)->field('SUM(acount) as acount')->find('one');
        $data['confirm_commission'] = sprintf('%.2f', max($data['confirm_commission'] * $commission / 100, 0));

        //待支付佣金
        $map                    = array();
        $map['status']          = 1;
        $map['order_status']    = array('>=', 3);
        $map['is_percentage']   = 0;
        $data['pay_commission'] = (float) table('Orders')->where($map)->field('SUM(acount) as acount')->find('one');
        $data['pay_commission'] = sprintf('%.2f', max($data['pay_commission'] * $commission / 100, 0));

        //获取佣金流水
        $tOrders  = table('Orders')->tableName();
        $tFinance = table('FinanceLog')->tableName();

        $map                           = array();
        $map[$tOrders . '.type']       = 1;
        $map[$tOrders . '.seller_uid'] = $this->uid;
        $map[$tFinance . '.type']      = 1;

        $field   = "$tOrders.order_sn,$tOrders.acount,$tFinance.money,$tFinance.is_pay,$tFinance.created";
        $orderby = "$tFinance.created desc";
        $list    = table('FinanceLog')->join($tOrders, "$tOrders.order_sn = $tFinance.content")->where($map)->field($field)->find('array');
        foreach ($list as $key => $value) {
            $list[$key]['goods'] = table('OrdersCar')->where('order_sn', $value['order_sn'])->field('title')->find();
        }

        $data['list'] = $list ? $list : array();

        $this->appReturn(array('data' => $data));
    }
}
