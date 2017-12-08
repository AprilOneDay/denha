<?php
/**
 * 广告图模块
 */
namespace app\undies\web\controller;

use app\undies\app\controller\Init;
use denha\controller;

class Index extends Init
{
    /**
     * 获取栏目信息
     * @date   2017-12-04T10:49:07+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function index()
    {

        $banner = dao('Banner')->getBannerList(1);
        foreach ($banner as $key => $value) {
            $banner[$key]['path'] = $this->appImg($value['path'], 'banner');
        }

        $parentid = get('parentid', 'intval', 0);

        $map['web_type'] = 2;
        $map['parentid'] = $parentid;

        $menus = dao('Column', 'undies')->getList($map, 'id,thumb,name,bname,parentid,jump_url');
        foreach ($menus as $key => $value) {
            $menus[$key]['thumb'] = $this->appImg($value['thumb'], 'column');
        }

        $this->assign('menus', $menus);
        $this->assign('banner', $banner);

        $this->show();
    }

    /**
     * 单页内容
     * @date   2017-12-04T10:46:07+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function detail()
    {
        $columnId = get('cid', 'intval', 0);
        $id       = get('id', 'intval', 0);

        if ($columnId) {
            $map['column_id'] = $columnId;
        }

        if ($id) {
            $map['id'] = $id;
        }

        $data = dao('Article')->getRowContent($map, 'id,title,btitle,created,thumb,description,description_en,content,content_en', 1);

        $this->appReturn(array('msg' => '获取数据成功', 'data' => $data));
    }

    /**
     * 列表内容
     * @date   2017-12-04T10:46:16+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function lists()
    {
        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 10);
        $offer    = max(($pageNo - 1), 0) * $pageSize;

        $columnId    = get('cid', 'intval', 0);
        $isRecommend = get('is_recommend', 'text', '');

        if (!$columnId) {
            $this->appReturn(array('stauts' => false, 'msg' => '参数错误'));
        }

        $map['column_id'] = $columnId;

        if ($isRecommend) {
            $map['is_recommend'] = $isRecommend;
        }

        $data = dao('Article')->getList($map, 'title,description,created,thumb,id', 1, $pageSize, $pageNo);

        $data['list'] = $data['list'] ? $data['list'] : array();

        foreach ($data['list'] as $key => $value) {
            $data['list'][$key]['thumb'] = $this->appImg($value['thumb'], 'article');
        }

        $this->appReturn(array('msg' => '获取数据成功', 'data' => $data));
    }

    /** 保存地址信息 */
    public function saveGeolocation()
    {
        $lng = post('lng', 'text', 0);
        $lat = post('lat', 'text', 0);
        if ($lng && $lat) {
            session('lat', $lat);
            session('lng', $lng);
        }
        return true;
    }
}
