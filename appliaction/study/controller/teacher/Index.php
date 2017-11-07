<?php
/**
 * 前台用户管理
 */
namespace app\study\controller\teacher;

class Index extends \app\study\controller\Init
{

    public function index()
    {
        $map['column_id'] = 10;
        $about            = dao('Article')->getRowContent($map, 'description,description_en', 1);

        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

}
