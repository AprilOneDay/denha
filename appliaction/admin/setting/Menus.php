<?php
namespace app\admin\setting;

use app\admin\Init;
use app\tools\util\base\MenuTree;

class Menus extends Init
{

    /**
     * [index 菜单管理首页]
     * @date   2016-09-05T10:22:28+0800
     * @author Sunpeiliang
     * @return [type]                   [description]
     */
    public function index()
    {
        $map['del_status'] = 0;

        $result = table('ConsoleMenus')->where($map)->order('sort asc,id asc')->select();

        if ($result) {
            $tree = new MenuTree();
            $tree->setConfig('id', 'parentid', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
            $list = $tree->getLevelTreeArray($result);

            if ($list) {
                foreach ($list as $key => $value) {
                    $list[$key]['status']       = $value['status'] ? '√' : '×';
                    $list[$key]['is_show_copy'] = $value['is_show'] ? '√' : '×';
                }
            }

        }

        $this->assign('list', $list);
        $this->show();

    }

    public function edit()
    {
        $id       = get('id', 'intval', 0);
        $parentid = get('parentid', 'intval', 0);
        $rs       = table('ConsoleMenus')->where(['id' => $id])->find();

        if (!$id) {
            $rs = array('is_show' => 1, 'is_white' => 0, 'status' => 1);
        }

        if ($id == 0 && $parentid != 0) {
            $rs['parentid'] = $parentid;
            $rs['sort']     = 0;
        }

        $this->assign('treeList', $this->treeList());
        $this->assign('data', $rs);
        $this->show();
    }

    /**
     * [edit 编辑菜单]
     * @date   2016-09-05T10:21:29+0800
     * @author Sunpeiliang
     * @return [type]                   [description]
     */
    public function editPost()
    {

        $id = post('id', 'intval', 0);

        $data['name']      = post('name', 'text', '');
        $data['parameter'] = post('parameter', 'text', '');
        $data['url']       = post('url', 'trim', '');
        $data['icon']      = post('icon', 'text', '');

        $data['type']     = max(post('type', 'intval', 0), 1);
        $data['parentid'] = post('parentid', 'intval', 0);
        $data['status']   = post('status', 'intval', 0);
        $data['is_show']  = post('is_show', 'intval', 0);
        $data['is_white'] = post('is_white', 'intval', 0);
        $data['sort']     = post('sort', 'intval', 0);

        $data['created'] = TIME;

        if (!$data['url']) {
            $this->ajaxReturn(array('status' => false, 'msg' => '请填写请求地址'));
        }

        if (!$data['name']) {
            $this->ajaxReturn(array('status' => false, 'msg' => '请填写菜单名称'));
        }

        if ($id) {
            if ($data['parentid'] == $id) {
                $this->ajaxReturn(array('status' => false, 'msg' => '上级栏目选择错误,不可选择自己为上级栏目'));
            }

            $result = table('ConsoleMenus')->where(array('id' => $id))->save($data);
            if ($result) {
                $this->ajaxReturn(array('status' => true, 'msg' => '修改成功'));
            } else {
                $this->ajaxReturn(array('status' => false, 'msg' => '修改失败'));
            }
        } else {
            $result = table('ConsoleMenus')->add($data);
            if ($result) {
                //超级管理员增加默认权限
                table('ConsoleGroup')->where(array('id' => 1))->save(array('power' => array('concat', ',' . $result)));
                $this->ajaxReturn(array('status' => true, 'msg' => '添加成功', 'id' => $result));
            } else {
                $this->ajaxReturn(array('status' => false, 'msg' => '添加失败'));
            }
        }

    }

    /**
     * 更新排序
     * @date   2017-10-12T11:40:35+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function updateSort()
    {
        $id = post('id');
        foreach ($id as $key => $value) {
            if ($value !== '') {
                $data[$value][] = $key;
            }
        }

        foreach ($data as $key => $value) {
            $map       = array();
            $map['id'] = array('in', $value);

            $result = table('ConsoleMenus')->where($map)->save('sort', $key);
            if (!$result) {
                $this->ajaxReturn(array('status' => false, 'msg' => '更新失败'));
            }

        }

        $this->ajaxReturn(array('msg' => '更新成功'));
    }

    /**
     * 删除菜单
     * @date   2017-08-22T14:59:55+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function delete()
    {
        $id = post('id', 'intval', 0);
        if (!$id) {
            $this->ajaxReturn(array('status' => false, 'msg' => '参数错误'));
        }

        $result = table('ConsoleMenus')->where(['id' => $id])->save(['del_status' => 1]);

        if ($result) {
            $this->ajaxReturn(array('status' => true, 'msg' => '删除成功'));
        }

        $this->ajaxReturn(array('status' => false, 'msg' => '删除失败'));

    }
    /**
     * [children 获取菜单子集]
     * @date   2016-09-30T10:37:55+0800
     * @author Sunpeiliang
     * @return [type]                   [description]
     */
    public function children()
    {
        $id   = get('id', 'intval', 0);
        $menu = table('ConsoleMenu')->order('sort asc,id asc')->select();
        if ($menu) {
            $tree = new MenuTree();
            $tree->setConfig('id', 'parentid');
            $ids = $tree->getChildsId($menu, $id);
            if ($ids) {
                $this->ajaxReturn(array('status' => true, 'data' => $ids));
            }
        }
        $this->ajaxReturn(array('status' => false));
    }

    /**
     * [获取树状菜单列表]
     * @date   2016-09-05T10:21:46+0800
     * @author Sunpeiliang
     */
    public function treeList()
    {
        //格式化菜单
        $result = table('ConsoleMenus')->where('del_status', 0)->field('id,parentid,name')->order('sort asc')->select();
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

}
