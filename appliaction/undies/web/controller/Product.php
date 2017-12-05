<?php
/**
 * 广告图模块
 */
namespace app\undies\web\controller;

use app\undies\web\controller\Init;
use denha\controller;

class Product extends Init
{
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

        $data = dao('Article')->getList($map, 'title,btitle,description,created,thumb,id', 1, $pageSize, $pageNo);

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

        $this->show();
    }
}
