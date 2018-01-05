<?php
namespace app\note\pc\controller;

use app\note\pc\controller\Init;

class Login extends Init
{
    public function index()
    {

        $this->show();
    }

    public function indexPost()
    {

        $account  = (string) post('username', 'text', '');
        $password = (string) post('password', 'text', '');

        $result = dao('User')->login($account, $password, '', 1);

        $this->appReturn($result);
    }

    /**
     * 退出登录
     * @date   2017-09-19T21:45:21+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function loginOut()
    {
        cookie('token', null);
        header('Location:/login');
    }
}
