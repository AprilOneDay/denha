<?php
/**
 * 订单模块
 */
namespace dao\base;

class Orders
{

    public $map   = [];
    public $field = '';
    public $ot    = '';
    public $olt   = '';

    /**
     * 创建18位数字订单号
     */
    public function createOrderSn()
    {
        return date('y') . sprintf('%03d', date('z')) . substr(time(), -5) . substr(microtime(), 2, 5) . sprintf('%03d', rand(0, 999));

    }

    /**
     * 前置搜索条件
     * @date   2018-12-17T15:34:20+0800
     * @author ChenMingjiang
     * @param  array                    $map [字段筛选]
     * @param  integer                  $status     [log类型]
     * @param  string                   $field    [请求字段]
     * @return [type]                   [description]
     */
    public function getSql($map = [], $status = 0, $field = '')
    {

        if ($status) {
            $map['status'] = $status;
        }

        $this->map   = $map;
        $this->field = $field;

        return $this;
    }

    public function getList($pageNo = 1, $pageSize = 20, $orderBy = '')
    {
        $offer = max(($pageNo - 1) * $pageSize, 0);

        $list = table('Orders')->where($this->map)->field($this->field)->limit($offer, $pageSize)->order('created desc')->select();

        return $list ? $list : [];
    }

    public function count()
    {

        $count = (int) table('Orders')->where($this->map)->field($this->field)->count();

        return $count;
    }

    public function getColumn($pageNo = 1, $pageSize = 20, $orderBy = '')
    {

        $list = table('Orders')->where($this->map)->field($this->field)->limit($offer, $pageSize)->order('created desc')->column();

        return $list ? $list : [];
    }

    /**
     * 获取订单数量
     * @date   2018-12-17T15:34:52+0800
     * @author ChenMingjiang
     * @param  [type]                   $uid [description]
     * @return [type]                   [description]
     */
    public function getUserOrdersNum($uid)
    {
        $map['uid']              = $uid;
        $map['del_buyer_status'] = 0;

        $nums['all']        = $this->getSql($map, 0)->count();
        $nums['daifukuan']  = $this->getSql($map, 1185)->count();
        $nums['daifahuo']   = $this->getSql($map, 1186)->count();
        $nums['yifahuo']    = $this->getSql($map, 1187)->count();
        $nums['yiwancheng'] = $this->getSql($map, 1188)->count();

        return $nums;
    }

    public function couponPrice($uid, $couponId = 0, $account = 0)
    {

        $couponLog = table('CouponLog')->getTableName();
        $coupon    = table('Coupon')->getTableName();

        // 未时候 未过期
        $map[$couponLog . '.uid']      = $uid;
        $map[$couponLog . '.use_time'] = 0;
        $map[$couponLog . '.id']       = $couponId;
        $map[$coupon . '.end_time']    = ['>=', TIME];

        $coupon = dao('Coupon')->lists($map, 'zh', 0, 1);

        if (!$coupon) {
            return ['status' => false, 'msg' => '暂无相关抵扣劵'];
        }

        $coupon      = $coupon[0];
        $couponPrice = 0; //抵扣金额

        // 满减
        if ($coupon['type'] == 1) {
            if ($account > $coupon['full']) {
                $couponPrice = $coupon['less'];
            }
        } elseif ($coupon['type'] == 2) {
            $couponPrice = $account * $coupon['discount'] / 10;
        }

        // 抵扣卷id 抵扣金额 抵扣劵文案
        return [$couponId, $couponPrice, $coupon['title']];
    }
}
