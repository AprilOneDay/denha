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
        //定时任务关闭超过预约时间的订单
        dao('Orders', 'app')->changeOrdersStatus(0, $this->uid);

        $type        = get('type', 'intval', 1);
        $orderStatus = get('order_status', 'intval', 0);
        $pageNo      = get('pageNo', 'intval', 1);
        $pageSize    = get('pageSize', 'intval', 10);

        $offer = max(($pageNo - 1), 0) * $pageSize;

        $map['seller_uid'] = $this->uid;
        $map['del_seller'] = 0;
        if ($orderStatus) {
            if ($orderStatus == 3) {
                $map['order_status'] = array('>=', $orderStatus);
            } elseif ($orderStatus == 1) {
                $map['order_status'] = 1;
                $map['status']       = array('in', '0,2');
            } else {
                $map['order_status'] = $orderStatus;
            }
        }

        if ($type) {
            $map['type'] = $type;
        }

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

        $map['seller_uid'] = $this->uid;
        $map['order_sn']   = $orderSn;

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
     * 卖家同意预约时间
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

        $map['seller_uid']   = $this->uid;
        $map['order_sn']     = $orderSn;
        $map['status']       = 0;
        $map['order_status'] = 1;

        $orders = table('Orders')->where($map)->field('id,type,uid,order_sn')->find();
        //echo table('Orders')->getSql();die;
        if (!$orders['id']) {
            $this->appReturn(array('status' => false, 'msg' => '可操作信息不存在'));
        }

        $seller = table('User')->where('id', $this->uid)->field('nickname,mobile')->find();

        $data['status']       = 1;
        $data['pass_time']    = TIME;
        $data['order_status'] = 2;

        $result = table('Orders')->where('id', $orders['id'])->save($data);
        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '执行失败'));
        }

        //发送站内信
        $sendData = array(
            'nickname' => $seller['nickname'],
            'mobile'   => $seller['mobile'],
        );

        $messageType = $orders['type'] == 1 ? 2 : 3;
        $jumpData    = array('type' => $messageType, 'order_sn' => $orders['order_sn']);

        dao('Message')->send($orders['uid'], 'user_appointment_success', $sendData, $jumpData);

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

        $map['seller_uid'] = $this->uid;
        $map['order_sn']   = $orderSn;
        $map['status']     = 3;

        $id = table('Orders')->where($map)->field('id')->find('one');
        if (!$id) {
            $this->appReturn(array('status' => false, 'msg' => '可操作信息不存在'));
        }

        $result = table('Orders')->where('id', $id)->save('del_seller', 1);
        if (!$result) {
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

        $map['seller_uid'] = $this->uid;
        $map['order_sn']   = $orderSn;
        $map['status']     = 0;

        $orders = table('Orders')->where($map)->field('id,order_sn,uid,type')->find();
        if (!$orders) {
            $this->appReturn(array('status' => false, 'msg' => '可操作信息不存在'));
        }

        $seller = table('User')->where('id', $this->uid)->field('nickname,mobile')->find();

        //发送站内信参数
        $sendData = array(
            'nickname' => $seller['nickname'],
            'mobile'   => $seller['mobile'],
        );
        //站内信跳转参数
        $messageType = $orders['type'] == 1 ? 2 : 3;
        $jumpData    = array('type' => $messageType, 'order_sn' => $orders['order_sn']);

        //另选时间
        if ($startTime) {

            $dataInfo['start_time'] = $startTime;
            $dataInfo['end_time']   = $endTime;

            $data['status']         = 2;
            $data['seller_message'] = $sellerMessage;
            $date['status_time']    = TIME;

            $result = table('Orders')->where('id', $orders['id'])->save($data);
            if (!$result) {
                $this->appReturn(array('status' => false, 'msg' => '执行失败'));
            }
            if ($orders['type'] == 1) {
                $result = table('OrdersCar')->where('order_sn', $orderSn)->save($dataInfo);
            } else {
                $result = table('OrdersService')->where('order_sn', $orderSn)->save($dataInfo);
            }

            if (!$result) {
                $this->appReturn(array('status' => false, 'msg' => '修改时间执行失败'));
            }

            dao('Message')->send($orders['uid'], 'user_appointment_edit_time', $sendData, $jumpData);

            $this->appReturn(array('status' => true, 'msg' => '操作完成'));
        }
        //直接拒绝
        else {
            $data['status']         = 3;
            $data['seller_message'] = $sellerMessage;

            $result = table('Orders')->where('id', $orders['id'])->save($data);
            if (!$result) {
                $this->appReturn(array('status' => false, 'msg' => '执行失败'));
            }

            dao('Message')->send($orders['uid'], 'user_appointment_fail', $sendData, $jumpData);
        }

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

        $map['seller_uid']   = $this->uid;
        $map['order_sn']     = $orderSn;
        $map['status']       = 1;
        $map['order_status'] = 2;

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
     * 完成订单
     * @date   2017-09-27T15:20:59+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function success()
    {
        $orderSn = post('order_sn', 'text', '');
        $price   = post('acount', 'float', 0);

        if (!$orderSn) {
            $this->appReturn(array('status' => false, 'msg' => '订单编号错误'));
        }

        if (!$price) {
            $this->appReturn(array('status' => false, 'msg' => '输入实付金额'));
        }

        $map['order_sn']     = $orderSn;
        $map['seller_uid']   = $this->uid;
        $map['status']       = 1;
        $map['order_status'] = 2;

        $orders = table('Orders')->where($map)->field('acount,acount_original,uid,type')->find();

        if (!$orders) {
            $this->appReturn(array('status' => false, 'msg' => '信息不存在'));
        }

        //获取订单类型
        if ($orders['type'] == 1) {
            $type       = 23;
            $ordersData = table('OrdersCar')->where('order_sn', $orderSn)->field('goods_id')->find();
        } else {
            $ordersData = table('OrdersService')->where('order_sn', $orderSn)->field('type,goods_id')->find();
            $type       = $ordersData['type'];
        }

        $data['acount']       = $price;
        $data['success_time'] = TIME;
        $data['order_status'] = 4; //直接进入待评价 去掉用户确认功能

        $result = table('Orders')->where('order_sn', $orderSn)->save($data);
        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '操作失败'));
        }

        //增加服务订单销售数量
        if ($orders['type'] == 2) {
            //增加商品
            table('GoodsService')->where('id', $ordersData['goods_id'])->save(array('orders' => array('add', 1)));
            //增加店铺销售数量
            table('UserShop')->where('uid', $this->uid)->save(array('orders_service' => array('add', 1)));
        }

        //赠送积分
        if ($orders['type'] == 1) {
            dao('Integral')->add($orders['uid'], 'buy_orders_car', $type);
        } elseif ($orders['type'] == 2) {
            dao('Integral')->add($orders['uid'], 'buy_orders_service', $type);
        }

        $this->appReturn(array('status' => true, 'msg' => '操作完成'));
    }

    /**
     * 完成订单旧版
     * @date   2017-09-27T15:20:59+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function successAbandoned()
    {
        if (IS_POST) {
            $orderSn      = post('order_sn', 'text', '');
            $price        = post('price', 'float', 0);
            $couponId     = post('use_coupon_id', 'intval', 0);
            $giftCouponId = post('send_coupon_id', 'intval', 0);

            if (!$orderSn) {
                $this->appReturn(array('status' => false, 'msg' => '订单编号错误'));
            }

            if (!$price) {
                $this->appReturn(array('status' => false, 'msg' => '输入实付金额'));
            }

            $map['order_sn']     = $orderSn;
            $map['seller_uid']   = $this->uid;
            $map['status']       = 1;
            $map['order_status'] = 2;

            $orders = table('Orders')->where($map)->field('acount,acount_original,uid,type')->find();

            if (!$orders) {
                $this->appReturn(array('status' => false, 'msg' => '信息不存在'));
            }

            if ($orders['type'] == 1) {
                $type       = 23;
                $ordersData = table('OrdersCar')->where('order_sn', $orderSn)->field('goods_id')->find();
            } else {
                $ordersData = table('OrdersService')->where('order_sn', $orderSn)->field('type,goods_id')->find();
                $type       = $ordersData['type'];
            }

            //获取可用使用的抵扣券列表
            $canUseCouponList = dao('Coupon')->canUseCouponList($orders['uid'], $orders['acount_original']);
            if ($canUseCouponList) {
                $couponIdArray = $canUseCouponList[$this->uid][$type];
            }

            $couponLog = table('CouponLog')->tableName();
            $coupon    = table('Coupon')->tableName();

            $couponMap[$couponLog . '.id'] = array('in', $couponIdArray);
            $couponList                    = dao('Coupon')->lists($couponMap);

            //print_r($couponIdArray);die;

            //使用抵扣券
            if ($couponId) {
                if (!in_array($couponId, $couponIdArray)) {
                    $this->appReturn(array('status' => false, 'msg' => '使用的抵扣券不存在'));
                }
                $couponDetail = dao('Coupon')->logDetail($couponId);
                if ($couponDetail) {
                    if ($couponDetail['type'] == 1) {
                        $data['acount'] = $price - $couponDetail['less'];
                    } elseif ($couponDetail['type'] == 2) {
                        $data['acount'] = $price * $couponDetail['discount'] / 10;
                    }
                    //优惠金额
                    $data['coupon_price'] = max($price - $data['acount'], 0);
                }
            } else {
                $data['acount'] = $price;
            }

            if (!$data['acount']) {
                $this->appReturn(array('status' => false, 'msg' => '实付价格不能为0'));
            }

            //更改订单状态
            $data['success_time'] = TIME;
            $data['order_status'] = 3;

            table('Orders')->startTrans();
            //保存订单信息
            $result = table('Orders')->where('order_sn', $orderSn)->save($data);
            if (!$result) {
                table('Orders')->rollback();
                $this->appReturn(array('status' => false, 'msg' => '操作失败'));
            }

            //修改抵扣券信息
            if ($couponId) {
                $dataCoupon['use_time'] = TIME;
                $dataCoupon['order_sn'] = $orderSn;

                $result = table('CouponLog')->where('id', $couponId)->save($dataCoupon);
                if (!$result) {
                    table('Orders')->rollback();
                    $this->appReturn(array('status' => false, 'msg' => '抵扣券保存失败,请重新尝试'));
                }
            }

            //赠送抵扣券
            if ($giftCouponId) {

                $mapCoupon['uid'] = $this->uid;
                $mapCoupon['id']  = $giftCouponId;

                $coupon = table('Coupon')->where($mapCoupon)->field('id,end_time,remainder_num,status,version')->find();
                //echo table('Coupon')->getSql();die;
                if (!$coupon) {
                    table('Orders')->rollback();
                    $this->appReturn(array('status' => false, 'msg' => '赠送抵扣券不存在'));
                }

                if (!$coupon['status']) {
                    $this->appReturn(array('status' => false, 'msg' => '抵扣券已关闭,请开启后赠送'));
                }

                if ($coupon['end_time'] <= TIME) {
                    $this->appReturn(array('status' => false, 'msg' => '抵扣券已过期'));
                }

                if (!$coupon['remainder_num']) {
                    $this->appReturn(array('status' => false, 'msg' => '抵扣券不足,请增加抵扣券数量'));
                }

                $mapCoupon['end_time']      = array('>=', TIME);
                $mapCoupon['remainder_num'] = array('>', 0);

                //赠送抵扣卷记录
                $dataSendCoupon['created']  = TIME;
                $dataSendCoupon['type']     = 1;
                $dataSendCoupon['order_sn'] = $orderSn;
                $dataSendCoupon['uid']      = $orders['uid'];
                $dataSendCoupon['value']    = $giftCouponId;

                $result = table('Gift')->add($dataSendCoupon);
                if (!$result) {
                    table('Orders')->rollback();
                    $this->appReturn(array('status' => false, 'msg' => '抵扣券赠送失败', 'sql' => table('Gift')->getSql()));
                }

                //修改商户抵扣券记录
                $dataUserCoupon['remainder_num'] = array('less', 1);
                $dataUserCoupon['version']       = array('add', 1);

                $resultCoupon = table('Coupon')->where(array('id' => $coupon['id'], 'version' => $coupon['version']))->save($dataUserCoupon);
                if (!$resultCoupon) {
                    table('User')->rollback();
                    $this->appReturn(array('status' => false, 'msg' => '抵扣券库存异常,请稍后尝试'));
                }

                //发送站内信提示
                dao('Message')->send($orders['uid'], 'user_get_coupon', array(), array('type' => 2, 'order_sn' => $orderSn));
            }

            //汽车商品下架
            if ($orders['type'] == 1) {
                $goodsResult = table('GoodsCar')->where('id', $ordersData['goods_id'])->save('status', 2);
                if (!$goodsResult) {
                    table('User')->rollback();
                    $this->appReturn(array('status' => false, 'msg' => '汽车下架失败'));
                }
            }

            table('Orders')->commit();

            //增加佣金财务记录
            $money = dao('Percentage')->getOnePercentage($orderSn);
            if ($money) {
                dao('Finance')->add(1, $money, $orderSn, 0);
            }

            $this->appReturn(array('msg' => '操作完成'));
        }
        //显示完成信息
        else {
            $orderSn  = get('order_sn', 'text', '');
            $price    = get('price', 'float', 0);
            $couponId = get('use_coupon_id', 'intval', 0);

            if (!$orderSn) {
                $this->appReturn(array('status' => false, 'msg' => '订单编号错误'));
            }

            $map['order_sn']     = $orderSn;
            $map['seller_uid']   = $this->uid;
            $map['status']       = 1;
            $map['order_status'] = 2;

            //获取可用抵扣券列表
            $orders = table('Orders')->where($map)->field('acount,acount_original,uid,type')->find();
            if (!$orders) {
                $this->appReturn(array('status' => false, 'msg' => '信息不存在'));
            }

            if ($orders['type'] == 1) {
                $type = 23;
            } else {
                $type = table('OrdersService')->where('order_sn', $orderSn)->field('type')->find('one');
            }
            $canUseCouponList = dao('Coupon')->canUseCouponList($orders['uid'], $orders['acount_original']);
            if ($canUseCouponList) {
                $couponIdArray = $canUseCouponList[$this->uid][$type];
            }

            $couponLog = table('CouponLog')->tableName();
            $coupon    = table('Coupon')->tableName();

            $couponMap[$couponLog . '.id'] = array('in', $couponIdArray);
            $couponList                    = dao('Coupon')->lists($couponMap);

            $data['use_coupon_id'] = $couponId;
            $data['price']         = $data['acount']         = $price ? sprintf('%.2f', $price) : sprintf('%.2f', $orders['acount_original']);
            $data['coupon_list']   = $couponList;

            //使用抵扣券
            if ($couponId && in_array($couponId, $couponIdArray)) {
                $couponDetail = dao('Coupon')->logDetail($couponId);
                if ($couponDetail) {
                    if ($couponDetail['type'] == 1) {
                        $data['acount'] = sprintf('%.2f', $data['price'] - $couponDetail['less']);
                    } elseif ($couponDetail['type'] == 2) {
                        $data['acount'] = sprintf('%.2f', $data['price'] * $couponDetail['discount'] / 10);
                    }
                }
            }

            $this->appReturn(array('data' => $data));
        }

    }

    /**
     * 新增临时订单
     * @date   2017-09-28T09:32:50+0800
     * @author ChenMingjiang
     */
    public function add()
    {
        $data['start_time'] = post('start_time', 'intval', 0);
        $data['end_time']   = post('end_time', 'intval', 0);

        $id     = post('id', 'intval', 0);
        $origin = post('origin', 'intval', 0);
        $acount = post('price', 'intval', 0);
        $type   = post('type', 'intval', 0);

        $message = post('message', 'text', '');

        $version = APP_VERSION;

        if (!$id) {
            $this->appReturn(array('status' => false, 'msg' => '参数错误'));
        }

        if (!$type || !in_array($type, array(1, 2))) {
            $this->appReturn(array('status' => false, 'msg' => '请选择type类型'));
        }

        if ($type == 1) {
            $isGoods = table('GoodsCar')->where(array('uid' => $this->uid, 'id' => $id))->field('id,status')->find();
        } else {
            $isGoods = table('GoodsService')->where(array('uid' => $this->uid, 'id' => $id))->field('id,status')->find();
        }

        if (!$isGoods) {
            $this->appReturn(array('status' => false, 'msg' => '信息不存在'));
        }

        if ($isGoods['status'] == 2) {
            $this->appReturn(array('status' => false, 'msg' => '该商品已下架'));
        }

        $dataInfo = dao('Orders')->getAddAttachedInfo($type, $id, $data);

        if (!$dataInfo) {
            $this->appReturn(array('status' => false, 'msg' => 'dataInfo参数错误'));
        }

        $data = array();

        //sellserUid => 商品lists
        foreach ($dataInfo as $key => $value) {
            $orderSn = dao('Orders')->createOrderSn();

            $data['is_temp']         = 1;
            $data['uid']             = 0;
            $data['type']            = $type;
            $data['status']          = 1;
            $data['order_status']    = 3;
            $data['origin']          = $origin;
            $data['version']         = $version;
            $data['seller_uid']      = $key;
            $data['order_sn']        = $orderSn;
            $data['message']         = $message;
            $data['acount_original'] = $value['data']['acount_original'];
            $data['acount']          = !$acount ? $data['acount_original'] : $acount;
            $data['coupon_price']    = 0;
            $data['fare_price']      = 0;
            $data['created']         = $data['success_time']         = $data['pass_time']         = TIME;

            table('Orders')->startTrans();
            $orderId = table('Orders')->add($data);

            if (!$orderId) {
                table('Orders')->rollback();
                $this->appReturn(array('status' => false, 'msg' => '保存订单失败'));
            }

            foreach ($value['list'] as $k => $v) {
                $goodsInfo             = $v;
                $goodsInfo['order_sn'] = $orderSn;

                if ($type == 1) {
                    $result = table('OrdersCar')->add($goodsInfo);
                } else {
                    $result = table('OrdersService')->add($goodsInfo);
                }

                if (!$result) {
                    table('Orders')->rollback();
                    $this->appReturn(array('status' => false, 'msg' => '保存附属信息有误'));
                }

            }

        }

        table('Orders')->commit();
        $this->appReturn(array('status' => true, 'msg' => '操作成功'));
    }

}
