<?php
/**
 * 图书租借模块
 */
namespace app\admin\books;

use app\admin\Init;

class Lease extends Init
{
    public function index($value = '')
    {
        $this->show();
    }

    /** 获取会员名称 */
    public function getUser()
    {
        $account = post('account', 'text');

        if (!$account) {
            $this->ajaxReturn(['status' => false]);
        }

        $map['uid']    = $account;
        $map['mobile'] = ['or', $account];

        $data = table('User')->where($map)->find('real_name,uid');

        if (!$data) {
            $this->ajaxReturn(['status' => false]);
        }

        $this->ajaxReturn(['status' => true, 'data' => $data]);

    }

    /** 获取图书信息 */
    public function getBook()
    {
        $goodsSn = post('goods_sn', 'text');

        $map['goods_sn'] = $goodsSn;

        $data = table('Goods')->where($map)->find();

        if (!$data) {
            $this->ajaxReturn(['status' => false]);
        }

        $this->ajaxReturn(['status' => true, 'data' => $data]);

    }
}
