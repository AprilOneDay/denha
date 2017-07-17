<?php
//订单列表
class Orders extends base
{

    /**
     * 预约挂号订单列表
     * @date   2017-07-09T16:40:10+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function listDoctor()
    {
        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 100);
        $field    = get('field', 'text', '');
        $keyword  = get('keyword', 'text', '');

        $offer         = ($pageNo - 1) * $pageSize;
        $statusCopy    = array('0' => '待审核', '1' => '已审核');
        $logisticsCopy = array('1' => '待处理', '2' => '待接见', '3' => '已完成', '4' => '已退款');

        $to = table('orders')->tableName();
        $td = table('orders_doctor')->tableName();

        $param = array();

        if ($field && $keyword) {
            if ($field == 'order_sn') {
                $map[$to . '.order_sn'] = $keyword;
            }

            $param['field']   = $field;
            $param['keyword'] = $keyword;
        }

        $map[$to . '.type'] = 2;

        $total = table('orders')->join($td, "$to.order_sn = $td.order_sn", 'left')->where($map)->count();
        $page  = new page();
        $page->pages($total, $pageNo, $pageSize, url('list_doctor', $param), 5);
        $loadPage = $page->loadConsole();

        $list = table('orders')->join($td, "$to.order_sn = $td.order_sn", 'left')->where($map)->limit($offer, $pageSize)->find('array');
        if ($list) {
            foreach ($list as $key => $value) {
                $list[$key]['data'] = table('orders_doctor')->where(array('order_sn' => $value['order_sn']))->field('doctor,keshi,time_copy,hospital,address')->find();

            }
        }

        $this->assign('statusCopy', $statusCopy);
        $this->assign('logisticsCopy', $logisticsCopy);

        $this->assign('param', $param);
        $this->assign('list', $list);
        $this->assign('pages', $loadPage);
        $this->show('/console/orders/list_doctor');
    }

    /**
     * 挂号预约详情
     * @date   2017-07-09T11:39:33+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function detailDoctor()
    {

        $orderSn = get('order_sn', 'trim');

        if (!$orderSn) {
            die('提交信息有误');
        }

        $map['type']     = 2;
        $map['order_sn'] = $orderSn;

        $orders = table('orders')->where($map)->field('order_sn,name,mobile,code,amount,logistics_status')->find();
        if (!$orders) {
            die('未查询相关信息');
        }

        $orders['data'] = table('orders_doctor')->where(array('order_sn' => $orders['order_sn']))->field('doctor,keshi,time_copy,address,hospital')->find();

        $this->assign('orders', $orders);

        $this->show('/console/orders/detail_doctor');

    }

    /**
     * 预约病房订单列表
     * @date   2017-07-06T11:23:18+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function listHospital()
    {
        $page = new page();

        $isApply  = get('is_apply', 'text');
        $type     = get('type', 'intval', 0);
        $yeard    = get('yeard', 'intval', 0);
        $field    = get('field', 'text', '');
        $keyword  = get('keyword', 'text', '');
        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 100);

        $offer = ($pageNo - 1) * $pageSize;
        $param = array();

        $map['yeard'] = date('Y');
        if ($type) {
            $map['type']   = $type;
            $param['type'] = $type;
        }

        if ($isApply != '') {
            $map['is_apply']   = $isApply;
            $param['is_apply'] = $isApply;
        }

        if ($yeard) {
            $map['yeard']   = $yeard;
            $param['yeard'] = $yeard;
        }

        if ($field && $keyword) {
            $param['field']   = $field;
            $param['keyword'] = $keyword;
        }

        $total = table('cqks_credit', false)->where($map)->count();
        $page->pages($total, $pageNo, $pageSize, url('lists', $param), 5);
        $loadPage = $page->loadConsole();

        $list = table('cqks_credit', false)->where($map)->order('is_apply asc')->limit($offer, $pageSize)->find('array');
        if ($list) {
            foreach ($list as $key => $value) {
                $list[$key]['user'] = table('cqks_yh', false)->where(array('bh' => $value['uid']))->field('yy,xm')->find();
            }
        }

        $statusCopy = array('1' => '通过', '0' => '未通过');
        $typeCopy   = array('1' => 'I类', '2' => 'II类');
        $applyCopy  = array('1' => '已申请', '0' => '未申请');

        $this->assign('statusCopy', $statusCopy);
        $this->assign('typeCopy', $typeCopy);
        $this->assign('applyCopy', $applyCopy);
        $this->assign('yearCopy', $yearCopy);

        $this->assign('isApply', $isApply);
        $this->assign('field', $field);
        $this->assign('keyword', $keyword);
        $this->assign('yeard', $yeard);
        $this->assign('type', $type);
        $this->assign('list', $list);
        $this->assign('pages', $loadPage);
        $this->show('/console/credit/list');
    }

    public function updateCredit()
    {
        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 100);

        $offer = ($pageNo - 1) * $pageSize;

        $list = table('cqks_fs', false)->limit($offer, $pageSize)->find('array');
        $i    = 0;
        if ($list) {
            foreach ($list as $key => $value) {

                $data['uid']     = $value['yhbh'];
                $data['status']  = $value['state'] == 'true' ? 1 : 0;
                $data['code']    = $value['kjbh'];
                $data['created'] = strtotime($value['sj']);
                $data['yeard']   = substr($value['sj'], 0, 4);
                $data['credit']  = table('cqks_kj')->where(array('bh' => $value['yhbh']))->field('xf')->find('one');

                if ($data['status'] == 1) {
                    $data['post_time'] = $data['created'];
                }

                $is = table('cqks_credit', false)->where(array('uid' => $data['uid'], 'code' => $data['code'], 'yeard' => $data['yeard'], 'status' => $data['status']))->field('id')->find('one');

                if (!$is) {
                    table('cqks_credit', false)->add($data);
                    $i++;
                }

            }
        }

        header("refresh:5;url=/frame/index.php?m=console&c=credit&a=update_credit&pageNo=" . ($pageNo + 1));
        print('正在加载，请稍等...<br>5秒后自动跳转到第' . ($pageNo + 1) . '页,共执行' . $i . '条记录<br/>');

    }
}
