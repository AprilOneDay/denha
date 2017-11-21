<?php
namespace app\red_packets\index\controller;

use denha;

class RedPackets extends denha\Controller
{
    public function index()
    {
        $this->show();
    }

    public function game()
    {
        $this->show();
    }
}
