<?php
/**
 * 订单模块管理
 */
namespace app\admin\content;

use app\admin\Init;
use denha\Pages;

class Orders extends Init
{
    public function lists()
    {
        $param    = get('param', 'text');
        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 25);

        $model = getVar('admin.model.type');

        $search = $map = [];

        if (!empty($param['origin'])) {
            $search['param[origin]'] = $map['origin'] = $param['origin'];
        }

        if (!empty($param['type'])) {
            $search['param[type]'] = $type = $param['type'];
        } else {
            $type = '0';
        }

        if (!empty($param['field']) && !empty($param['keyword'])) {

            $search['param[keyword]'] = $param['keyword'];
            $search['param[field]']   = $param['field'];

            if ($param['field'] == 'order_sn') {
                $map['order_sn'] = $param['keyword'];
            }
        }

        $field = 'id,uid,seller_uid,order_sn,account,created,model_id,origin,status';

        $list  = dao('Orders')->getSql($map, $type, $field)->getList($pageNo, $pageSize);
        $count = dao('Orders')->getSql($map, $type)->count();
        $page  = new Pages($count, $pageNo, $pageSize, url('', $search));

        $list = array_map(function ($value) use ($model) {
            if (!$value['seller_uid']) {
                $value['seller']['nickname'] = '商家自营';
            } else {
                $seller          = dao('User')->getInfo($value['seller_uid'], 'nickname,type');
                $value['seller'] = $seller;
            }

            $user['nickname'] = dao('User')->getNickname($value['uid']);
            $value['user']    = $user;

            $tableData = 'Orders' . $model[$value['model_id']]['db'];
            $goodsData = table($tableData)->where('order_sn', $value['order_sn'])->select();

            foreach ($goodsData as $key => $item) {

                $refund = table('orders_refund')->where('order_sn', $value['order_sn'])->where('goods_id', $item['goods_id'])->order('id desc')->find();

                $goodsData[$key]['status_copy'] = $refund ? '<font color="red">' . dao('Category')->getName($refund['status']) . '</font>' : '正常';
                $goodsData[$key]['refund']      = $refund ? $refund : [];

            }

            $value['goodsList'] = $goodsData;
            return $value;
        }, $list);

        $other = [
            'statusCopy' => dao('Category')->getList(1184),
            'typeCopy'   => getVar('admin.orders.type'),
            'originCopy' => getVar('admin.orders.origin'),
        ];

        $this->show('', ['list' => $list, 'other' => $other, 'param' => $param, 'pages' => $page->loadConsole(), 'search' => $search]);
    }

    public function detail()
    {
        $orderSn = get('order_sn', 'text', '');
        if (!$orderSn) {
            $this->ajaxReturn(['status' => false, 'msg' => '参数错误']);
        }

        $map['order_sn'] = $orderSn;

        $result = dao('Orders')->detail($map);
        if (!$result['status']) {
            $this->ajaxReturn($result);
        }

        $data = $result['data'];

        foreach ($data['goods'] as $key => $value) {
            $data['goods'][$key]['thumb'] = imgUrl($value['thumb'], 'car');
        }

        $other = [
            'typeCopy'        => getVar('admin.orders.type'),
            'originCopy'      => getVar('admin.orders.origin'),
            'orderStatusCopy' => ['1' => '待确认', '2' => '待完成', '3' => '已完成', '4' => '已评价'],
            'statusCopy'      => ['1' => '审核通过', '0' => '代审核', '2' => '另设时间', '3' => '直接拒绝'],
            'isTempCopy'      => ['0' => '正常订单', '1' => '临时订单'],
        ];

        $this->assign('other', $other);
        $this->assign('data', $data);
        $this->show();
    }

    /** 发货页面 */
    public function dispatch()
    {
        $orderSn = get('order_sn', 'text', '');
        $others  = [
            'companies' => dao('Category')->getList('1149'),
        ];

        $this->show('', ['orderSn' => $orderSn, 'others' => $others]);
    }

    /** 开始派单 */
    public function dispatchPost()
    {
        $orderSn = get('order_sn', 'text', '');

        $logisticsId = post('logistics_id', 'intval', 0);
        $trackingSn  = post('tracking_sn', 'text', '');

        if (!$orderSn) {
            $this->ajaxReturn(['status' => false, 'msg' => '参数错误']);
        }

        $status = dao('OrdersLog')->getNewStatus($orderSn);
        if (!in_array($status, [2])) {
            $this->ajaxReturn(['status' => false, 'msg' => '可操作信息不存在']);
        }

        $result = dao('OrdersLog')->add($this->consoleid, $orderSn, 3);
        if ($result === false) {
            $this->ajaxReturn(['status' => false, 'msg' => '执行失败']);
        }

        // 保存物流单号信息
        if ($trackingSn) {
            $result = table('Logistics')->where('order_sn', $orderSn)->save(['tracking_sn' => $trackingSn, 'logistics_id' => $logisticsId]);

            if ($result === false) {
                $this->ajaxReturn(['status' => false, 'msg' => '物流信息保存失败']);
            }
        }

        $this->ajaxReturn(['status' => true, 'msg' => '操作成功']);
    }

    /** 拒绝退款/退货 */
    public function refuseRefund()
    {
        $orderSn = post('order_sn', 'text', '');
        $goodsId = post('goods_id', 'intval', 0);

        if (!$orderSn || !$goodsId) {
            $this->ajaxReturn(['status' => false, 'msg' => '参数错误']);
        }

        $refund = table('orders_refund')->where('order_sn', $orderSn)->field('type,refund_sn,status')->order('id desc')->find();
        // 1232=>买家申请退款/退货
        if ($refund['status'] != 1232) {
            $this->ajaxReturn(['status' => false, 'msg' => '退款申请信息不存在']);
        }

        // 1235=>
        $result = dao('ProcessLog')->add($this->consoleid, 1235, $refund['refund_sn'], ['tables' => array(['OrdersRefund', 'refund_sn', 'status'])]);

        if ($result === false) {
            $this->ajaxReturn(['status' => false, 'msg' => '执行失败']);
        }

        $this->ajaxReturn(['status' => true, 'msg' => '操作成功']);
    }

    /** 同意退款 */
    public function agreeRefund()
    { 
      
        $orderSn = post('order_sn', 'text', '');
        $goodsId = post('goods_id', 'intval', 0);

        if (!$orderSn || !$goodsId) {
            $this->ajaxReturn(['status' => false, 'msg' => '参数错误']);
        }

        // 退款信息状态 1232=>买家申请退款/退货
        $refund = table('orders_refund')->where('order_sn', $orderSn)->order('id desc')->find();
        if ($refund['status'] != 1232) {
            $this->ajaxReturn(['status' => false, 'msg' => '退款申请信息不存在']);
        }

        table('ProcessLog')->startTrans();

        // 1229=>退款退货
        if ($refund['type'] == 1229) {
            // 1234=>商家等待收货
            $result = dao('ProcessLog')->add($this->consoleid, 1234, $refund['refund_sn'], ['tables' => array(['OrdersRefund', 'refund_sn', 'status'])]);

            if ($result === false) {
                table('ProcessLog')->rollback();
                $this->ajaxReturn(['status' => false, 'msg' => '执行失败']);
            }

        } else {
            // 1237=>商家确认收货/退款完成
            $result = dao('ProcessLog')->add($this->consoleid, 1237, $refund['refund_sn'], ['tables' => array(['OrdersRefund', 'refund_sn', 'status'])]);

            if ($result === false) {
                table('ProcessLog')->rollback();
                $this->ajaxReturn(['status' => false, 'msg' => '执行失败']);
            }

            // 执行财务退款操作
            $result = dao('PayBefore')->main(['type' => 1241, 'order_sn' => $refund['refund_sn']], 3, '', ['debug' => false, 'sign' => 'refund']);
            if (!$result['status']) {
                table('ProcessLog')->rollback();
                $this->ajaxReturn($result);
            }

            // 更改退款财务状态
            $result = table('FinanceLog')->where('order_sn', $refund['refund_sn'])->where('type', 1241)->save(['is_pay' => 1, 'is_lock' => 1]);
            if ($result === false) {
                table('ProcessLog')->rollback();
                $this->ajaxReturn(array('status' => false, 'msg' => '退款财务记录修改失败'));
            }

        }

        table('ProcessLog')->commit();

        $this->ajaxReturn($result);
    }

    /** 取消订单 */
    public function close()
    {
        $orderSn = post('order_sn', 'text', '');

        if (!$orderSn) {
            $this->ajaxReturn(['status' => false, 'msg' => '参数错误']);
        }

        $status = dao('OrdersLog')->getNewStatus($orderSn);
        if (!in_array($status, array(1))) {
            $this->ajaxReturn(['status' => false, 'msg' => '可操作信息不存在']);
        }

        $result = dao('OrdersLog')->add($this->consoleid, $orderSn, 7);
        if ($result === false) {
            $this->ajaxReturn(['status' => false, 'msg' => '执行失败']);
        }

        $this->ajaxReturn(['status' => true, 'msg' => '操作成功']);
    }

}
