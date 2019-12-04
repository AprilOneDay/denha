<?php
/**
 * 采购商品列表
 */
namespace app\admin\purchaser;

use app\admin\Init;
use denha\Pages;

class Goods extends Init
{
    public function lists()
    {

        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 25);

        $param = (array) get('param', 'text', '');

        !empty($param['field']) ?: $param['field'] = 'title';

        !empty($param['column_id']) ?: $param['column_id'] = 0;

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

        $map['is_show'] = 1;

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

    public function detail($id)
    {
        $map['is_show']    = 1;
        $map['del_status'] = 0;
        $map['id']         = $id;
        $modelId           = table('Goods')->where($map)->value('model_id');

        if (!$modelId) {
            $this->ajaxReturn(['status' => false, 'msg' => '商品模型不存在']);
        }

        $modelTable = getVar('admin.model.type')[$modelId]['db'];

        $goods     = table('Goods')->getTableName();
        $goodsData = table('Goods' . $modelTable)->getTableName();

        $map                         = [];
        $map[$goods . '.id']         = $id;
        $map[$goods . '.del_status'] = 0;
        $map[$goods . '.is_show']    = 1;

        $field = "$goods.id,$goods.seller_uid,$goods.video,$goods.description,$goods.model_id,$goods.category_id,$goods.integral,$goods.title,$goods.price,$goods.sell_price,$goods.thumb,$goods.spec_parentid,$goodsData.content,$goodsData.ablum";

        // 团购模型
        if ($modelId == 5) {
            $field .= ",$goodsData.team_num,$goodsData.team_time";
        }

        $data = table('Goods')->join($goodsData)->where($map)->field($field)->find();

        if (!$data) {
            $this->ajaxReturn(['status' => false, 'msg' => '信息不存在']);
        }

        $data['video']   = $data['video'] ? URL . $data['video'] : '';
        $data['thumb']   = imgUrl($data['thumb'], 'goods');
        $data['ablum']   = $data['ablum'] ? (array) imgUrl($data['ablum'], 'goods') : （array）imgUrl($data['thumb'], 'goods');
        $data['content'] = str_replace('/uploadfile/ueditor/', URL . '/uploadfile/ueditor/', $data['content']);

        // 获取规格
        $data['specList'] = table('GoodsSpec')->where('goods_id', $id)->select();

        // 获取所有选择的规格分类id
        $specIdArray = [];
        foreach ($data['specList'] as $key => $value) {
            $specIdArray = array_merge($specIdArray, explode(',', $value['category']));
        }

        // 拼装规格文案
        $spec = table('Category')->where(['id' => ['in', $data['spec_parentid']]])->field('name,id')->select();
        if ($spec) {
            $spec = array_map(function ($value) use ($specIdArray) {
                $map['is_show']  = 1;
                $map['parentid'] = $value['id'];
                $map['id']       = array('in', $specIdArray);
                $value['child']  = table('Category')->where($map)->field('name,id')->select();
                return $value;
            }, $spec);
        }
        $data['spec'] = $spec ? $spec : [];

        // 判断直接购买  积分商品 团购商品只可直接购买
        $data['is_only_buy'] = 0;
        // 积分商品 团购商品 体验卷
        if (in_array($data['category_id'], [1147, 1091, 1148])) {
            $data['is_only_buy'] = 1;
        }

        if ($modelId == 5) {
            $data['teamDetail'] = $this->getTeamDetail($id, $teamSn, $data['team_num']);
        }

        // 获取店铺信息
        $shop = table('user_shop')->where(['uid' => $data['seller_uid']])->find();
        if ($shop) {
            $shop['avatar'] = imgUrl($shop['avatar'], 'shop', '80x80');
        }

        $data['shop'] = $shop ? $shop : (object) [];
        // 获取当前不可选择的规格分类id
        $data['dsiableSpecCategory'] = $this->getDsiableOptionalSpecCategory($id);

        $this->show('', [
            'data' => $data,
        ]);
    }

    /** 获取当前不可选规格id  */
    public function getDsiableOptionalSpecCategory($goodsId, $specIds = '')
    {
        $key = $specIds ? count(explode(',', $specIds)) : 0;

        // 库存0
        $map             = [];
        $map['goods_id'] = $goodsId;
        $map['is_stock'] = 1;
        $map['stock']    = 0;
        if ($specIds) {
            $map['category'] = ['find_in_set', $specIds];
        }

        $lists = table('goods_spec')->where($map)->column('category');

        $dsiableOptional = []; // 不可选规格分类

        $count = 0;
        foreach ($lists as $item) {
            $item = explode(',', $item);

            $count = count($item);

            isset($item[$key]) ? $dsiableOptional[$item[$key]] = $item[$key] : '';
        }

        // 过滤掉存在库存或者不限制库存的分类id
        // 最后一层的时候不需要过滤
        if ($dsiableOptional && ($key + 1) !== $count) {
            $useOptional = []; // 可选规格分类
            // 库存大于0
            $map             = [];
            $map['goods_id'] = $goodsId;
            $map['is_stock'] = 1;
            $map['stock']    = ['>', 0];
            $map['category'] = ['find_in_set', implode(',', $dsiableOptional), 'OR'];

            $lists = table('goods_spec')->where($map)->column('category');

            // echo table('goods_spec')->getLastSql();die;

            foreach ($lists as $item) {
                $item                                          = explode(',', $item);
                isset($item[$key]) ? $useOptional[$item[$key]] = $item[$key] : '';
            }

            // 库存不限制的
            $map             = [];
            $map['goods_id'] = $goodsId;
            $map['is_stock'] = 0;
            $map['category'] = ['find_in_set', implode(',', $dsiableOptional), 'OR'];

            $lists = table('goods_spec')->where($map)->column('category');

            // echo table('goods_spec')->getLastSql();die;
            foreach ($lists as $item) {
                $item = explode(',', $item);

                isset($item[$key]) ? $useOptional[$item[$key]] = $item[$key] : '';
            }

            foreach ($useOptional as $categoryId) {

                // print_r($dsiableOptional);
                // print_r($useOptional);die;

                if (in_array($categoryId, $dsiableOptional)) {
                    unset($dsiableOptional[$categoryId]);
                }
            }

        }

        // $this->ajaxReturn(['status' => true, 'data' => array_values($dsiableOptional)]);

        if (IS_AJAX) {
            $this->ajaxReturn(['status' => true, 'data' => array_values($dsiableOptional)]);
        } else {
            return array_values($dsiableOptional);
        }

    }

}
