<?php
/** 个人信息管理 */
namespace app\admin\setting;

use app\admin\Init;

class Personal extends Init
{
    public function editPost()
    {
        $data['nickname'] = post('nickname', 'text', '');
        $data['password'] = trim(strtolower(post('password', 'text', '')));
        $password2        = trim(strtolower(post('password2', 'text', '')));
        $data['mobile']   = post('mobile', 'text', '');

        $admin = table('ConsoleAdmin')->where('id', $this->consoleid)->field('salt,id,username')->find();
        if (!$admin) {
            $this->ajaxReturn(['status' => false, 'msg' => '账号不存在']);
        }

        if (!$data['password']) {
            unset($data['password']);
        } else {

            if ($data['password'] != $password2) {
                $this->ajaxReturn(['status' => false, 'msg' => '两次密码不一致']);
            }

            $data['password'] = md5($admin['salt'] . $data['password']);
        }

        $result = table('ConsoleAdmin')->where('id', $admin['id'])->save($data);
        if (!$result) {
            $this->ajaxReturn(['status' => false, 'msg' => '修改失败']);

        }

        $this->ajaxReturn(['status' => true, 'msg' => '修改成功']);

    }

    /**
     * 添加/编辑管理员
     * @date   2017-10-09T10:51:28+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function edit()
    {

        $data               = table('ConsoleAdmin')->field('id,username,group,status,nickname,mobile')->where('id', $this->consoleid)->find();
        $data['group_copy'] = implode(' ', (array) table('ConsoleGroup')->where('id', 'in', $data['group'])->column('name'));

        $this->assign('data', $data);

        $this->show();

    }
}
