<?php
namespace app\tools\dao;

class Orders
{
    public function add($uid, $type, $ordersInfo = array(), $farePrice = 0, $couponPrice = 0, $message = '', $origin = 0, $version = 0)
    {
        if (!$uid || !$type) {
            return array('status' => false, 'msg' => '参数错误');
        }

        if (!$ordersInfo) {
            return array('status' => false, 'msg' => 'dataInfo参数错误');
        }

        //sellserUid => 商品lists
        foreach ($ordersInfo as $key => $value) {
            $orderSn = $this->createOrderSn();

            $data['uid']             = $uid;
            $data['type']            = $type;
            $data['status']          = 0;
            $data['origin']          = 0;
            $data['version']         = $version;
            $data['seller_uid']      = $key;
            $data['order_sn']        = $orderSn;
            $data['message']         = $message;
            $data['acount_original'] = $value['data']['acount_original'];
            $data['acount']          = $data['acount_original'] + $farePrice - $couponPrice;
            $data['coupon_price']    = $couponPrice;
            $data['fare_price']      = $farePrice;

            table('Orders')->startTrans();
            $orderId = table('Orders')->add($data);

            if (!$orderId) {
                table('Orders')->rollback();
                return array('status' => false, 'msg' => '保存订单失败');
            }

            foreach ($value['list'] as $k => $v) {
                $goodsInfo             = $v;
                $goodsInfo['order_sn'] = $orderSn;
                switch ($type) {
                    //增加汽车信息记录
                    case '1':
                        $result = table('OrdersCar')->add($goodsInfo);
                        if (!$result) {
                            table('Orders')->rollback();
                            return array('status' => false, 'msg' => '保存附属信息有误', 'sql' => table('OrdersCar')->getSql());
                        }
                        break;
                    case '2':
                        $result = table('OrdersService')->add($goodsInfo);
                        if (!$result) {
                            table('Orders')->rollback();
                            return array('status' => false, 'msg' => '保存附属信息有误', 'sql' => table('OrdersService')->getSql());
                        }
                        break;
                    default:
                        # code...
                        break;
                }

            }

        }

        table('Orders')->commit();
        return array('status' => true, 'msg' => '操作成功');

    }

    /**
     * 创建18位数字订单号
     */
    public function createOrderSn()
    {
        return date('y') . sprintf('%03d', date('z')) . substr(time(), -5) . substr(microtime(), 2, 5) . sprintf('%03d', rand(0, 999));
    }

    /**
     * [获取添加订单附属信息]
     * @date   2017-09-22T11:01:27+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function getAddAttachedInfo($type = 1, $id = array(), $other = array())
    {
        switch ($type) {
            case '1':
                return $this->getAddAttachedInfo_1($id, $other);
                break;
            case '2':
                return $this->getAddAttachedInfo_2($id, $other);
                break;
            default:
                # code...
                break;
        }
    }

    //获取汽车信息
    public function getAddAttachedInfo_1($id, $other)
    {
        is_array($id) ?: $id = (array) $id;
        if (count($other) == count($other, 1)) {
            $otherTmp[0] = $other;
        } else {
            $otherTmp = &$other;
        }

        $id    = array_values($id);
        $other = array_values($otherTmp);

        //卖家id => 商品详情数组

        foreach ($id as $key => $value) {
            $goods = table('GoodsCar')->where(array('id' => $value))->field('id,uid,type,title,thumb,price,produce_time,mileage')->find();

            !isset($other[$key]) ?: $dataInfo[$goods['uid']]['list'][$key] = $other[$key];
            $dataInfo[$goods['uid']]['list'][$key]['goods_id']             = $goods['id'];
            $dataInfo[$goods['uid']]['list'][$key]['title']                = $goods['title'];
            $dataInfo[$goods['uid']]['list'][$key]['thumb']                = $goods['thumb'];
            $dataInfo[$goods['uid']]['list'][$key]['ascription']           = $goods['type'];
            $dataInfo[$goods['uid']]['list'][$key]['produce_time']         = $goods['produce_time'];
            $dataInfo[$goods['uid']]['list'][$key]['mileage']              = $goods['mileage'];
            $dataInfo[$goods['uid']]['list'][$key]['price_original']       = $dataInfo[$goods['uid']]['list'][$key]['price']       = $goods['price'];
            $dataInfo[$goods['uid']]['data']['acount_original'] += floatval($goods['price']);
        }

        return $dataInfo;
    }

    //获取汽车服务信息
    public function getAddAttachedInfo_2($id, $other)
    {
        is_array($id) ?: $id = (array) $id;
        if (count($other) == count($other, 1)) {
            $otherTmp[0] = $other;
        } else {
            $otherTmp = &$other;
        }

        $id    = array_values($id);
        $other = array_values($otherTmp);

        //卖家id => 商品详情数组
        foreach ($id as $key => $value) {
            $goods = table('GoodsService')->where(array('id' => $value))->field('id,uid,type,title,thumb,price')->find();

            !isset($other[$key]) ?: $dataInfo[$goods['uid']]['list'][$key] = $other[$key];
            $dataInfo[$goods['uid']]['list'][$key]['goods_id']             = $goods['id'];
            $dataInfo[$goods['uid']]['list'][$key]['title']                = $goods['title'];
            $dataInfo[$goods['uid']]['list'][$key]['thumb']                = $goods['thumb'];
            $dataInfo[$goods['uid']]['list'][$key]['price_original']       = $dataInfo[$goods['uid']]['list'][$key]['price']       = $goods['price'];

            $dataInfo[$goods['uid']]['data']['acount_original'] += floatval($goods['price']);

            $myCar = table('MyCar')->where(array('id' => $other[$key]['my_car_id'], 'del_status' => 0))->find();
            //echo table('MyCar')->getSql();
            if (!$myCar) {
                return false;
            }

            $dataInfo[$goods['uid']]['list'][$key]['brand']        = dao('Category')->getName($myCar['brand']);
            $dataInfo[$goods['uid']]['list'][$key]['style']        = $myCar['style'];
            $dataInfo[$goods['uid']]['list'][$key]['produce_time'] = $myCar['produce_time'];
            $dataInfo[$goods['uid']]['list'][$key]['buy_time']     = $myCar['buy_time'];
            $dataInfo[$goods['uid']]['list'][$key]['mileage']      = $myCar['mileage'];

            unset($dataInfo[$goods['uid']]['list'][$key]['my_car_id']);
        }

        return $dataInfo;
    }
}
