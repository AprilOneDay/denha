<?php
/**
 * 会员模块
 */
namespace app\fastgo\app\controller\v1\index;

use app\app\controller;
use app\fastgo\app\controller\v1\Init;
use denha\Start;

class Service extends Init
{
    public function menus()
    {
        $parentid = get('parentid', 'intval', 0);

        $map['web_type'] = 3;
        $map['parentid'] = $parentid;
        $map['is_show']  = 1;

        $list = dao('Column', 'undies')->getList($map, 'id,thumb,name,name_en,name_jp,bname,bname_en,bname_jp,parentid');
        foreach ($list as $key => $value) {
            $list[$key]['finally_name']  = $this->lg != 'zh' && isset($value['name_' . $this->lg]) ? $value['name_' . $this->lg] : $value['name'];
            $list[$key]['finally_bname'] = $this->lg != 'zh' && isset($value['bname_' . $this->lg]) ? $value['bname_' . $this->lg] : $value['bname'];
            $list[$key]['thumb']         = $this->appImg($value['thumb'], 'column');
        }

        $data['list'] = (array) $list;

        $this->appReturn(array('msg' => '获取数据成功', 'data' => $data));
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

        $data = dao('Article')->getRowContent($map, '', 1);

        $data['finally_content'] = $this->lg != 'zh' && isset($data['content_' . $this->lg]) ? $data['content_' . $this->lg] : $data['content'];
        $data['finally_title']   = $this->lg != 'zh' && isset($data['title_' . $this->lg]) ? $data['title_' . $this->lg] : $data['content'];

        $data['content'] = str_replace('src="', 'src="' . Start::$config['h5Url'], $data['content']);
        $this->assign('data', $data);

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

        $data = dao('Article')->getList($map, '', 1, $pageSize, $pageNo);

        $data['list'] = $data['list'] ? $data['list'] : array();

        foreach ($data['list'] as $key => $value) {
            $data['list'][$key]['thumb'] = $this->appImg($value['thumb'], 'article');
            $data['list'][$key]['video'] = $value['video'] ? Start::$config['h5Url'] . $value['video'] : '';

            $data['list'][$key]['finally_title']       = $this->lg != 'zh' && isset($value['title_' . $this->lg]) ? $value['title_' . $this->lg] : $value['content'];
            $data['list'][$key]['finally_description'] = $this->lg != 'zh' && isset($value['description_' . $this->lg]) ? $value['description_' . $this->lg] : $value['description'];

        }

        $this->appReturn(array('msg' => '获取数据成功', 'data' => $data));
    }
}
