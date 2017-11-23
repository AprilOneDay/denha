<?php
/**
 * 会员模块
 */
namespace app\fastgo\app\controller\v1\user;

use app\app\controller;

class Operation extends \app\fastgo\app\controller\Init
{
    public function login()
    {

    }

    public function register()
    {

        $list = file_get_contents('php://input');
        $post = json_decode($list, true);

        if (!$post['mobile']) {
            $this->appReturn(array('status' => false, 'msg' => '请输入手机号'));
        }

        $data = array(

            'type'     => $post['type'],
            'username' => $post['username'],
            'password' => $post['password'],
            'mobile'   => $post['mobile'],

        );

        $result = dao('User')->register($data, $post['password'], $post['is_agree']);

        $this->appReturn($result);

    }

}
