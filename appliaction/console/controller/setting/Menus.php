<?php
namespace app\console\controller\setting;

use denha;

class Menus extends denha\Controller
{
    /**
     * [index 菜单管理首页]
     * @date   2016-09-05T10:22:28+0800
     * @author Sunpeiliang
     * @return [type]                   [description]
     */
    public function index()
    {
        $ConsoleMenu = table('ConsoleMenu');
        $result      = $ConsoleMenu->order("sort asc,id asc")->select();
        if ($result) {
            $tree = new \Util\MenuTree();
            $tree->setConfig('id', 'parentid', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
            $list = $tree->getLevelTreeArray($result);
            foreach ($list as $key => $value) {
                $list[$key]['status']  = $value['status'] ? "√" : "×";
                $list[$key]['is_show'] = $value['is_show'] ? "√" : "×";
            }
            $data = array('list' => $list, 'status' => 1);
        } else {
            $data = array('status' => 0);
        }
        $this->ajaxReturn($data);
    }

    /**
     * [edit 编辑菜单]
     * @date   2016-09-05T10:21:29+0800
     * @author Sunpeiliang
     * @return [type]                   [description]
     */
    public function edit()
    {
        if (IS_POST) {
            $id                 = post('id', 'intval');
            $data['parentid']   = post('parentid', 'intval', 0);
            $data['name']       = post('name', 'trim', null);
            $data['module']     = post('module', 'trim', null);
            $data['controller'] = post('controller', 'trim', null);
            $data['action']     = post('action', 'trim', null);
            $data['parameter']  = post('parameter', 'trim', null);
            $data['url']        = post('url', 'trim', null);
            $data['icon']       = post('icon', 'trim', null);
            $data['status']     = post('status') ? 1 : 0;
            $data['is_show']    = post('is_show', 'intval', 0);
            $data['is_white']   = post('is_white', 'intval', 0);
            $data['sort']       = post('sort', 'intval', 0);
            $data['modified']   = TIME;
            $data['module']     = strtolower($data['module']);
            $data['controller'] = strtolower($data['controller']);
            $data['action']     = strtolower($data['action']);
            $result             = table('ConsoleMenu')->saveData($data, $id);
            if ($result) {
                $this->ajaxReturn(array('status' => 1, 'msg' => '修改成功'));
            }
            $this->ajaxReturn(array('status' => 0, 'msg' => '修改失败'));
        } else {
            $id       = G('id', 'intval');
            $rs       = table("ConsoleMenu")->find($id);
            $menulist = table('ConsoleMenu')->getMenuList();
            $this->ajaxReturn(array('menu' => $rs, 'menulist' => $menulist));
        }
    }
    /**
     * [add 添加菜单]
     * @date   2016-09-05T10:21:46+0800
     * @author Sunpeiliang
     */
    public function add()
    {
        if (IS_POST) {
            $Menu               = table('ConsoleMenu');
            $id                 = post('id', 'intval');
            $data['parentid']   = post('parentid', 'intval', 0);
            $data['name']       = post('name', 'trim', null);
            $data['module']     = post('module', 'trim', null);
            $data['controller'] = post('controller', 'trim', null);
            $data['action']     = post('action', 'trim', null);
            $data['parameter']  = post('parameter', 'trim', null);
            $data['url']        = post('url', 'trim', null);
            $data['icon']       = post('icon', 'trim', null);
            $data['status']     = post('status') ? 1 : 0;
            $data['is_show']    = post('is_show', 'intval', 0);
            $data['is_white']   = post('is_white', 'intval', 0);
            $data['sort']       = post('sort', 'intval', 0);
            $data['modified']   = TIME;
            $data['module']     = strtolower($data['module']);
            $data['controller'] = strtolower($data['controller']);
            $data['action']     = strtolower($data['action']);
            $result             = table('ConsoleMenu')->save($data);
            if ($result) {
                $this->ajaxReturn(array('status' => 1, 'msg' => '添加成功', 'id' => $result));
            } else {
                $this->ajaxReturn(array('status' => 1, 'msg' => '添加失败'));
            }
        } else {
            $callback = get('callback');
            //$menulist = table('ConsoleMenu')->getMenuList();
            $this->jsonpReturn(array('menulist' => $menulist, 'status' => 1), $callback);
        }
    }
    /**
     * [children 获取菜单子集]
     * @date   2016-09-30T10:37:55+0800
     * @author Sunpeiliang
     * @return [type]                   [description]
     */
    public function children()
    {
        $id   = G('id', 'intval', 0);
        $menu = table('ConsoleMenu')->order("sort asc,id asc")->select();
        if ($menu) {
            $tree = new \Util\MenuTree();
            $tree->setConfig('id', 'parentid');
            $ids = $tree->getChildsId($menu, $id);
            if ($ids) {
                $this->ajaxReturn(array('status' => 1, 'data' => $ids));
            }
        }
        $this->ajaxReturn(array('status' => 0));
    }
}
