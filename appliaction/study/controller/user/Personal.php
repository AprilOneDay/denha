<?php
/**
 * 前台用户管理
 */
namespace app\study\controller\user;

class Personal extends \app\study\controller\Init
{
    public function __construct()
    {
        parent::__construct();
        $this->checkIndividual();
    }

    public function editPassword()
    {
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    public function editPasswordPost()
    {

    }

    public function index()
    {
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    public function edit()
    {
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    public function editPost()
    {

    }
}
