<?php
namespace app\console\controller\index;

use denha;

class Index extends denha\Controller
{
    public function menus()
    {
        $type = get('type', 'intval', 1);

        $map['type']       = $type;
        $map['is_show']    = 1;
        $map['parentid']   = 0;
        $map['del_status'] = 0;

        $list = table('ConsoleMenus')->where($map)->field('id,name,icon')->order('sort desc')->find('array');
        foreach ($list as $key => $value) {
            $map['parentid']     = $value['id'];
            $list[$key]['child'] = table('ConsoleMenus')->where($map)->field('id,name,icon')->order('sort desc')->find('array');
        }

        $this->ajaxReturn(['status' => true, 'list' => $list]);
    }
}
