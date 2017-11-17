<?php
/**
 * 前台用户管理
 */
namespace app\study\controller\user;

class Personal extends \app\study\controller\Init
{
    public function __construct()
    {
        parent::__construct();
        $this->checkIndividual();
    }

    /** 个人信息 */
    public function index()
    {
        $map['id']      = $this->uid;
        $data           = table('User')->where($map)->find();
        $data['avatar'] = imgUrl($data['avatar'], 'avatar');

        $this->assign('data', $data);
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    /** 查看个人编辑信息 */
    public function edit()
    {
        $map['id']      = $this->uid;
        $data           = table('User')->where($map)->find();
        $data['avatar'] = imgUrl($data['avatar'], 'avatar');

        $this->assign('data', $data);
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    /** 编辑个人资料操作 */
    public function editPost()
    {
        $data['nickname']  = post('nickname', 'text', '');
        $data['real_name'] = post('real_name', 'text', '');
        $data['mail']      = post('mail', 'text', '');
        $data['address']   = post('address', 'text', '');
        $data['avatar']    = post('avatar', 'img', '');

        if (!$data['nickname']) {
            $this->appReturn(array('status' => false, 'msg' => '请输入昵称'));
        }

        if (!$data['real_name']) {
            $this->appReturn(array('status' => false, 'msg' => '请输入真实姓名'));
        }

        $result = table('User')->where('id', $this->uid)->save($data);
        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '操作失败,请重新尝试'));
        }

        $this->appReturn(array('msg' => '更新成功'));
    }

    /** 修改密码页面 */
    public function editPassword()
    {
        $map['id'] = $this->uid;
        $data      = table('User')->where($map)->find();
        $this->assign('data', $data);
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    /** 修改密码操作 */
    public function editPasswordPost()
    {
        $oldPassword = post('old_password', 'text', '');
        $password    = post('password', 'text', '');
        $password2   = post('password2', 'text', '');

        if (!dao('User')->checkUserPassword($this->uid, $oldPassword)) {
            $this->appReturn(array('status' => false, 'msg' => '原密码错误'));
        }

        $result = dao('User')->findPassword($this->uid, $password, $password2);
        $this->appReturn($result);
    }
}
