<?php
namespace app\pc\controller\index;

use denha;

class Index extends denha\Controller
{
    public function index()
    {
        $list = table('db', false)->field('Host,Db,User')->find('array');

        $this->show();
    }
}
