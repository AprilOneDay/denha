<?php
/**
 * 广告图模块
 */
namespace app\undies\app\controller\v1\index;

use app\undies\app\controller\Init;
use denha\controller;

class Banner extends Init
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
