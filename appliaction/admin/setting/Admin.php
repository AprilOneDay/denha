<?php
namespace app\admin\setting;

use app\admin\Init;
use app\tools\util\base\MenuTree;

class Admin extends Init
{
    /**
     * 管理员列表
     * @date   2017-10-09T10:51:21+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function index()
    {

        $param = get('param', 'text', '');

        $map = [];
        if (!empty($param['field']) && !empty($param['keyword'])) {
            if ($param['field'] == 'nickname') {
                $map['nickname'] = ['instr', trim($param['keyword'])];
            } elseif ($param['field'] == 'mobile') {
                $map['mobile'] = trim($param['keyword']);
            }
        }

        $list = table('ConsoleAdmin')->where($map)->select();

        foreach ($list as $key => $item) {
            $list[$key]['group_copy'] = table('ConsoleGroup')->where('id', 'in', $item['group'])->column('name');
        }

        $this->show('', ['list' => $list, 'statusCopy' => array(0 => '关闭', 1 => '开启'), 'param' => $param]);
    }

    public function editPost()
    {
        $id = get('id', 'intval', 0);

        $data['nickname'] = post('nickname', 'text', '');
        $data['password'] = trim(strtolower(post('password', 'text', '')));
        $data['group']    = post('group', 'text', '');
        $data['mobile']   = post('mobile', 'text', '');
        $data['status']   = post('status', 'intval', 0);

        if (!$data['group']) {
            $this->ajaxReturn(['status' => false, 'msg' => '请选择所属分组']);
        }

        //获取当前管理员权限等级
        $consoleLevel = table('ConsoleGroup')->where('id', 'in', $this->group)->value('max(level) as level');

        //除超管以外 用户组更改只可高级想低级更改
        if (!in_array(1, $this->group)) {
            //获取更改用户组的权限等级
            $adminLevel = table('ConsoleGroup')->where('id', 'in', $data['group'])->field('name,max(level)')->find();
            if ($adminLevel['level'] < $consoleLevel) {

                $this->ajaxReturn(['status' => false, 'msg' => '权限不足，不可设置用户组为【' . $adminLevel['name'] . '】']);
            }
        }

        //编辑
        if ($id) {
            if ($id == 1 && !$data['status']) {
                $this->ajaxReturn(['status' => false, 'msg' => '初始账户不可关闭']);
            }

            $admin = table('ConsoleAdmin')->where('id', $id)->field('group,salt,id,username')->find();
            if (!$admin) {
                $this->ajaxReturn(['status' => false, 'msg' => '账号不存在']);
            }

            // 除超级管理员外 当前用户组只可编辑对于用户组信息
            if (!in_array(1, $this->group) && $this->group != $admin['group']) {
                $this->ajaxReturn(['status' => false, 'msg' => '只可修改当前用户组的数据']);
            }

            // 自己不能关闭自己
            if ($this->consoleid == $id && $data['status'] == 0) {
                $this->ajaxReturn(['status' => false, 'msg' => '请不要关闭自己的账户']);
            }

            if (!$data['password']) {
                unset($data['password']);
            } else {
                $data['password'] = md5($admin['salt'] . $data['password']);
            }

            $result = table('ConsoleAdmin')->where('id', $id)->save($data);
            if ($result === false) {
                $this->ajaxReturn(['status' => false, 'msg' => '修改失败']);

            }

            $this->ajaxReturn(['status' => true, 'msg' => '修改成功']);
        }
        //添加
        else {
            $result = dao('Admin.User')->add(post('username', 'text', ''), $data['password']);

            $this->ajaxReturn($result);
        }

    }

    /**
     * 添加/编辑管理员
     * @date   2017-10-09T10:51:28+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function edit()
    {

        $id = get('id', 'intval', 0);

        $lists = table('ConsoleGroup')->where('status', 1)->field('name,id,parentid')->select();
        $tree  = new MenuTree();
        $tree->setConfig('id', 'parentid', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
        $lists = $tree->getLevelTreeArray($lists);

        if ($id) {
            $rs = table('ConsoleAdmin')->field('id,username,group,status,nickname,mobile')->where('id', $id)->find();

            $group            = table('ConsoleGroup')->where('id', 'in', $rs['group'])->column('name');
            $rs['group_copy'] = implode(',', $group);

        } else {
            $rs = ['status' => 1, 'group' => ''];
        }

        $rs['group_data']        = zipStr($lists);
        $rs['group_check_value'] = explode(',', $rs['group']); // 选择的部门id

        $this->assign('data', $rs);

        $this->show();

    }

    public function delete()
    {
        $id = post('id', 'intval', 0);
        if ($id <= 1) {
            $this->ajaxReturn(['status' => false, 'msg' => '初试账户不可删除！！']);
        }

        $result = table('ConsoleAdmin')->where('id', $id)->delete();

        if ($result) {
            $this->ajaxReturn(['status' => true, 'msg' => '删除成功']);
        }

        $this->ajaxReturn(['status' => true, 'msg' => '执行失败']);
    }
}
