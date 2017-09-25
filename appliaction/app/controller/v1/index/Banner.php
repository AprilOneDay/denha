<?php
/**
 * 广告图模块
 */
namespace app\app\controller\v1\index;

use app\app\controller;

class Banner extends \app\app\controller\Init
{
    public function lists()
    {
        $id   = get('id', 'intval', 1);
        $list = dao('Banner')->getBannerList($id);
        foreach ($list as $key => $value) {
            $list[$key]['path'] = $this->appImg($value['path'], 'banner');
        }

        $data['list'] = (array) $list;

        $this->appReturn(array('msg' => '获取数据成功', 'data' => $data));
    }
}
