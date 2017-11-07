<?php
/**
 * 前台用户管理
 */
namespace app\study\controller\index;

class Bbs extends \app\study\controller\Init
{
    public function index()
    {
        $list = table('Article')->where('column_id', 21)->field('title,btitle,thumb,id,description,description_en,publish_time')->find('array');

        $columnList = table('Column')->where('parentid', 3)->field('id,name,bname,jump_url')->find('array');

        $this->assign('list', $list);
        $this->assign('columnList', $columnList);
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }
}
