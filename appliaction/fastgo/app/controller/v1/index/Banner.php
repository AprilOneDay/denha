<?php
/**
 * 车友圈模块
 */
namespace app\fastgo\app\controller\v1\index;

use app\app\controller;
use app\fastgo\app\controller\Init;

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
