<?php
/**
 * 订单列表
 */
namespace app\fastgo\app\controller\v1\user;

use app\app\controller;
use app\fastgo\app\controller\v1\Init;

class Orders extends Init
{
    public function __construct()
    {
        parent::__construct();
        //检测用户登录权限
        $this->checkIndividual('1,2');
    }

    public function lists()
    {
        $type   = get('type', 'text', '');
        $status = get('status', 'text', '');

        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 10);

        $param['keyword']    = get('keyword', 'text', '');
        $param['start_time'] = get('start_time', 'text', '');
        $param['end_time']   = get('end_time', 'text', '');

        $offer = max(($pageNo - 1), 0) * $pageSize;

        $ot = table('Orders')->tableName();
        $lt = table('Logistics')->tableName();

        if ($status != '') {
            $map[$lt . '.status'] = $status;
        }

        if ($time) {
            $map[$lt . '.created'] = array('between', $param['start_time'], $param['end_time']);
        }

        $map[$lt . '.type']         = array('in', $type);
        $map[$ot . '.uid']          = $this->uid;
        $map[$ot . '.order_status'] = 1;
        $map[$ot . '.del_status']   = 0;

        //合并搜索
        if ($param['keyword']) {
            $map['_string'] = "concat($lt.logistics_mobile,$lt.logistics_name,$lt.logistics_code) like '%$param[keyword]%'";
        }

        $field = "$lt.status,$lt.order_sn,$lt.outbound_transport_sn,$lt.outbound_transport_id,$lt.logistics_name,$lt.logistics_address";

        $list = table('Orders')->join($lt, "$ot.order_sn = $lt.order_sn", 'right')->where($map)->field($field)->limit($offer, $pageSize)->find('array');

        foreach ($list as $key => $value) {
            $tips                         = '无运单号';
            $list[$key]['title']          = !$value['status'] ? $tips : $value['order_sn'];
            $list[$key]['package_status'] = 1;

            $orders    = table('Orders')->where('order_sn', $value['order_sn'])->field('is_back,status')->find();
            $goodsList = table('OrdersPackage')->where('order_sn', $value['order_sn'])->find('array');

            //如果包裹商品有不存在的 则状态为 false
            foreach ($goodsList as $k => $v) {
                if (!$v['status']) {
                    $list[$key]['package_status'] = 0;
                }
            }

            //获取转运公司信息
            $list[$key]['logisticsCompany'] = array();
            if ($value['outbound_transport_id']) {
                $logisticsCompany   = dao('Category')->getName($value['outbound_transport_id'], $this->lg);
                $logisticsCompanyNC = dao('Category')->getBname($value['outbound_transport_id']);

                $list[$key]['logisticsCompany'] = array('name' => $logisticsCompany, 'bname' => $logisticsCompanyNC, 'transport_sn' => $value['transport_sn']);
            }

            //是否上传包裹照
            $list[$key]['is_update_ablum'] = $value['user_ablum'] ? 1 : 0;
            //状态文案
            $list[$key]['status_copy'] = $this->ordersStatusCopy($value['status'], $orders['is_back']);
            //状态时间
            $list[$key]['status_time_copy'] = date('Y-m-d H:i', $value['created']);

            $list[$key]['goodsList'] = $goodsList;
            $list[$key]['orders']    = $orders;
        }

        $data['param'] = $param;
        $data['list']  = $list ? $list : array();

        $this->appReturn(array('data' => $data));
    }

    /** 包裹点击完成 */
    public function ordersPackageFinish()
    {
        $orderSn = post('order_sn', 'text', '');

        $map['order_sn'] = $orderSn;
        $map['uid']      = $this->uid;
        $map['status']   = 0;
        $map['type']     = 4;

        $id = table('Orders')->where($map)->field('id')->find('one');
        if (!$id) {
            $this->appReturn(array('status' => false, 'msg' => '信息不存在'));
        }

        $logistics = table('Logistics')->where('order_sn', $orderSn)->field('user_ablum')->find();
        if (!$logistics['user_ablum']) {
            $this->appReturn(array('status' => false, 'msg' => '请先拍照上传'));
        }

        $result = table('Orders')->where('id', $id)->save('status', 1);
        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '操作失败,请稍后重试'));
        }

        $this->appReturn(array('status' => true, 'msg' => '操作成功'));
    }

    /** 用户上传物流包裹照片 */
    public function logisticsUpdateUserAblum()
    {
        $orderSn   = post('order_sn', 'text', '');
        $userAblum = files('user_ablum');

        if (!$userAblum) {
            $this->appReturn(array('status' => false, 'msg' => '请上传照片'));
        }

        $map             = array();
        $map['uid']      = $this->uid;
        $map['order_sn'] = $orderSn;

        $orders = table('OrdersPackage')->where(array('order_sn' => $orderSn))->field('status')->order('status asc')->find();

        if (!$orders['status']) {
            $this->appReturn(array('status' => false, 'msg' => '请先在采购明细中，点击完成采购'));
        }

        $map             = array();
        $map['uid']      = $this->uid;
        $map['order_sn'] = $orderSn;
        $map['status']   = 0;

        $logistics = table('Logistics')->where('order_sn', $orderSn)->field('user_ablum,id')->find();
        if (!$logistics) {
            $this->appReturn(array('status' => false, 'msg' => '可操作信息不存在'));
        }

        $data['user_ablum'] = $this->appUpload($userAblum, '', 'logistics');

        $result = table('Logistics')->where('id', $logistics['id'])->save($data);
        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '操作失败,请稍后重试'));
        }

        $this->appReturn(array('status' => true, 'msg' => '操作成功'));
    }

    /** 申请退件 */
    public function applyOrdersBack()
    {
        $orderSn = post('order_sn', 'text', '');

        $map['order_sn'] = $orderSn;
        $map['uid']      = $this->uid;
        $map['status']   = array('in', '0,1');

        $id = table('Logistics')->where($map)->field('id')->find('one');
        if (!$id) {
            $this->appReturn(array('status' => false, 'msg' => '可操作信息不存在'));
        }

        table('Logistics')->startTrans();
        $result = table('Logistics')->where('id', $id)->save('status', 3);
        if (!$result) {
            table('Logistics')->rollback();
            $this->appReturn(array('status' => false, 'msg' => '物流信息修改失败'));
        }

        $result = table('Orders')->where('order_sn', $orderSn)->save('is_back', 1);
        if (!$result) {
            table('Logistics')->rollback();
            $this->appReturn(array('status' => false, 'msg' => '订单信息修改失败'));
        }

        table('Logistics')->commit();
        $this->appReturn(array('status' => true, 'msg' => '操作成功'));
    }

    /** 用户删除订单 */
    public function del()
    {
        $orderSn = post('order_sn', 'text', '');

        $map['order_sn'] = $orderSn;
        $map['uid']      = $this->uid;
        $map['status']   = array('in', '0, 1');

        $id = table('Logistics')->where($map)->field('id')->find('one');
        if (!$id) {
            $this->appReturn(array('status' => false, 'msg' => '可操作信息不存在'));
        }

        $data['del_uid']    = 1;
        $data['del_status'] = 1;

        $result = table('Orders')->where('id', $id)->save($data);
        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '操作失败,请稍后重试'));
        }

        $this->appReturn(array('status' => true, 'msg' => '操作成功'));

    }

    /** 获取订单状态文案 */
    private function ordersStatusCopy($status = 0, $isBack = 0)
    {

        if ($status == 0) {
            return '待入库';
        } elseif ($status == 1) {
            return '已入库';
        } elseif ($status == 2) {
            return '已出库';
        } elseif ($status == 3) {
            if ($isBack) {
                return '退件';
            }
        }

        return '';
    }
}
