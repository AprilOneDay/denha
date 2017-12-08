<?php
/**
 * 广告图模块
 */
namespace app\undies\web\controller;

use app\undies\web\controller\Init;
use denha\controller;

class News extends Init
{
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

        $menus = array();

        if ($this->thisColumn['parentid']) {
            $map             = array();
            $map['web_type'] = 2;
            $map['parentid'] = $this->thisColumn['parentid'];
            $menus           = dao('Column', 'undies')->getList($map, 'id,thumb,name,bname,parentid,jump_url');
        }

        $this->assign('menus', $menus);
        $this->assign('data', $data);

        if ($columnId == 43) {
            $this->show('news\lists_active');
        }

        $this->show();
    }

    public function listsActive()
    {
        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 10);
        $offer    = max(($pageNo - 1), 0) * $pageSize;

        $columnId = get('cid', 'intval', 0);

        if (!$columnId) {
            $this->appReturn(array('stauts' => false, 'msg' => '参数错误'));
        }

        $map['column_id']    = $columnId;
        $map['is_recommend'] = 1;

        $recommend              = dao('Article')->getList($map, 'title,description,created,thumb,id', 1, $pageSize, $pageNo);
        $data['recommend_list'] = $recommend['list'];

        foreach ($data['recommend_list'] as $key => $value) {
            $data['recommend_list'][$key]['thumb'] = $this->appImg($value['thumb'], 'article');
        }

        $map                 = array();
        $map['column_id']    = $columnId;
        $map['is_recommend'] = 0;

        $list         = dao('Article')->getList($map, 'title,description,created,thumb,id', 1, $pageSize, $pageNo);
        $data['list'] = $list['list'];

        foreach ($data['list'] as $key => $value) {
            $data['list'][$key]['thumb'] = $this->appImg($value['thumb'], 'article');
        }

        $menus = array();
        if ($this->thisColumn['parentid']) {
            $map             = array();
            $map['web_type'] = 2;
            $map['parentid'] = $this->thisColumn['parentid'];
            $menus           = dao('Column', 'undies')->getList($map, 'id,thumb,name,bname,parentid,jump_url');
        }

        $this->assign('menus', $menus);
        $this->assign('data', $data);

        $this->show();
    }
}
