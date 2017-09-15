<?php
namespace app\admin\controller\index;

use denha;

class Login extends denha\Controller
{
    //登录
    public function index()
    {

        if (IS_POST) {
            $username = (string) post('username', 'text', '');
            $password = (string) post('password', 'text', '');

            $admin = table('ConsoleAdmin')->where(['username' => $username])->field('id,consoleid,password,salt,status,nickname')->find();
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

            $sessionStorage['nickname'] = $admin['nickname'];
            $sessionStorage['id']       = $admin['id'];

            $this->ajaxReturn(['status' => true, 'msg' => '登录成功']);

        } else {
            $this->show();
        }

    }

    //检测是否登录
    public function oauth()
    {
        $callback = get('callback');
        if (issetSession('consoleid')) {
            $this->jsonpReturn(['status' => true, 'msg' => '已登录'], $callback);
        } else {
            $this->jsonpReturn(['status' => false, 'msg' => '未登录'], $callback);
        }
    }
}
