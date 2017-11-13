<?php
/**
 * 课程作业管理
 */
namespace app\study\controller\user;

class Homework extends \app\study\controller\Init
{
    public function __construct()
    {
        parent::__construct();
        $this->checkIndividual(2);
    }

    /** 课程列表 */
    public function lessons()
    {
        $map['column_id'] = 10;
        $about            = dao('Article')->getRowContent($map, 'description,description_en', 1);

        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    /** 作业列表 */
    public function classwork()
    {
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    /** 我上传的作业 */
    public function myUpClasswork()
    {

        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }
}
