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
     * @param  array                    $mapParam [字段筛选]
     * @param  integer                  $type     [log类型]
     * @param  string                   $field    [请求字段]
     * @return [type]                   [description]
     */
    public function getSql($mapParam = [], $type = 0, $field = '')
    {
        $ot  = table('Orders')->getTableName();
        $olt = table('OrdersLog')->getTableName();

        $map[$olt . '.is_new'] = 1;
        if ($type) {
            $map[$olt . '.type'] = ['in', $type];
        }
        foreach ($mapParam as $fields => $value) {
            if ($fields == 'type') {
                $map[$olt . '.type'] = $value;
            } else {
                $map[$ot . '.' . $fields] = $value;
            }
        }

        $field = $field == '*' || !$field ? '' : explode(',', $field);

        if (is_array($field)) {
            foreach ($field as $key => $value) {
                if ($value == 'type') {
                    $field[$key] = $olt . '.' . $value;
                } else {
                    $field[$key] = $ot . '.' . $value;
                }
            }
        }

        $this->ot    = $ot;
        $this->olt   = $olt;
        $this->map   = $map;
        $this->field = $field;

        return $this;
    }

    public function getList($pageNo = 1, $pageSize = 20, $orderBy = '')
    {
        $offer = max(($pageNo - 1) * $pageSize, 0);

        $list = table('Orders')->join($this->olt, "{$this->olt}.order_sn = {$this->ot}.order_sn")->where($this->map)->field($this->field)->limit($offer, $pageSize)->order("{$this->ot}.created desc")->select();

        return $list ? $list : [];
    }

    public function count()
    {

        $count = (int) table('Orders')->join($this->olt, "{$this->olt}.order_sn = {$this->ot}.order_sn")->where($this->map)->count();

        return $count;
    }

    public function getColumn($pageNo = 1, $pageSize = 20, $orderBy = '')
    {

        $list = table('Orders')->join($this->olt, "{$this->olt}.order_sn = {$this->ot}.order_sn")->where($this->map)->field($this->field)->order("{$this->ot}.created desc")->column();

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
        $nums['daifukuan']  = $this->getSql($map, 1)->count();
        $nums['daifahuo']   = $this->getSql($map, 2)->count();
        $nums['yifahuo']    = $this->getSql($map, 3)->count();
        $nums['yiwancheng'] = $this->getSql($map, 4)->count();

        return $nums;
    }
}
