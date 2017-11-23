<?php
/**
 * 前台用户管理
 */
namespace app\study\controller\index;

class User extends \app\study\controller\Init
{

    public function loginPost()
    {
        $account  = post('account', 'text', '');
        $password = post('password', 'text', '');
        $type     = post('type', 'intval', 0);

        $typeCopy = array('1' => '学生', '2' => '老师');

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

    public function outlogin()
    {
        cookie('token', '');
        $this->appReturn(array('msg' => '退出登录成功'));
    }

    public function login()
    {
        //如果存在跳转url 则直接跳转
        $returnUrl = get('return', 'text', '');
        if ($returnUrl && $this->uid) {
            header('LOCATION:' . $returnUrl);
            exit();
        }

        if ($this->group) {
            switch ($this->group) {
                case '1':
                    header('LOCATION:' . url('/user/index'));
                    break;
                case '2':
                    header('LOCATION:' . url('/teacher/index'));
                    break;
                default:
                    break;
            }
            exit();
        }

        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    /**
     * 注册
     * @date   2017-11-08T10:29:21+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function registerPost()
    {
        $data['username'] = post('username', 'text', '');
        $data['password'] = post('password', 'trim', '');
        $data['mobile']   = post('mobile', 'text', '');
        $data['mail']     = post('mail', 'text', '');
        $data['type']     = 1;

        if (!$data['mobile']) {
            $this->appReturn(array('status' => false, 'msg' => '请输入手机号'));
        }

        if (!$data['mail']) {
            $this->appReturn(array('status' => false, 'msg' => '请输入邮箱'));
        }

        $code = post('code', 'text', '');

        $password2 = post('password2', 'text', '');
        $isAgree   = post('is_agree', 'intval', 1);

        $result = dao('User')->register($data, $password2, $isAgree, $code, $thirdParty);

        $this->appReturn($result);
    }

    public function register()
    {
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }
}
