<?php
/**
 * 教室管理
 */
namespace app\study\controller\user;

class Classroom extends \app\study\controller\Init
{

    public function __construct()
    {
        parent::__construct();
        $this->checkIndividual();
    }

    /** 一对一 */
    public function vip()
    {
        $map['column_id'] = 10;
        $about            = dao('Article')->getRowContent($map, 'description,description_en', 1);

        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    /** 大厅 */
    public function hall()
    {
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

}
