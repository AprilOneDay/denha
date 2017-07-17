<?php
class Pay extends Init
{
    /**
     * 支付页面
     * @date   2017-07-16T21:51:45+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function index()
    {
        $catid   = get('catid', 'intval', 0);
        $orderSn = get('order_sn', 'text');

        if (!$orderSn || !$catid) {
            die('参数错误');
        }

        $orders = table('orders')->where(array('order_sn' => $orderSn))->field('type,amount')->find();

        //获取所选模板
        $templateList = $this->checkedCatid();

        $this->assign('orderSn', $orderSn);
        $this->assign('orders', $orders);
        switch ($templateList) {
            case 'default':
                $this->show('/pc/pay/index');
                break;

            default:
                # code...
                break;
        }
        $this->show();
    }

    /**
     * 收银台
     * @date   2017-07-16T21:51:05+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function cashier()
    {
        $orderSn = get('order_sn', 'text');
        $type    = get('type', 'text');

        if (!$orderSn || !$type) {
            die('参数错误');
        }

        switch ($type) {
            case 'alipay':
                dao('Pay')->alipay($orderSn);
                break;

            default:
                # code...
                break;
        }
    }
}
