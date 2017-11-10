<?php
/**
 * 订单模块
 */
namespace app\study\tools\dao;

class Orders
{
    public function add($uid, $type = 3, $dataInfo = array(), $farePrice = 0, $couponPrice = 0, $message = '', $origin = 0, $version = 0)
    {

        $map['id'] = $dataInfo['goods_id'];
        $goodsInfo = dao('Article')->getRowContent($map, '', 3);
        if (!$goodsInfo) {
            return array('status' => false, 'msg' => '信息获取失败');
        }

        if (!$goodsInfo['is_show']) {
            return array('status' => false, 'msg' => '该课程已关闭');
        }

        $orderSn = dao('Orders')->createOrderSn();

        $data['uid']          = $uid;
        $data['type']         = $type;
        $data['status']       = 1;
        $data['order_status'] = 1;
        $data['order_sn']     = $orderSn;
        $data['acount']       = $data['acount_original']       = $goodsInfo['dis_price'] ? $goodsInfo['dis_price'] : $goodsInfo['sale_price'];
        $data['coupon_price'] = $couponPrice;
        $data['coupon_price'] = $farePrice;
        $data['created']      = TIME;
        $data['message']      = $message;

        table('Orders')->startTrans();
        $orderId = table('Orders')->add($data);

        if (!$orderId) {
            table('Orders')->rollback();
            return array('status' => false, 'msg' => '保存订单失败');
        }

        $data                  = array();
        $data                  = $dataInfo;
        $data['order_sn']      = $orderSn;
        $data['sign']          = $goodsInfo['class_type'];
        $data['num']           = $goodsInfo['num'];
        $data['class_time']    = $goodsInfo['class_time'];
        $data['thumb']         = $goodsInfo['thumb'];
        $data['title']         = $goodsInfo['title'];
        $data['btitle']        = $goodsInfo['btitle'];
        $data['class_time_en'] = $goodsInfo['class_time_en'];
        $data['teacher_uid']   = $goodsInfo['teacher_uid'];

        $resultData = table('OrdersCourse')->add($data);
        if (!$resultData) {
            table('Orders')->rollback();
            return array('status' => false, 'msg' => '保存订单附属信息失败,请重新尝试');
        }
        table('Orders')->commit();
        return array('status' => true, 'msg' => '保存成功');
    }

}
