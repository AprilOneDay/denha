<?php
class Order extends Init
{
    /**
     * 查询挂号信息
     * @date   2017-07-09T11:39:24+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function indexDoctor()
    {
        $catid = get('catid', 'intval', 0);
        if (!$catid) {
            die('参数错误');
        }

        $templateList = $this->checkedCatid();
        switch ($templateList) {
            case 'default':
                $this->show('/pc/order/index');
                break;
            default:
                break;
        }
    }

    /**
     * 挂号列表
     * @date   2017-07-09T11:39:14+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function listDoctor()
    {
        $catid  = get('catid', 'intval', 0);
        $mobile = get('mobile', 'trim');
        $name   = get('name', 'text');
        $code   = get('code', 'trim');
        if (!$catid) {
            die('参数错误');
        }

        if (!$mobile || !$name || !$code) {
            die('提交信息有误');
        }

        $map['type']   = 2;
        $map['mobile'] = $mobile;
        $map['name']   = $name;
        $map['code']   = $code;

        $list = table('orders')->where($map)->field('order_sn,name,mobile,code,amount,logistics_status')->find('array');
        if (!$list) {
            die('未查询相关信息');
        }

        foreach ($list as $key => $value) {
            $list[$key]['doctor'] = table('orders_doctor')->where(array('order_sn' => $value['order_sn']))->field('doctor,keshi,time_copy,address')->find();
        }

        $templateList = $this->checkedCatid();
        $this->assign('list', $list);
        switch ($templateList) {
            case 'default':
                $this->show('/pc/order/list_doctor');
                break;
            default:
                break;
        }
    }

    /**
     * 挂号预约详情
     * @date   2017-07-09T11:39:33+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function detailDoctor()
    {
        $catid   = get('catid', 'intval', 0);
        $orderSn = get('order_sn', 'trim');

        if (!$catid) {
            die('参数错误');
        }

        if (!$orderSn) {
            die('提交信息有误');
        }

        $templateList = $this->checkedCatid();

        $map['type']     = 2;
        $map['order_sn'] = $orderSn;

        $orders = table('orders')->where($map)->field('order_sn,name,mobile,code,amount,logistics_status')->find();
        if (!$orders) {
            die('未查询相关信息');
        }

        $orders['doctor'] = table('orders_doctor')->where(array('order_sn' => $orders['order_sn']))->field('doctor,keshi,time_copy,address')->find();

        $data = array(
            'data'  => $orders,
            'other' => array(
                'catid' => $catid,
            ),
        );

        $this->assign('orders', $orders);
        switch ($templateList) {
            case 'default':
                $this->show('/pc/order/detail');
                break;
            default:
                break;
        }
    }

    /**
     * Ajax订单详情数据
     * @date   2017-07-05T14:35:07+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function getDetailDoctor()
    {
        $catid  = get('catid', 'intval', 0);
        $mobile = get('mobile', 'trim');
        $name   = get('name', 'text');
        $code   = get('code', 'trim');

        if (!$mobile) {
            $this->ajaxReturn(array('status' => false, 'msg' => '请填写手机号'));
        }

        if (!$name) {
            $this->ajaxReturn(array('status' => false, 'msg' => '请填写姓名'));
        }

        if (!$code) {
            $this->ajaxReturn(array('status' => false, 'msg' => '请填写身份证'));
        }

        $map['type']   = 2;
        $map['mobile'] = $mobile;
        $map['name']   = $name;
        $map['code']   = $code;

        $orders = table('orders')->where($map)->field('order_sn,name,mobile,code,amount')->find();
        if (!$orders) {
            $this->ajaxReturn(array('status' => false, 'msg' => '未查询相关信息', 'sql' => table('orders')->getSql()));
        }

        $this->ajaxReturn(array('status' => true, 'msg' => '通过'));

    }
}
