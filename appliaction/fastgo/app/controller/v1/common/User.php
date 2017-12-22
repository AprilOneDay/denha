<?php
/**
 * 商家会员相关
 */
namespace app\fastgo\app\controller\v1\common;

use app\app\controller;
use app\fastgo\app\controller\Init;

class User extends Init
{
    /**
     * @method 注册
     * @url    email/send?token=xxx
     * @http   POST
     * @param  type                string [必填] 类型 1个人 2商家
     * @param  username            string [必填] 用户名
     * @param  password            string [必填] 密码
     * @param  password2           string [必填] 确认密码
     * @param  mobile              string [必填] 手机号
     * @param  code                string [必填] 验证码
     * @param  is_agree            string [非必填] 是否同意 1同意 0不同意(默认0)
     * @author Chen Mingjiang
     * @return
     * {"status":false,"msg":'失败原因',"code":200,data:[]}
     */
    public function register()
    {
        $data['username'] = post('username', 'text', '');
        $data['password'] = post('password', 'trim', '');
        $data['mobile']   = post('mobile', 'text', '');
        $data['country']  = post('country', 'text', '');
        $data['type']     = 1;

        $weixinId = post('weixin_id', 'text', '');
        $code     = post('code', 'text', '');

        $code != '' ?: $code = post('Code', 'intval', 0);

        $password2 = post('password2', 'text', '');
        $isAgree   = post('is_agree', 'intval', 0);

        if (!$data['country']) {
            $this->appReturn(array('status' => false, 'msg' => '请输入国家'));
        }

        if (!$data['mobile']) {
            $this->appReturn(array('status' => false, 'msg' => '请输入手机号'));
        }

        if (!$code) {
            $this->appReturn(array('status' => false, 'msg' => '请输入验证码'));
        }

        $thirdParty = array();
        if ($weixinId) {
            $thirdParty['weixin_id'] = $weixinId;
        }

        $result = dao('User')->register($data, $password2, $isAgree, $code, $thirdParty);

        $this->appReturn($result);
    }

    /**
     * 登录
     * @date   2017-10-13T09:58:01+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function login()
    {
        $account  = post('account', 'text', '');
        $password = post('password', 'text', '');
        $type     = post('type', 'intval', 0);

        $typeCopy = array('1' => '个人', '2' => '商家');

        if (!$type) {
            $this->appReturn(array('status' => false, 'msg' => '请选择登录方式'));
        }

        $result = dao('User')->login($account, $password, $this->imei, $type);

        if ($result['status']) {
            if ($result['data']['type'] != $type) {
                $this->appReturn(array('status' => false, 'msg' => '请选择' . $typeCopy[$result['data']['type']] . '登录'));
            }
        }

        if ($result['data']['type'] == 2) {
            $result['data']['is_ide'] = (int) table('UserShop')->where('uid', $result['data']['uid'])->field('is_ide')->find('one');
        }

        $this->appReturn($result);
    }

    /**
     * 修改用户密码
     * @date   2017-09-25T11:11:42+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function findPassword()
    {
        parent::__construct();

        $mobile = post('mobile', 'text', '');

        $password  = post('password', 'text', '');
        $password2 = post('password2', 'text', '');

        $code = post('code', 'intval', 0);

        if (!$mobile) {
            $this->appReturn(array('status' => false, 'msg' => '请输入手机号'));
        }

        if (!$code) {
            $this->appReturn(array('status' => false, 'msg' => '请输入验证码'));
        }

        $map['mobile'] = $mobile;

        $user = table('User')->where($map)->field('id')->find();

        if (!$user) {
            $this->appReturn(array('status' => false, 'msg' => '尚未注册'));
        }

        $reslut = dao('User')->findPassword($user['id'], $password, $password2, $code, $mobile);
        $this->appReturn($reslut);
    }

    /**
     * 第三方登录
     * @date   2017-10-13T09:58:01+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function thirdPartyLogin()
    {
        $account = post('account', 'text', '');
        $type    = post('type', 'intval', 0);

        $typeCopy = array('1' => '个人', '2' => '商家');

        if (!$type) {
            $this->appReturn(array('status' => false, 'msg' => '请选择登录方式'));
        }

        $result = dao('User')->thirdPartyLogin($account, $this->imei);

        if ($result['status']) {
            if ($result['data']['type'] != $type) {
                $this->appReturn(array('status' => false, 'msg' => '请选择' . $typeCopy[$result['data']['type']] . '登录'));
            }
        }

        if ($type == 2) {
            $$result['data']['is_ide'] = table('UserShop')->where('uid', $result['data']['uid'])->field('is_ide')->find('one');
        }

        $this->appReturn($result);
    }

}
