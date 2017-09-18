<?php
/**
 * 公用模块
 */
namespace app\app\controller\v1\common;

use app\app\controller;

class Index extends \app\app\controller\Init
{

    /**
     * 获取分类
     * @date   2017-09-18T10:16:11+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function getCategory()
    {
        $id   = post('id', 'intval', 0);
        $data = $this->appArray(dao('Category')->getList($id));
        $this->appReturn(array('data' => $data));
    }
}
