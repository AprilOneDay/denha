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

    public function register()
    {
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }
}
