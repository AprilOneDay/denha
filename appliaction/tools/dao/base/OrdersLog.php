<?php
/**
 * 文章相关信息
 */
namespace dao\base;

class OrdersLog
{

    public function add($uid, $orderSn, $type)
    {
        if (!$uid || !$orderSn || !$type) {
            return false;
        }

        $orderSnArray = is_array($orderSn) ? $orderSn : (array) $orderSn;

        foreach ($orderSnArray as $key => $value) {
            if ($value) {
                $data[] = [
                    'uid'      => $uid,
                    'order_sn' => $value,
                    'type'     => $type,
                    'created'  => TIME,
                    'is_new'   => 1,
                ];
            }
        }

        $map             = [];
        $map['order_sn'] = ['in', $orderSn];
        $map['is_new']   = 1;
        $result          = table('OrdersLog')->where($map)->save('is_new', 0);

        $result = table('OrdersLog')->addAll($data);
        $result = table('Orders')->where(['order_sn' => ['in', $orderSn]])->save('status', $type);

        if ($result === false) {
            return false;
        }

        return true;

    }

    /** 获取订单最新状态 */
    public function getNewStatus($orderSn)
    {
        $map             = [];
        $map['order_sn'] = $orderSn;
        $map['is_new']   = 1;

        $status = (int) table('OrdersLog')->where($map)->value('type');

        return $status;
    }

    /** 修复is_new */
    public function repairFieldIsNew($pageNo = 0, $pageSize = 100)
    {
        $offer = max(($pageNo - 1) * $pageSize, 0);

        $map['is_new'] = 1;

        //获取异常数据
        $list = table('OrdersLog')->where($map)->field("count(id) as num,order_sn,max(id) as id")->group('concat(is_new,order_sn) HAVING num > 1')->select();

        if ($list) {
            foreach ($list as $key => $value) {
                //关闭全部状态
                table('OrdersLog')->where('order_sn', $value['order_sn'])->save('is_new', 0);
                //开启最新状态
                table('OrdersLog')->where('id', $value['id'])->save('is_new', 1);
            }
        }

    }
}
