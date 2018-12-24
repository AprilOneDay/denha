<?php

namespace app\admin\index;

use app\admin\Init;

class WechatLogin extends Init
{

    public $userInfo;

    public function __construct()
    {
        parent::__construct();

        $ticket   = get('code', 'text', '');
        $ucode    = get('ucode', 'text', '');
        $notOauth = ['qrUrl', 'checkUserPost', 'checkUser', 'url', 'bindPost', 'success'];

        if (!in_array(ACTION, $notOauth)) {

            if ($ucode) {
                $this->userInfo = cache('_wechat_login_user_info_' . $ucode);
            } elseif (cookie('_ucode')) {
                $ucode = cookie('_ucode');

                $this->userInfo = cache('_wechat_login_user_info_' . $ucode);
            }

            if ($ticket && $ucode && !$this->userInfo) {
                $this->userInfo = $result = dao('WeixinOauth')->getUserInfo($ticket);
                cache('_wechat_login_user_info_' . $ucode, $result, 3000);
            }
        }

    }

    /** 持续检测 */
    public function checkUser($userInfo = [])
    {
        if (!$userInfo) {
            $ucode    = cookie('_ucode');
            $userInfo = cache('_wechat_login_user_info_' . $ucode);
        }

        if (!$userInfo) {
            $this->ajaxReturn(['status' => false, 'msg' => '请扫码']);
        }

        $user = table('ConsoleAdmin')->where('ouid', $userInfo['openid'])->count();
        if (!$user) {
            $this->ajaxReturn(['status' => false, 'msg' => '请绑定']);
        }

        // 保存登陆信息
        if ($user) {
            $userModel = new User();
            $userModel->login('', '', $userInfo['openid']);
            $this->ajaxReturn(['status' => true, 'msg' => '登陆成功', 'url' => url('/console/index/index/index')]);
        }
    }

    public function url()
    {

        $ucode    = cookie('_ucode');
        echo $url = dao('WeixinOauth')->getAuthorizeUrl("http://www.cqkailin.com.cn/console/index/WechatLogin/bind?ucode={$ucode}");

    }

    // 函数用途：生成动态二维码
    public function qrUrl($url = '')
    {
        $ucode = md5(uniqid());
        cookie('_ucode', $ucode);
        $url = dao('WeixinOauth')->getAuthorizeUrl("http://www.cqkailin.com.cn/console/index/WechatLogin/bind?ucode={$ucode}");
        dao('QRCodeImg')->doImg($url);
    }

    /** 微信绑定 */
    public function bind()
    {
        $ucode = get('ucode', 'text', '');
        if (!$ucode) {
            die('非法访问');
        }

        // 如果已经绑定 则授权成功页面
        $is = table('ConsoleAdmin')->where('ouid', $this->userInfo['openid'])->count();
        if ($is) {
            $this->show('success');
        }

        $this->show('', ['ucode' => $ucode]);

    }

    public function bindPost()
    {

        $ucode    = get('ucode', 'text', '');
        $userInfo = cache('_wechat_login_user_info_' . $ucode);

        $account  = post('account', 'text', '');
        $password = post('password', 'text', '');

        $userModel = new User();
        $result    = $userModel->login($account, $password);

        if ($result['status'] === false) {
            $this->ajaxReturn($result);
        }

        if (!session('console')) {
            $this->ajaxReturn(['status' => false, 'msg' => '登陆信息异常']);
        }

        if (!$userInfo['openid']) {
            $this->ajaxReturn(['status' => false, 'msg' => '授权信息异常', 'userInfo' => $userInfo]);
        }

        $is = table('ConsoleAdmin')->where('ouid', $userInfo['openid'])->count();
        if ($is) {
            $this->ajaxReturn(['status' => false, 'msg' => '该微信号已绑定，请解除绑定后操作']);
        }

        $consoleId = session('console')['id'];

        $result = table('ConsoleAdmin')->where('id', $consoleId)->save(['ouid' => $userInfo['openid']]);

        $this->ajaxReturn(['status' => true, 'msg' => '绑定成功']);
    }
}
