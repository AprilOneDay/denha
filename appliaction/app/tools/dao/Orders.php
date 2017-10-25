<?php
/**
 * 订单模块
 */
namespace app\app\tools\dao;

class Orders
{
    /**
     * 定时任务关闭超过预约时间的订单
     * @date   2017-10-25T15:54:11+0800
     * @author ChenMingjiang
     * @param  integer                  $uid       [description]
     * @param  integer                  $sellerUid [description]
     * @return [type]                              [description]
     */
    public function changeOrdersStatus($uid = 0, $sellerUid = 0)
    {
        if (!$uid && !$sellerUid) {
            return false;
        }

        $map['order_status'] = 1;
        $map['status']       = array('in', '0,2');

        $orderSnArray = array();

        if ($uid) {
            $map['uid'] = $uid;
        }

        if ($sellerUid) {
            $map['seller_uid'] = $sellerUid;
        }

        $list = table('Orders')->where($map)->field('order_sn,type')->find('array');

        if ($list) {
            foreach ($list as $key => $value) {
                //获取还在预约中的订单
                if ($value['type'] == 1) {
                    $startTIME = table('OrdersCar')->where('order_sn', $value['order_sn'])->field('start_time')->find('one');

                    if ($startTIME <= TIME) {
                        $orderSnArray[] = $value['order_sn'];
                    }
                } elseif ($value['type'] == 2) {
                    $startTIME = table('OrdersService')->where('order_sn', $value['order_sn'])->field('start_time')->find('one');
                    if ($startTIME <= TIME) {
                        $orderSnArray[] = $value['order_sn'];
                    }
                }
            }
        }

        //修改预约中的订单为拒绝
        if ($orderSnArray) {
            $map                 = array();
            $map['order_sn']     = array('in', $orderSnArray);
            $map['order_status'] = 1;
            $map['status']       = array('in', '0,2');

            $result = table('Orders')->where($map)->save('status', 3);
            if (!$result) {
                dao('Log')->error(1, '定时任务关闭订单异常！！！');
                return false;
            }
        }

        return true;
    }
}
