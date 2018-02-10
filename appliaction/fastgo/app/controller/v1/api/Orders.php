<?php
/**
 * 订单状态更变
 */
namespace app\fastgo\app\controller\v1\api;

use app\app\controller;
use app\fastgo\app\controller\v1\ApiInit;

class Orders extends ApiInit
{
    public function update()
    {
        $orderSn = post('order_sn', 'text');

        $isChangePrice = post('is_change_price', 'intval', 0);

        $status = post('status', 'text', 0);

        $logistics['batch_sn']              = post('batch_sn', 'text', '');
        $logistics['position_sn']           = post('position_sn', 'text', '');
        $logistics['storage_transport_sn']  = post('storage_transport_sn', 'text', '');
        $logistics['outbound_transport_sn'] = post('outbound_transport_sn', 'text', '');
        $logistics['name']                  = post('name', 'text', '');
        $logistics['mobile']                = post('mobile', 'text', '');
        $logistics['address']               = post('address', 'text', '');
        $logistics['logistics_name']        = post('logistics_name', 'text', '');
        $logistics['logistics_mobile']      = post('logistics_mobile', 'text', '');
        $logistics['logistics_country']     = post('logistics_country', 'text', '');
        $logistics['logistics_province']    = post('logistics_province', 'text', '');
        $logistics['logistics_city']        = post('logistics_city', 'text', '');
        $logistics['logistics_area']        = post('logistics_area', 'text', '');
        $logistics['logistics_code']        = post('logistics_code', 'text', '');
        $logistics['logistics_address']     = post('logistics_address', 'text', '');
        $logistics['length']                = post('length', 'text', '');
        $logistics['breadth']               = post('breadth', 'text', '');
        $logistics['height']                = post('height', 'text', '');
        $logistics['volume']                = post('volume', 'text', '');
        $logistics['volume_weight']         = post('volume_weight', 'text', '');
        $logistics['real_weight']           = post('real_weight', 'text', '');
        $logistics['fee_weight']            = post('fee_weight', 'text', '');
        $logistics['is_buy_safe']           = post('is_buy_safe', 'text', '');
        $logistics['outbound_company']      = post('outbound_company', 'text', '');
        $logistics['declared_price']        = post('declared_price', 'text', '');
        $logistics['aegis_total_price']     = post('aegis_total_price', 'text', '');
        $logistics['declared_price']        = post('aegis_price', 'text', '');
        $logistics['sign']                  = post('sign', 'text', '');

        $goods = post('goods', 'json', '');

        $orders['acount_original'] = post('acount_original', 'text', '');

        $fieldCopy = array(
            'logistics' => '运单状态 ',
            'orders'    => '订单信息 ',
            'goods'     => '包裹信息 ',
        );

        if ($status) {
            $result = dao('OrdersLog')->add(0, $orderSn, $status);
            if (!$result) {
                $this->apiReturn(array('status' => false, 'msg' => '状态更新失败'));
            }
        }

        if (!$orderSn) {
            $this->apiReturn(array('status' => false, 'msg' => '未获取当订单编号'));
        }

        $isOrders = table('Orders')->where('order_sn', $orderSn)->field('id')->find();
        if (!$isOrders) {
            $this->apiReturn(array('status' => false, 'msg' => '订单信息不存在'));
        }

        $updateCopy = '';

        //开启事务
        table('Orders')->startTrans();
        //更改订单金额 进入待支付状态
        if ($isChangePrice) {
            $data = array();
            $updateCopy .= $fieldCopy['orders'];

            foreach ($orders as $key => $value) {
                if ($value != '') {
                    $data[$key] = $value;

                    if ($key == 'acount_original') {
                        $data['account'] = $data['acount_original'];
                    }
                }

            }

            $map             = array();
            $map['order_sn'] = $orderSn;
            $map['is_pay']   = 0;

            $isOrders = table('Orders')->where($map)->field('id')->find();
            if (!$isOrders) {
                $this->apiReturn(array('status' => false, 'msg' => '更新支付金额信订单息异常'));
            }
            $result = table('Orders')->where('order_sn', $orderSn)->save($data);
            if (!$result) {
                table('Orders')->rollback();
                $this->apiReturn(array('status' => false, 'msg' => '订单价格更新失败'));
            }
        }

        //更改物流信息参数
        if ($logistics) {
            $data = array();
            $updateCopy .= $fieldCopy['logistics'];

            foreach ($logistics as $key => $value) {
                if ($value != '') {
                    $data[$key] = $value;
                }
            }

            $result = table('Logistics')->where('order_sn', $orderSn)->save($data);
            if (!$result) {
                table('Orders')->rollback();
                $this->apiReturn(array('status' => false, 'msg' => '订单物流更新失败'));
            }
        }

        //更新包裹信息
        foreach ($goods as $key => $value) {
            $map             = array();
            $map['name']     = $value['name'];
            $map['order_sn'] = $value['order_sn'];

            $goodsId = table('OrdersPackage')->where($map)->field('id')->find('one');
            if (!$goodsId) {
                table('Orders')->rollback();
                $this->apiReturn(array('status' => false, 'msg' => '商品' . $value['name'] . '信息不存在'));
            }

            $data                                           = array();
            !isset($value['brand']) ?: $data['brand']       = $value['brand'];
            !isset($value['category']) ?: $data['category'] = $value['category'];
            !isset($value['spec']) ?: $data['spec']         = $value['spec'];
            !isset($value['num']) ?: $data['num']           = $value['num'];
            !isset($value['price']) ?: $data['price']       = $value['price'];
            !isset($value['account']) ?: $data['account']   = $value['account'];

            if (($data['num'] || $data['price']) && !$data['account']) {
                table('Orders')->rollback();
                $this->apiReturn(array('status' => false, 'msg' => '商品' . $value['name'] . '修改了数量/价格 请计算总价'));
            }

            $result = table('OrdersPackage')->where('id', $goodsId)->save($data);
            if (!$result) {
                table('Orders')->rollback();
                $this->appReturn(array('status' => false, 'msg' => '包裹信息保存失败'));
            }

        }

        //事务提交
        table('Orders')->commit();
        $this->apiReturn(array('msg' => '成功更新：' . $updateCopy));
    }
}
