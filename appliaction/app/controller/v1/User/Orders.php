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
        //定时任务关闭超过预约时间的订单
        dao('Orders', 'app')->changeOrdersStatus($this->uid);

        $type        = get('type', 'intval', 1);
        $orderStatus = get('order_status', 'intval', 0);
        $pageNo      = get('pageNo', 'intval', 1);
        $pageSize    = get('pageSize', 'intval', 10);

        $offer = max(($pageNo - 1), 0) * $pageSize;

        $map['uid']     = $this->uid;
        $map['del_uid'] = 0;
        if ($orderStatus) {
            if ($orderStatus == 1) {
                $map['order_status'] = 1;
                $map['status']       = array('in', '0,2');
            } elseif ($orderStatus == 3) {
                $map['order_status'] = array('>=', 3);
            } else {
                $map['order_status'] = $orderStatus;
            }

        }
        $map['type'] = $type;

        $list = table('Orders')->where($map)->field('id,uid,seller_uid,order_sn,message,seller_message,status,order_status,acount_original,acount')->limit($offer, $pageSize)->order('id desc')->find('array');
        foreach ($list as $key => $value) {
            switch ($type) {
                case '1':
                    $goods = table('OrdersCar')->where('order_sn', $value['order_sn'])->field('title,ascription,goods_id,thumb,price_original,price,produce_time,mileage,start_time,end_time,mobile')->find('array');
                    foreach ($goods as $k => $v) {
                        $goods[$k]['price_original'] = dao('Number')->price($v['price_original']);
                        $goods[$k]['price']          = dao('Number')->price($v['price']);
                        $goods[$k]['mileage']        = $v['mileage'] . '万公里';
                        $goods[$k]['thumb']          = $this->appImg($v['thumb'], 'car');
                        $goods[$k]['produce_time']   = $v['produce_time'] . '年';
                        $goods[$k]['time']           = date('Y-m-d H:i', $v['start_time']) . '-' . date('H:i', $v['end_time']);
                    }
                    break;
                case '2':
                    $goods = table('OrdersService')->where('order_sn', $value['order_sn'])->field('title,goods_id,thumb,price_original,price,mileage,start_time,end_time,vin,brand,style,produce_time,buy_time,mobile')->find('array');
                    foreach ($goods as $k => $v) {
                        $goods[$k]['price_original'] = dao('Number')->price($v['price_original']);
                        $goods[$k]['price']          = dao('Number')->price($v['price']);
                        $goods[$k]['mileage']        = $v['mileage'] . '万公里';
                        $goods[$k]['thumb']          = $this->appImg($v['thumb'], 'car');
                        $goods[$k]['produce_time']   = $v['produce_time'] . '年';
                        $goods[$k]['time']           = date('Y-m-d H:i', $v['start_time']) . '-' . date('H:i', $v['end_time']);
                    }
                    break;
                default:
                    # code...
                    break;
            }
            $list[$key]['goods']  = $goods;
            $list[$key]['user']   = dao('User')->getInfo($value['uid'], 'nickname,mobile');
            $list[$key]['seller'] = dao('User')->getInfo($value['seller_uid'], 'nickname,mobile');
        }

        $data = $list ? $list : array();

        $this->appReturn(array('data' => $data));
    }

    public function detail()
    {
        $orderSn = get('order_sn', 'text', '');
        if (!$orderSn) {
            $this->appReturn(array('status' => false, 'msg' => '参数错误'));
        }

        $map['uid']      = $this->uid;
        $map['order_sn'] = $orderSn;

        $result = dao('Orders')->detail($map);
        if (!$result['status']) {
            $this->appReturn($result);
        }

        $data = $result['data'];

        foreach ($data['goods'] as $key => $value) {
            $data['goods'][$key]['thumb'] = $this->appImg($value['thumb'], 'car');
        }

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

        $data['status']       = 1;
        $data['pass_time']    = TIME;
        $data['order_status'] = 2;

        $result = table('Orders')->where('id', $id)->save($data);

        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '执行失败'));
        }

        $this->appReturn(array('status' => true, 'msg' => '操作完成'));
    }

    /**
     * 买家拒绝预约
     * @date   2017-09-22T17:12:24+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function refuseTime()
    {
        $orderSn = post('order_sn', 'text', '');

        if (!$orderSn) {
            $this->appReturn(array('status' => false, 'msg' => '参数错误'));
        }

        $map['uid']      = $this->uid;
        $map['order_sn'] = $orderSn;
        $map['status']   = 2;

        $orders = table('Orders')->where($map)->field('id,seller_uid,type')->find();
        if (!$orders) {
            $this->appReturn(array('status' => false, 'msg' => '可操作信息不存在'));
        }

        $user = table('User')->where('id', $this->uid)->field('nickname,mobile')->find();

        $data['status'] = 3;

        $result = table('Orders')->where('id', $orders['id'])->save($data);
        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '执行失败'));
        }

        //发送站内信参数
        $sendData = array(
            'nickname' => $user['nickname'],
            'mobile'   => $user['mobile'],
        );

        //站内信跳转参数
        $messageType = $orders['type'] == 1 ? 2 : 3;
        $jumpData    = array('type' => $messageType, 'order_sn' => $orders['order_sn']);

        dao('Message')->send($orders['seller_uid'], 'seller_appointment_refuse_time', $sendData, $jumpData);

        $this->appReturn(array('msg' => '操作成功'));
    }

    /**
     * 卖家关闭订单
     */
    public function close()
    {
        $orderSn = post('order_sn', 'text', '');
        if (!$orderSn) {
            $this->appReturn(array('status' => false, 'msg' => '参数错误'));
        }

        $map['uid']          = $this->uid;
        $map['order_sn']     = $orderSn;
        $map['status']       = 0;
        $map['order_status'] = 1;

        $id = table('Orders')->where($map)->field('id')->find('one');
        if (!$id) {
            $this->appReturn(array('status' => false, 'msg' => '可操作信息不存在'));
        }

        $data['close_time']   = TIME;
        $data['status']       = 3;
        $data['order_status'] = 0;

        $result = table('Orders')->where('id', $id)->save($data);
        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '执行失败'));
        }

        $this->appReturn(array('msg' => '操作完成'));
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

        $result = table('Orders')->where('id', $id)->save('del_uid', 1);
        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '执行失败'));
        }

        $this->appReturn(array('status' => true, 'msg' => '操作完成'));
    }

    /**
     * 确认商户订单
     * @date   2017-09-27T16:21:32+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function success()
    {

        $orderSn = post('order_sn', 'text', '');
        if (!$orderSn) {
            $this->appReturn(array('status' => false, 'msg' => '参数错误'));
        }

        $map['uid']          = $this->uid;
        $map['order_sn']     = $orderSn;
        $map['order_status'] = 3;
        $map['status']       = 1;

        $orders = table('Orders')->where($map)->field('type,seller_uid')->find();
        if (!$orders) {
            $this->appReturn(array('status' => false, 'msg' => '订单信息不存在'));
        }

        if ($orders['type'] == 1) {
            $ordersData = table('OrdersCar')->where('order_sn', $orderSn)->field('ascription')->find();
            if ($ordersData['ascription'] == 1) {
                $this->appReturn(array('status' => false, 'msg' => '个人订单无需确认'));
            }
        }

        //改为待评价
        $data['order_status'] = 4;
        table('Orders')->startTrans();
        $result = table('Orders')->where(array('order_sn' => $orderSn))->save($data);
        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '订单操作失败'));
        }

        //领取抵扣卷
        $gift = table('Gift')->where(array('order_sn' => $orderSn, 'status' => 0))->find();
        if ($gift['type'] == 1) {
            //增加抵扣卷领取记录
            $result = dao('Coupon')->send($this->uid, $gift['value'], 1, $gift['id']);
            if (!$result['status']) {
                table('Orders')->rollback();
                $this->appReturn($result);
            }
        }
        table('Orders')->commit();
        $this->appReturn(array('msg' => '操作完成'));
    }

    /**
     * 发表评价
     * @date   2017-09-27T16:46:20+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function comment()
    {
        $orderSn = post('order_sn', 'text', '');
        $score   = post('score', 'intval', 50);

        $content = post('content', 'text', '');

        $ablum = files('ablum');

        if (!$orderSn) {
            $this->appReturn(array('status' => false, 'msg' => '参数错误'));
        }

        if ($score > 50 || $score < 0) {
            $this->appReturn(array('status' => false, 'msg' => '评分最高5星,最低0星'));
        }

        /*if (!$content) {
        $this->appReturn(array('status' => false, 'msg' => '请输入评价内容'));
        }*/

        $dataContent['ablum']    = $this->appUpload($ablum, '', 'comment');
        $dataContent['order_sn'] = $orderSn;

        $map['uid']          = $this->uid;
        $map['order_sn']     = $orderSn;
        $map['order_status'] = 4;
        $map['status']       = 1;

        $orders = table('Orders')->where($map)->field('type,seller_uid')->find();
        if (!$orders) {
            $this->appReturn(array('status' => false, 'msg' => '订单信息不存在'));
        }

        if ($orders['type'] == 1) {
            $commentType = 2;
            $ordersData  = table('OrdersCar')->where('order_sn', $orderSn)->field('goods_id')->find();
        } else {
            $commentType = 3;
            $ordersData  = table('OrdersService')->where('order_sn', $orderSn)->field('goods_id')->find();
        }

        $is = table('Comment')->where(array('order_sn' => $orderSn, 'uid' => $this->uid))->field('id')->find();
        if ($is) {
            $this->appReturn(array('status' => false, 'msg' => '订单已评价'));
        }

        table('Orders')->startTrans();
        //增加评价信息
        $result = dao('Comment')->add($this->uid, $commentType, $ordersData['goods_id'], $content, $dataContent, $orders['seller_uid']);
        if ($result['status']) {
            //订单改为已评价
            $resultOrders = table('Orders')->where(array('order_sn' => $orderSn))->save('order_status', 5);
            if (!$resultOrders) {
                table('Orders')->rollback();
                $this->appReturn(array('status' => false, 'msg' => '订单信息更新失败'));
            }

            //增加店铺打分
            $data['score']    = $score;
            $data['type']     = 1;
            $data['shop_uid'] = $orders['seller_uid'];
            $data['created']  = TIME;
            $data['uid']      = $this->uid;

            $resultScore = table('Score')->add($data);
            if (!$resultScore) {
                table('Orders')->rollback();
                $this->appReturn(array('status' => false, 'msg' => '增加评分失败'));
            }

            //更新店铺综合评分
            $data                 = array();
            $dataScore            = dao('User')->getShopCredit($this->uid);
            $data['credit_level'] = $dataScore['value'];
            $resultShop           = table('UserShop')->where('uid', $this->uid)->save($data);
        }

        table('Orders')->commit();
        $this->appReturn($result);
    }
}
