<?php
namespace app\admin\common;

use denha\Controller;

class Category extends Controller
{

    public function lists(int $value = 0, $key = '')
    {

        $lists = dao('Category')->getListAllInfo($value);

        $this->ajaxReturn(['status' => true, 'data' => $lists, 'key' => $key]);

    }

}
