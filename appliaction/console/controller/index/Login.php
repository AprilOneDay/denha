<?php
namespace app\console\controller\index;

use denha;

class Login extends denha\Controller
{
    //登录
    public function account()
    {
        $param = post('data', 'json');
        if (!is_array($param)) {
            $this->ajaxReturn(['status' => false, 'msg' => '参数错误']);
        }

        $username = (string) $param['username'];
        $password = (string) $param['password'];

        $admin = table('ConsoleAdmin')->where(['username' => $username])->field('id,consoleid,password,salt,status')->find();
        //判断帐号
        if (!$admin || !$username) {
            $this->ajaxReturn(['status' => false, 'msg' => '用户名错误']);
        }

        if (!$admin['status']) {
            $this->ajaxReturn(['status' => false, 'msg' => '账户已禁用']);
        }

        //判断密码
        if (md5($admin['salt'] . $password) !== $admin['password']) {
            $this->ajaxReturn(['status' => false, 'msg' => '密码错误']);
        }

        $data['login_ip']   = getIP();
        $data['login_time'] = TIME;
        table('ConsoleAdmin')->where(['id' => $admin['id']])->save($data);

        session('consoleid', $admin['id']);

        $this->ajaxReturn(['status' => true, 'msg' => '登录成功']);
    }

    //检测是否登录
    public function oauth()
    {
        var_dump($_SESSION);die();
        if (issetSession('consoleid')) {
            $this->ajaxReturn(['status' => true, 'msg' => '已登录']);
        } else {
            $this->ajaxReturn(['status' => false, 'msg' => '未登录']);
        }
    }
}
