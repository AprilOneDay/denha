<?php
/**
 * 公用模块
 */
namespace app\app\controller\v1\common;

use app\app\controller;

class Index extends \app\app\controller\Init
{

    public function carBrand()
    {
        $data = $this->appArray(getVar('province', 'city'));
        $this->appReturn(array('data' => $data));
    }
}
