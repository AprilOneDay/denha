<?php
/**
 * 图书租借模块
 */
namespace app\admin\books;

use app\admin\Init;

class Books extends Init
{
    public function index($value = '')
    {
        $this->show();
    }

    /** 获取会员名称 */
    public function getUserName()
    {
        $account = post('account', 'text');

        $map['uid']    = $account;
        $map['moblie'] = ['or', $account];

        $user = table('User')->where($map)->field('real_name,uid');

        $this->ajaxReturn(['data' => $user]);

    }

    /** 获取图书信息 */
    public function getBookInfo()
    {
        $account = post('account', 'text');

        $map['uid']    = $account;
        $map['moblie'] = ['or', $account];

        $user = table('User')->where($map)->field('real_name,uid');

        $this->ajaxReturn(['data' => $user]);

    }
}
