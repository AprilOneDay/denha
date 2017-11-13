<?php
/**
 * 前台用户管理
 */
namespace app\study\controller\user;

class Reservation extends \app\study\controller\Init
{
    public function __construct()
    {
        parent::__construct();
        $this->checkIndividual(2);
    }

    public function index()
    {
        $map['column_id'] = 10;
        $about            = dao('Article')->getRowContent($map, 'description,description_en', 1);

        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    /** 发起预约 */
    public function initiated()
    {
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }
}
