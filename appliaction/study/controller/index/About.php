<?php
/**
 * 前台用户管理
 */
namespace app\study\controller\index;

class About extends \app\study\controller\Init
{

    public function index()
    {

        $map['column_id'] = 10;
        $about            = dao('Article')->getRowContent($map, 'thumb,description,description_en,content,content_en', 1);

        $map['column_id'] = 11;
        $contact          = dao('Article')->getRowContent($map, 'description,description_en,content,content_en', 1);

        $columnList = table('Column')->where('parentid', 5)->field('name,bname')->find('array');

        $this->assign('about', $about);
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }
}
