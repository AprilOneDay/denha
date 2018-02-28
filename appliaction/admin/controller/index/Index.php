<?php
namespace app\admin\controller\index;

use app\admin\controller\Init;

class Index extends Init
{
    public $thisConsoleMenusTopId; //顶级栏目信息
    public $thisConsoleMenusId; //最多记录二级栏目信息
    public $mianUrl = '/content/menus/index'; //初始进入页面路径

    public function __construct()
    {
        parent::__construct();

        $this->thisConsoleMenusId = session('this_console_menus_id');
        if ($this->thisConsoleMenusId) {
            $this->thisConsoleMenusTopId = table('ConsoleMenus')->where('id', $this->thisConsoleMenusId)->field('parentid')->find('one');
        }

        // $map['uid >']       = 1;
        // $map['id']          = 0;
        // $map['time in']     = array(1, 2, 3, 45, 5);
        // $map['abc between'] = array(1111, 22222);
        // $map['time2 in']    = '1,2,3,4,5,6,7';
        // $map['time3 in']    = '';
        // $map['_string']     = 'abc != 1 or abc != 2';

        // $a = Database::getInstance();
        // $b = $a->table('user')->where('id not in', '1,2,3,4')->where('uid !=', 0)->whereMap($map)->field()->select();

    }

    public function index()
    {
        //获取白名单 不需要登录验证的
        $list = getVar('list', 'admin.white');
        //获取栏目信息
        $list['list'] = $this->menus();
        if ($this->thisConsoleMenusId) {
            $list['two']['list'] = $this->menus(1, $this->thisConsoleMenusId);
        }

        $this->assign('list', $list);
        $this->show('', false, false);
    }

    //二级导航显示
    public function menusPost()
    {
        $type = post('type', 'intval', 1);
        $id   = post('id', 'intval', 0);

        $map['type']       = $type;
        $map['is_show']    = 1;
        $map['parentid']   = 0;
        $map['del_status'] = 0;
        $map['parentid']   = $id;

        !(!$id && $this->thisConsoleMenusId) ?: $id = $this->thisConsoleMenusId;

        $list = table('ConsoleMenus')->where($map)->field('id,name,icon,url')->order('sort asc,id asc')->find('array');
        foreach ($list as $key => $value) {
            //隐藏未授权栏目信息
            if (in_array($value['id'], $this->power)) {
                $map['parentid']     = $value['id'];
                $list[$key]['child'] = table('ConsoleMenus')->where($map)->field('id,name,icon,url')->order('sort asc')->find('array');
                foreach ($list[$key]['child'] as $k => $v) {
                    if (!in_array($v['id'], $this->power)) {
                        unset($list[$key]['child'][$k]);
                    }
                }
            } else {
                unset($list[$key]);
            }

        }

        session('this_console_menus_id', $id);
        $this->assign('list', $list);
        $this->show('', false, false);

    }

    //一级导航
    public function menus($type = 1, $id = 0)
    {

        $map['type']       = $type;
        $map['is_show']    = 1;
        $map['parentid']   = 0;
        $map['del_status'] = 0;
        $map['parentid']   = $id;

        $list = table('ConsoleMenus')->where($map)->field('id,name,icon,url')->order('sort asc,id asc')->find('array');
        foreach ($list as $key => $value) {
            //隐藏未授权栏目信息
            if (in_array($value['id'], $this->power)) {
                $map['parentid']     = $value['id'];
                $list[$key]['child'] = table('ConsoleMenus')->where($map)->field('id,name,icon,url')->order('sort asc')->find('array');
                foreach ($list[$key]['child'] as $k => $v) {
                    if (!in_array($v['id'], $this->power)) {
                        unset($list[$key]['child'][$k]);
                    }
                }
            } else {
                unset($list[$key]);
            }

        }

        return $list;
    }

}
