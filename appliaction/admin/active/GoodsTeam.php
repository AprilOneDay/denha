<?php
/**
 * 商品团购活动
 */
namespace app\admin\active;

use app\admin\Init;
use denha\Pages;

class GoodsTeam extends Init
{
    /** 活动列表 */
    public function lists()
    {
        $pageNo = get('pageNo', 'intval', 0);

        $field   = get('field', 'text', '');
        $keyword = get('keyword', 'text', '');

        $param = (array) get('param');

        $pageSize = 20;
        $offer    = max(($pageNo - 1), 0) * $pageSize;

        $param['field'] = 'name';

        $map = [];

        if (!empty($field) && !empty($keyword)) {
            if ($field == 'name' || $field == 'uid') {
                $map[$field] = $keyword;
            }

            $param['field']   = $field;
            $param['keyword'] = $keyword;
        }

        $lists = table('active_goods_team')->where($map)->limit($offer, $pageSize)->select();
        $total = table('active_goods_team')->where($map)->count();
        $page  = new Pages($total, $pageNo, $pageSize, url('lists', $param));

        foreach ($lists as $key => $item) {
        	
        	
            $lists[$key]['nickname'] = dao('User')->getNickname($item['uid']);
            $lists[$key]['nums']     = count((array) explode(',', $item['join_uids']));
        }

        $other = [];

        $this->show('', ['other' => $other, 'lists' => $lists, 'pages' => $page->loadConsole(), 'param' => $param]);

        $this->show();
    }

    /** 活动编辑 */
    public function edit()
    {
        if ($id) {
            $data = table('team')->where('id', $id)->find();
        } else {
            $data = [];
        }

        $this->show('', ['data' => $data]);
    }

    /** 活动提交 */
    public function editPost()
    {

    }

    /** 删除活动 */
    public function del()
    {

    }
}
