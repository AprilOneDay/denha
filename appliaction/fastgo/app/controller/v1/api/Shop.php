<?php
/**
 * 商家会员相关
 */
namespace app\fastgo\app\controller\v1\api;

use app\app\controller;
use app\fastgo\app\controller\v1\ApiInit;

class Shop extends ApiInit
{

    /**
     * 添加商户
     * @date   2018-01-02T13:47:15+0800
     * @author ChenMingjiang
     */
    public function add()
    {
        $data['uid']      = post('uid', 'int', 0);
        $data['password'] = post('password', 'text', '');
        $data['username'] = post('username', 'text', '');
        $data['nickname'] = post('nickname', 'text', '');
        $data['type']     = post('type', 'intval', 2);

        if (!$data['uid'] || !$data['password'] || !$data['username'] || !$data['nickname'] || !$data['type']) {
            $this->apiReturn(array('status' => flase, 'msg' => '参数错误'));
        }

        $password2 = $data['password'];

        $result = dao('User')->register($data, $password2);

        $this->apiReturn($result);
    }
}
