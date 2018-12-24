<?php
/**
 * 前台用户管理
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

        $model = getVar('type', 'admin.model');

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

        $field = 'id,type,uid,seller_uid,order_sn,account,created,model_id,type,origin';

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

            $tableData = 'OrdersData' . $model[$value['model_id']]['db'];
            $goodsData = table($tableData)->where('order_sn', $value['order_sn'])->select();

            $value['goodsList'] = $goodsData;
            return $value;
        }, $list);

        $other = [
            'typeLogCopy'     => ['1' => '创建订单', '2' => '支付完成', '3' => '订单派送', '4' => '订单送达', '5' => '申请退款', '6' => '同意退款', '7' => '订单已取消', '8' => '拒绝退款'],
            'typeCopy'        => getVar('type', 'admin.orders'),
            'originCopy'      => getVar('origin', 'admin.orders'),
            'orderStatusCopy' => ['1' => '待确认', '2' => '待完成', '3' => '已完成', '4' => '待评价', '5' => '已评价'],
            'statusCopy'      => ['1' => '审核通过', '0' => '代审核', '2' => '另设时间', '3' => '直接拒绝'],
            'isTempCopy'      => ['0' => '正常订单', '1' => '临时订单'],
            'userTypeCopy'    => ['1' => '个人', '2' => '商家'],
        ];

        $this->assign('commission', dao('Param')->getValue(1));
        $this->assign('list', $list);
        $this->assign('other', $other);
        $this->assign('param', $param);
        $this->assign('pages', $page->loadConsole());
        $this->show();
    }

    public function detail()
    {
        $orderSn = get('order_sn', 'text', '');
        if (!$orderSn) {
            $this->appReturn(array('status' => false, 'msg' => '参数错误'));
        }

        $map['order_sn'] = $orderSn;

        $result = dao('Orders')->detail($map);
        if (!$result['status']) {
            $this->appReturn($result);
        }

        $data = $result['data'];

        foreach ($data['goods'] as $key => $value) {
            $data['goods'][$key]['thumb'] = imgUrl($value['thumb'], 'car');
        }

        $other = array(
            'typeCopy'        => getVar('type', 'admin.orders'),
            'originCopy'      => getVar('origin', 'admin.orders'),
            'orderStatusCopy' => array('1' => '待确认', '2' => '待完成', '3' => '已完成', '4' => '已评价'),
            'statusCopy'      => array('1' => '审核通过', '0' => '代审核', '2' => '另设时间', '3' => '直接拒绝'),
            'isTempCopy'      => array('0' => '正常订单', '1' => '临时订单'),
        );

        $this->assign('other', $other);
        $this->assign('data', $data);
        $this->show();
    }

    /**
     * 结算佣金
     * @date   2017-10-13T11:12:52+0800
     * @author ChenMingjiang
     */
    public function clearingCommission()
    {
        $orderSn = post('order_sn', 'text', '');
        if (!$orderSn) {
            $this->appReturn(array('status' => false, 'msg' => '参数错误'));
        }

        $money = dao('Percentage')->getOnePercentage($orderSn);
        if (!$money) {
            $this->appReturn(array('status' => false, 'msg' => '佣金异常'));
        }

        //修改状态
        $result = table('Orders')->where('order_sn', $orderSn)->save('is_percentage', 1);
        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '结算异常'));
        }

        $map['type']    = 1;
        $map['content'] = $orderSn;

        //增加财务记录
        dao('Finance')->add(1, $money, $orderSn, 1);

        $this->appReturn(array('msg' => '结算成功'));

    }
}
