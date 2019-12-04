<?php
/**
 * 分组管理模块
 */
namespace app\admin\setting;

use app\admin\Init;
use app\tools\util\base\MenuTree;

class Group extends Init
{

    /**
     * [获取树状菜单列表]
     * @date   2016-09-05T10:21:46+0800
     * @author Sunpeiliang
     */
    public function treeList()
    {
        //格式化菜单
        $result = table('ConsoleGroup')->field('id,parentid,name')->order('sort asc')->select();
        if ($result) {
            $tree = new MenuTree();
            $tree->setConfig('id', 'parentid');
            $list = $tree->getLevelTreeArray($result);
            if (isset($list) && $list) {
                foreach ($list as $key => $value) {
                    $list[$key]['htmlname'] = isset($value['delimiter']) ? $value['delimiter'] . $value['name'] : $value['name'];
                }
            }
        }

        return $list;
    }

    /**
     * 分组列表
     * @date   2019-05-16T14:48:01+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function index()
    {

        $result = table('ConsoleGroup')->order('level asc')->select();

        $list = [];
        if ($result) {
            $tree = new MenuTree();
            $tree->setConfig('id', 'parentid', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
            $list = $tree->getLevelTreeArray($result);
        }

        $this->show('', ['list' => $list, 'statusCopy' => array(0 => '关闭', 1 => '开启')]);

    }

    /**
     * 添加/编辑分组
     * @date   2017-10-09T10:51:28+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function edit()
    {
        $id       = get('id', 'intval', 0);
        $parentid = get('parentid', 'intval', 0);

        if ($id) {
            $rs = table('ConsoleGroup')->field('id,name,status,level,parentid')->where(array('id' => $id))->find();
            $this->assign('data', $rs);
        } else {
            $this->assign('data', ['status' => 1, 'level' => 1, 'parentid' => $parentid]);
        }

        $this->assign('treeList', $this->treeList());
        $this->show();

    }

    /**
     * 编辑/添加 提交
     * @date   2019-05-16T14:59:58+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function editPost()
    {

        $id               = get('id', 'intval', 0);
        $data['name']     = post('name', 'text', '');
        $data['level']    = post('level', 'intval', 0);
        $data['status']   = post('status', 'text', '');
        $data['parentid'] = post('parentid', 'intval', 0);

        if (!$data['name']) {
            $this->ajaxReturn(array('status' => false, 'msg' => '请输入分组名称'));
        }

        if ($id) {
            if ($id == 1) {
                $this->ajaxReturn(['status' => false, 'msg' => '超级管理员权限不可修改']);
            }

            $admin = table('ConsoleGroup')->where(array('id' => $id))->field('id')->find();
            if (!$admin) {
                $this->ajaxReturn(['status' => false, 'msg' => '信息不存在']);
            }

            $result = table('ConsoleGroup')->where('id', $id)->save($data);
            if ($result) {
                $this->ajaxReturn(['status' => true, 'msg' => '修改成功']);
            } else {
                $this->ajaxReturn(['status' => false, 'msg' => '修改失败']);
            }
        } else {
            $result = table('ConsoleGroup')->add($data);
            if ($result) {
                $this->ajaxReturn(['status' => true, 'msg' => '添加成功']);
            } else {
                $this->ajaxReturn(['status' => false, 'msg' => '添加失败']);
            }
        }
    }
}
