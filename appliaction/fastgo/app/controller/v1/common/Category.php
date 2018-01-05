<?php
/**
 * 首页模块
 */
namespace app\fastgo\app\controller\v1\common;

use app\app\controller;
use app\fastgo\app\controller\v1\Init;

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

    /**
     * 获取分类完整版
     * @date   2017-12-29T10:39:30+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function getAllList()
    {
        $id = get('id', 'intval', 0);

        $data = dao('Category')->getListAllInfo($id, '', $this->lg);
        $this->appReturn(array('data' => $data));
    }

    /**
     * 模糊搜索分类
     * @date   2017-12-29T11:33:43+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function searchAllList()
    {
        $id      = get('id', 'intval', 0);
        $keyword = get('keyword', 'text', '');

        $data = dao('Category')->searchListAllInfo($id, $keyword, $this->lg);
        $this->appReturn(array('data' => $data));
    }

    /**
     * 获取省份/城市/地区
     * @date   2017-12-25T10:30:04+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function getCity()
    {
        $type = get('type', 'intval', 1);
        $id   = get('id', 'intval', 8);

        if ($id == 8 && $type == 1) {
            $id       = 35;
            $this->lg = 'zh';
        }

        if ($type == 2) {
            $this->lg = 'en';
        }

        $data = $this->appArray(dao('Category')->getList($id, $this->lg));

        foreach ($data as $key => $value) {
            $data[$key]['child'] = $this->appArray(dao('Category')->getList($value['id'], $this->lg));
        }

        $this->appReturn(array('data' => $data));

    }

    public function warehouse()
    {
        $type = get('type', 'intval', 1);
        $id   = get('id', 'intval', 0);

        $country = get('country', 'text', '');
        $keyword = get('keyword', 'text', '');
    }
}
