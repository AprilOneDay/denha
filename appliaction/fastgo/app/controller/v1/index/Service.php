<?php
/**
 * 服务模块
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

        $field = 'name,bname';
        if ($this->lg != 'zh') {
            $field = "name_{$this->lg},bname_{$this->lg}";
        }
        $field .= ",id,thumb,is_show,parentid";

        $list = table('Column')->where($map)->field($field)->find('array');
        foreach ($list as $key => $value) {
            $list[$key]['finally_name']  = dao('Article')->getLgValue($value, 'name', $this->lg);
            $list[$key]['finally_bname'] = dao('Article')->getLgValue($value, 'bname', $this->lg);
            $list[$key]['thumb']         = $this->appImg($value['thumb'], 'column');
        }

        $data['list'] = (array) $list;

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

        $field = 'title,description';
        if ($this->lg != 'zh') {
            $field = "title_{$this->lg},description_{$this->lg}";
        }
        $field .= ",id,thumb,thumb,video,created";

        $data = dao('Article')->getList($map, $field, 1, $pageSize, $pageNo);

        $data['list'] = $data['list'] ? $data['list'] : array();

        foreach ($data['list'] as $key => $value) {
            $data['list'][$key]['thumb'] = $this->appImg($value['thumb'], 'article');
            $data['list'][$key]['video'] = $value['video'] ? Start::$config['h5Url'] . $value['video'] : '';

            $data['list'][$key]['finally_title']       = dao('Article')->getLgValue($value, 'title', $this->lg);
            $data['list'][$key]['finally_description'] = dao('Article')->getLgValue($value, 'description', $this->lg);
        }

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

        $field = 'content,title,description';
        if ($this->lg != 'zh') {
            $field = "title_{$this->lg},content_{$this->lg},description_{$this->lg}";
        }
        $field .= ',created';

        $data = dao('Article')->getRowContent($map, $field, 1);

        $data['finally_content']     = dao('Article')->getLgValue($data, 'content', $this->lg);
        $data['finally_title']       = dao('Article')->getLgValue($data, 'title', $this->lg);
        $data['finally_description'] = dao('Article')->getLgValue($data, 'description', $this->lg);

        $data['content'] = str_replace('src="', 'src="' . Start::$config['h5Url'], $data['content']);
        $this->assign('data', $data);

        $this->appReturn(array('msg' => '获取数据成功', 'data' => $data));
    }

}
