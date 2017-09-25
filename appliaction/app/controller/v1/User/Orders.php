<?php
/**
 * 订单信息模块管理
 */
namespace app\app\controller\v1\user;

use app\app\controller;

class Orders extends \app\app\controller\Init
{
    public function __construct()
    {
        parent::__construct();
        $this->checkIndividual();
    }

    /**
     * 交易管理
     * @date   2017-09-22T15:27:23+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function lists()
    {
        $type        = get('type', 'intval', 0);
        $orderStatus = get('order_status', 'intval', 0);
        $pageNo      = get('pageNo', 'intval', 1);
        $pageSize    = get('pageSize', 'intval', 10);

        $offer = max(($pageNo - 1), 0) * $pageSize;

        $map['uid']     = $this->uid;
        $map['del_uid'] = 0;
        if ($orderStatus) {
            $map['order_status'] = $orderStatus;
        }

        $list = table('Orders')->where($mapCar)->field('id,order_sn,message,seller_magess,status,order_status,acount_original,acount')->limit($offer, $pageSize)->order('id desc')->find('array');
        foreach ($list as $key => $value) {
            $goods = table('OrdersCar')->where('order_sn', $value['order_sn'])->field('title,ascription,goods_id,thumb,price_original,price,produce_time,mileage,start_time,end_time')->find('array');
            foreach ($goods as $k => $v) {
                $goods[$k]['price_original'] = $v['price_original'] . '万';
                $goods[$k]['price']          = $v['price'] . '万';
                $goods[$k]['mileage']        = $v['mileage'] . '万公里';
                $goods[$k]['thumb']          = $this->appImg($v['thumb'], 'car');
                $goods[$k]['produce_time']   = $v['produce_time'] . '年';
                $goods[$k]['time']           = date('Y-m-d H:i', $v['start_time']) . '-' . date('H:i', $v['end_time']);
            }
            $list[$key]['goods'] = $goods;
        }

        $data = $list ? $list : array();

        $this->appReturn(array('data' => $data));
    }

    /**
     * 买家同意预约时间
     * @date   2017-09-22T16:27:41+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function agreeTime()
    {
        $orderSn = post('order_sn', 'text', '');
        if (!$orderSn) {
            $this->appReturn(array('status' => false, 'msg' => '参数错误'));
        }

        $map['uid']      = $this->uid;
        $map['order_sn'] = $orderSn;
        $map['status']   = 2;

        $id = table('Orders')->where($map)->field('id')->find('one');
        if (!$id) {
            $this->appReturn(array('status' => false, 'msg' => '可操作信息不存在'));
        }

        $data['status']    = 1;
        $data['pass_time'] = TIME;

        $reslut = table('Orders')->where('id', $id)->save($data);

        if (!$reslut) {
            $this->appReturn(array('status' => false, 'msg' => '执行失败'));
        }

        $this->appReturn(array('status' => true, 'msg' => '操作完成'));
    }

    /**
     * 买家删除已拒绝订单
     * @date   2017-09-22T16:41:34+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function del()
    {
        $orderSn = post('order_sn', 'text', '');
        if (!$orderSn) {
            $this->appReturn(array('status' => false, 'msg' => '参数错误'));
        }

        $map['uid']      = $this->uid;
        $map['order_sn'] = $orderSn;
        $map['status']   = 3;

        $id = table('Orders')->where($map)->field('id')->find('one');
        if (!$id) {
            $this->appReturn(array('status' => false, 'msg' => '可操作信息不存在'));
        }

        $reslut = table('Orders')->where('id', $id)->save('del_uid', 1);
        if (!$reslut) {
            $this->appReturn(array('status' => false, 'msg' => '执行失败'));
        }

        $this->appReturn(array('status' => true, 'msg' => '操作完成'));
    }
}
