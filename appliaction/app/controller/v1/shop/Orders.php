<?php
/**
 * 订单信息模块管理
 */
namespace app\app\controller\v1\shop;

use app\app\controller;

class Orders extends \app\app\controller\Init
{
    public function __construct()
    {
        parent::__construct();
        $this->checkShop();
        $this->checkIde();
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

        $map['uid']        = $this->uid;
        $map['del_seller'] = 0;
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
        $map['status']   = 0;

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
     * 卖家删除已拒绝订单
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

        $reslut = table('Orders')->where('id', $id)->save('del_seller', 1);
        if (!$reslut) {
            $this->appReturn(array('status' => false, 'msg' => '执行失败'));
        }

        $this->appReturn(array('status' => true, 'msg' => '操作完成'));
    }

    /**
     * 卖家拒绝预约
     * @date   2017-09-22T17:12:24+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function refuseTime()
    {
        $orderSn       = post('order_sn', 'text', '');
        $startTime     = post('start_time', 'intval', 0);
        $endTime       = post('end_time', 'intval', 0);
        $sellerMessage = post('seller_message', 'text', '');

        if (!$orderSn) {
            $this->appReturn(array('status' => false, 'msg' => '参数错误'));
        }

        $map['uid']      = $this->uid;
        $map['order_sn'] = $orderSn;
        $map['status']   = 0;

        $id = table('Orders')->where($map)->field('id')->find('one');
        if (!$id) {
            $this->appReturn(array('status' => false, 'msg' => '可操作信息不存在'));
        }

        //另选时间
        if ($startTime && $endTime) {
            if (date('Y-m-d', $startTime) != date('Y-m-d', $endTime)) {
                $this->appReturn(array('status' => false, 'msg' => '预约超过一天了'));
            }

            $dataInfo['start_time'] = $startTime;
            $dataInfo['end_time']   = $endTime;

            $data['status']         = 2;
            $data['seller_message'] = $sellerMessage;
            $date['status_time']    = TIME;

            $reslut = table('Orders')->where('id', $id)->save($data);
            if (!$reslut) {
                $this->appReturn(array('status' => false, 'msg' => '执行失败'));
            }

            $reslut = table('OrdersCar')->where('order_sn', $orderSn)->save($dataInfo);
            if (!$reslut) {
                $this->appReturn(array('status' => false, 'msg' => '修改时间执行失败'));
            }

        }
        //直接拒绝
        else {
            $data['status']         = 3;
            $data['seller_message'] = $sellerMessage;

            $reslut = table('Orders')->where('id', $id)->save($data);
            if (!$reslut) {
                $this->appReturn(array('status' => false, 'msg' => '执行失败'));
            }
        }

        $this->appReturn(array('msg' => '操作成功'));
    }

    /**
     * 卖家关闭订单
     */
    public function close()
    {
        if (!$orderSn) {
            $this->appReturn(array('status' => false, 'msg' => '参数错误'));
        }

        $map['uid']          = $this->uid;
        $map['order_sn']     = $orderSn;
        $map['status']       = 1;
        $map['order_status'] = 2;

        $id = table('Orders')->where($map)->field('id')->find('one');
        if (!$id) {
            $this->appReturn(array('status' => false, 'msg' => '可操作信息不存在'));
        }

        $data['close_time'] = TIME;
        $date['status']     = 2;

        $reslut = table('Orders')->where('id', $id)->save($data);
        if (!$reslut) {
            $this->appReturn(array('status' => false, 'msg' => '执行失败'));
        }

        $this->appReturn(array('status' => true, 'msg' => '操作完成'));
    }
}
