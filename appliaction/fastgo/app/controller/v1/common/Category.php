<?php
/**
 * 首页模块
 */
namespace app\app\controller\v1\common;
use app\app\controller;
use app\fastgo\app\controller\Init;

class Category extends Init
{

    /**
     * 获取分类
     * @date   2017-09-18T10:16:11+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function getList()
    {
        $id = get('id', 'intval', 0);

        $data = $this->appArray(dao('Category')->getList($id, $this->lg));
        $this->appReturn(array('data' => $data));
    }
