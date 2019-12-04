<?php
/**
 * 文章内容管理
 */
namespace app\admin\content;

use app\admin\Init;
use denha\Pages;

class GoodsList extends Init
{
    public function lists()
    {

        $isComment = true; // 显示评论按钮

        $param = (array) get('param', 'text', '');

        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 25);

        $param['field']     = $param['field'] ?? 'title';
        $param['column_id'] = $param['column_id'] ?? 0;

        $offer = max(($pageNo - 1), 0) * $pageSize;

        $map['del_status'] = 0;

        if (!empty($param['column_id'])) {
            $map['column_id'] = $param['column_id'];
        }

        if (!empty($param['category_id'])) {
            $map['category_id'] = ['find_in_set', $param['category_id']];
        }

        if (!empty($param['is_recommend'])) {
            $map['is_recommend'] = $param['is_recommend'];
        }

        if (!empty($param['is_show'])) {
            $map['is_show'] = $param['is_show'];
        }

        if (!empty($param['field']) && !empty($param['keyword'])) {
            if ($param['field'] == 'title') {
                $map['title'] = ['instr', $param['keyword']];
            }
        }

        $list  = table('Goods')->where($map)->limit($offer, $pageSize)->order('id desc')->select();
        $total = table('Goods')->where($map)->count();
        $page  = new Pages($total, $pageNo, $pageSize, url('', $param));

        $list = array_map(function ($value) {
            $value['category_id']     = explode(',', $value['category_id']);
            $value['seller_nickname'] = dao('UserShop')->getName($value['seller_uid']);
            $value['comment_nums']    = (int) table('Comment')->where('type', 1)->where('coding', $value['id'])->where('parent_id', 0)->count();
            return $value;
        }, $list);

        $other = [
            'categoryCopy'   => dao('Category')->getList('1089'),
            'columnListCopy' => dao('Admin.Column')->columnList($param['column_id'], $this->webType),
            'isComment'      => $isComment,
        ];

        $this->show('', [
            'list'         => $list,
            'param'        => $param,
            'other'        => $other,
            'addUrlParams' => ['model_id' => 1, 'column_id' => $param['column_id']],
            'pages'        => $page->loadConsole(),
            'navs'         => dao('Admin.Column')->navs($param['column_id']),
        ]);
    }

}
