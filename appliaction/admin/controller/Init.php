<?php
namespace app\admin\controller;

use denha;

class Init extends denha\Controller
{
    public $consoleid;
    public $group;

    public function __construct()
    {

        $this->consoleid = getSession('consoleid');
        if (!$this->consoleid) {
            header('Location:');
        }

    }

}
