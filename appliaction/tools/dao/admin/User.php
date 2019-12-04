<?php
/** 账户管理 */
namespace dao\admin;

class User
{
    /** 添加管理员 */
    public function add($username, $password, $group = '')
    {

        if (!$username || !$password) {
            $this->ajaxReturn(['status' => false, 'msg' => '请填写用户名/密码']);
        }

        //判断用户名是否存在
        $isAdmin = table('ConsoleAdmin')->where('username', $username)->value('id');
        if ($isAdmin) {
            return ['status' => false, 'msg' => '用户名已存在'];
        }

        $data['salt']      = mt_rand(10000, 99999);
        $data['group']     = $group;
        $data['created']   = TIME;
        $data['create_ip'] = getIP();
        $data['username']  = $username;
        $data['password']  = md5($data['salt'] . $password);
        $result            = table('ConsoleAdmin')->add($data);
        if ($result === false) {
            return ['status' => false, 'msg' => '添加失败'];
        }

        return ['status' => true, 'msg' => '添加成功', 'id' => $result];

    }
}
