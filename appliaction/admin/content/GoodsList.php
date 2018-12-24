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
        $param = get('param', 'text');

        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 25);

        !empty($param['field']) ?: $param['field'] = 'title';

        !empty($param['column_id']) ?: $param['column_id'] = 0;

        $offer = max(($pageNo - 1), 0) * $pageSize;

        $map['del_status'] = 0;

        if (!empty($param['column_id'])) {
            $map['column_id'] = $param['column_id'];
        }

        if (!empty($param['category_id'])) {
            $map['category_id'] = $param['category_id'];
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
            $value['seller_nickname'] = $value['seller_uid'] ? dao('User')->shopName($value['seller_uid']) : '自营商品';
            return $value;
        }, $list);

        $other = [
            'categoryCopy'   => dao('Category')->getList('1089'),
            'columnListCopy' => dao('Column', 'admin')->columnList($param['column_id'], $this->webType),
        ];

        $this->show('', [
            'list'         => $list,
            'param'        => $param,
            'other'        => $other,
            'addUrlParams' => ['model_id' => 1, 'column_id' => $param['column_id']],
            'pages'        => $page->loadConsole(),
            'navs'         => dao('Column', 'admin')->navs($param['column_id']),
        ]);
    }

}
