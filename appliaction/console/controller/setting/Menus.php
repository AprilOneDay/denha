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
        $result = table('ConsoleMenus')->order("sort asc,id asc")->find('array');
        if ($result) {
            $tree = new \app\console\tools\util\MenuTree();
            $tree->setConfig('id', 'parentid', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
            $list = $tree->getLevelTreeArray($result);
            foreach ($list as $key => $value) {
                $list[$key]['status']  = $value['status'] ? "√" : "×";
                $list[$key]['is_show'] = $value['is_show'] ? "√" : "×";
            }
            $data = [
                'data' => [
                    'list' => $list,
                ],
            ];
        }
        $this->ajaxReturn(['status' => true, 'data' => $data]);
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
                $this->ajaxReturn(['status' => 1, 'msg' => '修改成功']);
            }
            $this->ajaxReturn(['status' => 0, 'msg' => '修改失败']);
        } else {
            $id       = G('id', 'intval');
            $rs       = table("ConsoleMenu")->find($id);
            $menulist = table('ConsoleMenu')->getMenuList();
            $this->ajaxReturn(['menu' => $rs, 'menulist' => $menulist]);
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
            $param = post('data', 'json');
            if (!is_array($param)) {
                $this->ajaxReturn(['status' => false, 'msg' => '参数错误']);
            }

            $data['name']      = (string) $param['name'];
            $data['parameter'] = (string) $param['parameter'];
            $data['url']       = (string) $param['url'];
            $data['icon']      = (string) $param['icon'];

            $data['parentid'] = (int) max($param['parentid'], 0);
            $data['status']   = (int) $param['status'];
            $data['is_show']  = (int) $param['is_show'];
            $data['is_white'] = (int) $param['is_white'];
            $data['sort']     = (int) $param['sort'];

            $data['module']     = strtolower($param['module']);
            $data['controller'] = strtolower($param['controller']);
            $data['action']     = strtolower($param['action']);
            $data['created']    = TIME;

            if (!$data['name']) {
                $this->ajaxReturn(['status' => false, 'msg' => '请填写菜单名称']);
            }

            if (!$data['module'] || !$data['controller'] || !$data['action']) {
                $this->ajaxReturn(['status' => false, 'msg' => '请填写模块/控制器/方法名称']);
            }

            $result = table('ConsoleMenus')->add($data);
            if ($result) {
                $this->ajaxReturn(['status' => true, 'msg' => '添加成功', 'id' => $result]);
            } else {
                $this->ajaxReturn(['status' => false, 'msg' => '添加失败']);
            }
        } else {
            $callback = get('callback');
            //$menulist = table('ConsoleMenu')->getMenuList();
            $this->ajaxReturn(['menulist' => $menulist, 'status' => 1]);
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
                $this->ajaxReturn(['status' => 1, 'data' => $ids]);
            }
        }
        $this->ajaxReturn(['status' => 0]);
    }
}