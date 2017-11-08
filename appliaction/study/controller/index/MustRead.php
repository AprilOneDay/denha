<?php
/**
 * 前台用户管理
 */
namespace app\study\controller\index;

class MustRead extends \app\study\controller\Init
{
    public function index()
    {
        $map['column_id'] = 4;
        $data             = dao('Article')->getRowContent($map, 'title,btitle,content,content_en', 1);

        $map              = array();
        $map['column_id'] = 20;
        $qalist           = dao('Article')->getList($map, 'title,btitle,content,content_en', 1);

        $this->assign('qalist', $qalist);
        $this->assign('data', $data);
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

}
