<?php
namespace app\tools\dao;

class Coupon
{
    public function add($uid = 0, $param = array())
    {
        $data['uid']        = $uid;
        $data['category']   = (int) $param['category'];
        $data['type']       = (int) $param['type'];
        $data['start_time'] = (int) $param['start_time'];
        $data['end_time']   = (int) $param['end_time'];
        $data['num']        = (int) $param['num'];
        $data['title']      = (string) $param['title'];
        $data['created']    = TIME;
        if (!$data['title']) {
            return array('stauts' => false, 'msg' => '请输入抵扣卷名称');
        }

        if (!$data['title']) {
            return array('stauts' => false, 'msg' => '请输入抵扣卷名称');
        }

        if (!$data['start_time'] || !$data['end_time']) {
            return array('stauts' => false, 'msg' => '请输入完整的抵扣卷生效时间');
        }

        if (!$data['type']) {
            return array('stauts' => false, 'msg' => '请选择抵扣卷类型');
        }

        if ($data['type'] == 1) {

            $data['full'] = (int) $param['full'];
            $data['less'] = (int) $param['less'];

            if (!$data['less']) {
                return array('stauts' => false, 'msg' => '请输入抵扣金额');
            }

        } else {
            $data['discount'] = (int) $param['discount'];
            if (!$data['discount']) {
                return array('stauts' => false, 'msg' => '请输入折扣值');
            }

            if ($data['discount'] >= 10) {
                return array('stauts' => false, 'msg' => '最多9.9折');
            }

            if ($data['discount'] < 1) {
                return array('stauts' => false, 'msg' => '最少9.9折');
            }
        }

        $result = table('Coupon')->add($data);
        if (!$result) {
            return array('stauts' => false, 'msg' => '创建失败');
        }

        return array('stauts' => true, 'msg' => '创建成功');
    }

}
