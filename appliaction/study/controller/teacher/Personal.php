<?php
/**
 * 前台用户管理
 */
namespace app\study\controller\teacher;

class Personal extends \app\study\controller\Init
{
    public function __construct()
    {
        parent::__construct();
        $this->checkIndividual(2);
    }

    public function editPassword()
    {
        $map['id'] = $this->uid;
        $data      = table('User')->where($map)->find();
        $this->assign('data', $data);
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    public function editPasswordPost()
    {

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

    /** 编辑个人资料 */
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
}
