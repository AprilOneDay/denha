<?php
/**
 * 文章内容管理
 */
namespace app\admin\content;

use app\admin\Init;
use app\tools\util\base\MenuTree;

class GoodsEdit extends Init
{
    //模型配置信息
    private static $model;
    //模型ID
    private static $modelId;
    //当前模型数据库
    private static $dataTable;
    //模板视图地址
    private static $tpl;
    //模型数据库类型

    public function __construct()
    {
        parent::__construct();

        $id       = params('id', 'intval', 0); // 商品id
        $columnId = params('column_id', 'intval', 0); // 栏目id
        $modelId  = params('model_id', 'intval', 0); // 模型id

        if (is_array($id)) {
            $id = reset($id);
        }

        $modelTable = getVar('admin.model.type');

        if ($columnId) {
            $modelId = table('Column')->where('id', $columnId)->value('model_id');
            $isEdit  = table('Column')->where('parentid', $columnId)->value('id');

            if ($isEdit) {
                abort('存在子级栏目,不可创建文章');
            }

        } elseif ($id) {
            $modelId = table('Goods')->where('id', $id)->value('model_id');
        }

        if (empty($modelTable[$modelId]) || !$modelId) {
            abort('模型配置信息不存在....');
        }

        self::$modelId   = $modelId;
        self::$model     = $modelTable[self::$modelId];
        self::$dataTable = self::$model['db'];
        self::$tpl       = 'goods_edit/edit_' . self::$model['tpl'];

        if (!self::$dataTable) {
            abort('模型库尚未创建....');
        }

    }

    //模型数据库类型
    public function edit()
    {
        $action = 'edit_' . self::$model['tpl'];
        return $this->$action();
    }

    public function editPost()
    {
        $action = 'editPost_' . self::$model['tpl'];
        return $this->$action();
    }

    public function spec()
    {
        $childIdArray = function ($chlid = 0, &$idArray = []) use (&$childIdArray) {
            $idArray[] = $chlid;
            //获取下级分类
            $chlidList = table('Category')->where('parentid', $chlid)->field('id')->column();

            //递归条件
            if ($chlidList) {
                foreach ($chlidList as $key => $value) {
                    $childIdArray((int) $value, $idArray);
                }
            }
            //返回需要删除的id
            return $idArray;
        }; //记得这里必须加``;``分号，不加分号php会报错，闭包函数

        $idArray = $childIdArray(1071);

        $map['is_show'] = 1;
        $map['id']      = ['in', $idArray];
        $list           = table('Category')->where($map)->field('id,name,parentid')->order('sort asc,id asc')->select();

        $tree = new MenuTree();
        $tree->setConfig('id', 'parentid', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
        $list = $tree->getLevelTreeArray($list);

        $this->show('', ['max' => 1, 'list' => $list]);
    }

    //保存主表信息
    public function defaults($option = [])
    {
        $id = get('id', 'intval', 0);

        $data['title']         = post('title', 'trim.text', '');
        $data['goods_sn']      = post('goods_sn', 'trim.text', '');
        $data['description']   = post('description', 'text', '');
        $data['spec_parentid'] = post('spec_parentid', 'text', '');
        $data['video']         = post('video', 'trim.text', '');

        $data['column_id'] = post('column_id', 'intval', 0);

        $data['push_id'] = post('push_id', 'intval.implode');

        $data['category_id']  = post('category_id', 'intval.implode');
        $data['is_show']      = post('is_show', 'intval', 1);
        $data['is_review']    = post('is_review', 'intval', 1);
        $data['is_virtual']   = post('is_virtual', 'intval', 0);
        $data['seller_uid']   = post('seller_uid', 'intval', '');
        $data['created']      = post('created', 'time', '');
        $data['publish_time'] = post('publish_time', 'time', '');
        $data['sell_base']    = post('sell_base', 'intval', 0);
        $data['integral']     = post('integral', 'intval', 0);
        $data['team_num']     = post('team_num', 'intval', 0);

        $data['thumb'] = post('thumb', 'img', '');

        $price     = post('price', 'text', 0);
        $sellPrice = post('sell_price', 'text', 0);

        $data['model_id'] = self::$modelId;

        $modelId = table('Column')->where('id', $data['column_id'])->value('model_id');
        if ($modelId != self::$modelId) {
            $this->ajaxReturn(['status' => false, 'msg' => '栏目模型不一致,不可保存']);
        }

        if (!$data['title']) {
            return ['status' => false, 'msg' => '请填写标题'];
        }

        //保存规格信息
        $specData = post('spec');
        $specHash = md5(json_encode($specData)); // 商品规格hash码
        // 获取规格最低价格 替换商品价格 如果不存在规格价格 则直接使用商品价格
        list($price, $sellPrice) = $this->getSpecPirce($specData, $price, $sellPrice);
        // if (!$price) {
        //     $this->ajaxReturn(['status' => false, 'msg' => '请输入商品价格']);
        // }
        // 促销价必须必原价小 并且默认促销价 = 原价
        $sellPrice = ($sellPrice <= 0 || $sellPrice > $price) ? $price : $sellPrice;

        $data['price']      = dao('Number')->currency($price);
        $data['sell_price'] = dao('Number')->currency($sellPrice);

        //编辑
        if ($id) {
            if (!$data['created']) {
                unset($data['created']);
            }

            if (!$data['publish_time']) {
                unset($data['publish_time']);
            }

            $result = table('Goods')->where('id', $id)->save($data);
        }
        //添加
        else {

            if (!$data['publish_time']) {
                $data['publish_time'] = TIME;
            }

            if (!$data['created']) {
                $data['created'] = TIME;
            }

            $id = $result = table('Goods')->add($data);

        }

        // 直接返回错误
        if ($result === false) {
            return ['status' => false, 'msg' => 'hash不一致'];
        } else {

            // 保存商品规格信息
            if ($specData) {
                $resSpec = $this->saveSpec($specData, $id, ['hash' => $specHash]);

                if (!$resSpec['status']) {
                    return $resSpec;
                }
            }

        }

        return ['status' => true, 'msg' => '商品主表信息保存成功', 'id' => $id];

    }

    /** 检测商品规格hash码 true => hash码一致 false => hash码不一致  */
    public function checkSpecHash($goodsId, $newSpecHash)
    {
        $specHash = table('Goods')->where('id', $goodsId)->value('spec_hash');
        if (!$specHash || $specHash != $newSpecHash) {
            return ['status' => false, 'msg' => '商品规格hash码不一致'];
        }

        return ['status' => true, 'msg' => '商品hash码一致', 'hash' => $newSpecHash];
    }

    /**
     * 商品规格信息保存入库
     * @date   2018-12-07T10:13:55+0800
     * @author ChenMingjiang
     * @param  [type]                   $specData [规格数组信息]
     * @param  integer                  $goodsId  [商品id]
     * @param  boolean                  $options [配置参数]
     *                                  save 是否保存商品规格 true保存
     *                                  hash 商品规格hash码 用于判断是否存在更新
     * @return [type]                   [description]
     */
    public function saveSpec($specItems, $goodsId = 0, $options = [])
    {
        $save = isset($options['save']) ? $options['save'] : true;
        $hash = isset($options['hash']) ? $options['hash'] : '';

        if (!$goodsId) {
            return ['status' => false, 'msg' => '商品规格goods_id 必须存在'];
        }

        // 判断hash码是否相同
        $isAsHash = $this->checkSpecHash($goodsId, $hash)['status'];
        if ($isAsHash) {
            return ['status' => true, 'msg' => '规格未发生变化'];
        }

        if (!$save) {
            return ['status' => true, 'msg' => '商品规格无需保存'];
        }

        $specIds = []; // 存在操作的规格id
        foreach ($specItems as $key => $item) {

            $specData = [
                'goods_id'   => $goodsId,
                'category'   => isset($item['category']) ? $item['category'] : '',
                'price'      => $item['price'],
                'sell_price' => $item['sell_price'] > 0 ? $item['sell_price'] : $item['price'],
                'exw_price'  => $item['exw_price'],
                'stock'      => $item['stock'],
                'is_stock'   => !empty($item['is_stock']) ? $item['is_stock'] : 0,
            ];

            if ($specData['price'] < $specData['sell_price']) {
                return ['status' => false, 'msg' => '原价必须大于促销价'];
            }

            if ($specData['price'] <= 0) {
                return ['status' => false, 'msg' => '请为所有的商品，输入价格', 'data' => $specData['price'], 'key' => $key];
            }

            // 编辑
            if ($item['id']) {
                $specIds[] = $item['id'];
                $result    = table('GoodsSpec')->where('id', $item['id'])->save($specData);
            }
            // 添加
            else {
                $specIds[] = $result = table('GoodsSpec')->add($specData);
            }

            if ($result === false) {
                return ['status' => false, 'msg' => '商品规格信息保存失败'];
            }
        }

        // 删除操作
        if ($specIds) {
            $map             = [];
            $map['goods_id'] = $goodsId;
            $map['id']       = ['not in', $specIds];
            $result          = table('GoodsSpec')->where($map)->save('del_status', 1);
        }

        if ($result === false) {
            return ['status' => false, 'msg' => '规格删除异常'];
        }

        return ['status' => true, 'msg' => '商品规格保存成功'];
    }

    /**
     * 获取规格最低价格
     * @date   2018-12-07T10:15:02+0800
     * @author ChenMingjiang
     * @param  [type]                   $specItems [商品规格数组]
     * @param  [type]                   $price     [商品原价]
     * @param  [type]                   $sellPrice [商品促销价]
     * @return [type]                   [return 商品原价 商品促销价]
     */
    public function getSpecPirce($specItems, $price, $sellPrice)
    {
        if ($specItems) {
            foreach ($specItems as $key => $value) {
                //获取商品最低价格
                $price = $price > $value['price'] || $price <= 0 ? $value['price'] : $price;
                //获取销售最低价格
                $sellPrice = ($sellPrice > $value['sell_price'] || $sellPrice <= 0) ? $value['sell_price'] : $sellPrice;
            }
        }

        return [$price, $sellPrice];
    }

    public function del()
    {

        $id = post('id', 'text', 0);

        if (!$id) {
            $this->ajaxReturn(array('status' => false, 'msg' => '参数错误'));
        }

        $result = table('Goods')->where('id', 'in', $id)->save('del_status', 1);
        if ($result === false) {
            $this->ajaxReturn(['status' => false, 'msg' => '删除失败了']);
        }

        $this->ajaxReturn(['status' => true, 'msg' => '删除成功']);
    }

    private function getEditConent($id = 0)
    {
        if (!$id) {
            return '';
        }

        $article     = table('Goods')->getTableName();
        $articleData = table('Goods' . self::$dataTable)->getTableName();

        $map[$article . '.id']     = $id;
        $map[$articleData . '.id'] = $id;

        $rs = table('Goods')->join($articleData)->where($map)->find();

        $rs['category_id']     = explode(',', $rs['category_id']); // 分割分类
        $rs['seller_uid_copy'] = dao('UserShop')->getName($rs['seller_uid']); // 获取店铺名称

        if (!$rs) {
            abort('附属表异常');
        }

        //获取规格
        $rs['specList'] = table('GoodsSpec')->where('goods_id', $id)->where('del_status', 0)->select();
        $rs['specList'] = array_map(function ($value) {
            $value['spec_name'] = implode(' ', (array) dao('Category')->getName($value['category']));
            return $value;
        }, $rs['specList']);

        return $rs;
    }

    // 图文模型
    public function edit_1()
    {
        $id       = get('id', 'intval', 0);
        $columnId = get('column_id', 'intval', 0);

        if ($id) {
            $rs = $this->getEditConent($id);

            $columnId = $rs['column_id'];
        } else {
            $rs = ['is_show' => 1, 'sell_base' => 0, 'created' => date('Y-m-d', TIME), 'model_id' => self::$modelId, 'sign' => 1];

            $rs['specList'] = [['stock' => 0, 'price' => '0.00', 'sell_price' => '0.00']];
        }

        $other = [
            'categoryCopy'   => dao('Category')->getList(1089),
            'columnListCopy' => dao('Admin.Column')->columnList(0, $this->webType),
            'pushCopy'       => dao('Category')->getList(1135),
            'shops'          => table('user_shop')->where(['status' => 1])->order('uid asc')->select(),
        ];

        $this->show(self::$tpl, ['data' => $rs, 'other' => $other, 'columnId' => $columnId]);

    }

    public function editPost_1()
    {
        $id = get('id', 'intval', 0);

        $data = post('info', 'trim');

        //开启事务
        table('Goods')->startTrans();
        $result = $this->defaults(); //保存主表

        if (!$result['status']) {
            table('Goods')->rollback();
            $this->ajaxReturn($result);
        }

        $dataId = $result['id'];

        //编辑
        if ($dataId && $id) {
            $resultData = table('Goods' . self::$dataTable)->where('id', $id)->save($data);
            $dataId     = $id;
        } else {
            $data['id'] = $dataId;
            $resultData = table('Goods' . self::$dataTable)->add($data);
        }

        if ($resultData === false) {
            table('Goods')->rollback();
            $this->ajaxReturn(['status' => false, 'msg' => '操作附表失败,请重新尝试', 'sql' => table('Goods' . self::$dataTable)->getLastSql()]);
        }

        table('Goods')->commit();
        $this->ajaxReturn(['status' => true, 'msg' => '操作成功']);

    }

    // 团购商品
    public function edit_2()
    {
        $id       = get('id', 'intval', 0);
        $columnId = get('column_id', 'intval', 0);

        if ($id) {
            $rs = $this->getEditConent($id);

            $columnId = $rs['column_id'];
        } else {
            $rs = ['is_show' => 1, 'sell_base' => 0, 'created' => date('Y-m-d', TIME), 'model_id' => self::$modelId, 'sign' => 1];

            $rs['specList'] = [['stock' => 0, 'price' => '0.00', 'sell_price' => '0.00']];
        }

        $other = [
            'categoryCopy'   => dao('Category')->getList(1089),
            'columnListCopy' => dao('Admin.Column')->columnList(0, $this->webType),
            'pushCopy'       => dao('Category')->getList(1135),
        ];

        $this->show(self::$tpl, ['data' => $rs, 'other' => $other, 'columnId' => $columnId]);

    }

    public function editPost_2()
    {
        $id = get('id', 'intval', 0);

        $data = post('info');

        //开启事务
        table('Goods')->startTrans();
        $result = $this->defaults(); //保存主表

        if (!$result['status']) {
            table('Goods')->rollback();
            $this->ajaxReturn($result);
        }

        $dataId = $result['id'];

        //编辑
        if ($dataId && $id) {
            $resultData = table('Goods' . self::$dataTable)->where('id', $id)->save($data);
            $dataId     = $id;
        } else {
            $data['id'] = $dataId;
            $resultData = table('Goods' . self::$dataTable)->add($data);
        }

        if ($resultData === false) {
            table('Goods')->rollback();
            $this->ajaxReturn(['status' => false, 'msg' => '操作附表失败,请重新尝试', 'sql' => table('Goods' . self::$dataTable)->getLastSql()]);
        }

        table('Goods')->commit();
        $this->ajaxReturn(['status' => true, 'msg' => '操作成功']);

    }

    // 积分商品
    public function edit_3()
    {
        $id       = get('id', 'intval', 0);
        $columnId = get('column_id', 'intval', 0);

        if ($id) {
            $rs = $this->getEditConent($id);

            $columnId = $rs['column_id'];
        } else {
            $rs = ['is_show' => 1, 'sell_base' => 0, 'created' => date('Y-m-d', TIME), 'model_id' => self::$modelId, 'sign' => 1];

            $rs['specList'] = [['stock' => 0, 'price' => '0.00', 'sell_price' => '0.00']];
        }

        $other = [
            'categoryCopy'   => dao('Category')->getList(1089),
            'columnListCopy' => dao('Admin.Column')->columnList(0, $this->webType),
            'pushCopy'       => dao('Category')->getList(1135),
        ];

        $this->show(self::$tpl, ['data' => $rs, 'other' => $other, 'columnId' => $columnId]);

    }

    public function editPost_3()
    {
        $id = get('id', 'intval', 0);

        $data = post('info');

        //开启事务
        table('Goods')->startTrans();
        $result = $this->defaults(); //保存主表

        if (!$result['status']) {
            table('Goods')->rollback();
            $this->ajaxReturn($result);
        }

        $dataId = $result['id'];

        //编辑
        if ($dataId && $id) {
            $resultData = table('Goods' . self::$dataTable)->where('id', $id)->save($data);
            $dataId     = $id;
        } else {
            $data['id'] = $dataId;
            $resultData = table('Goods' . self::$dataTable)->add($data);
        }

        if ($resultData === false) {
            table('Goods')->rollback();
            $this->ajaxReturn(['status' => false, 'msg' => '操作附表失败,请重新尝试', 'sql' => table('Goods' . self::$dataTable)->getLastSql()]);
        }

        table('Goods')->commit();
        $this->ajaxReturn(['status' => true, 'msg' => '操作成功']);

    }

    // 课件模型
    public function edit_4()
    {
        $id       = get('id', 'intval', 0);
        $columnId = get('column_id', 'intval', 0);

        if ($id) {
            $rs             = $this->getEditConent($id);
            $rs['resource'] = json_decode($rs['resource'], true);

            $columnId = $rs['column_id'];

        } else {
            $rs = ['is_show' => 1, 'sell_base' => 0, 'created' => date('Y-m-d', TIME), 'model_id' => self::$modelId, 'sign' => 1];

            $rs['resource'] = [['name' => '', 'description' => '', 'resource_type' => '1']];
        }

        $other = [
            'categoryCopy'   => dao('Category')->getList(1089),
            'columnListCopy' => dao('Admin.Column')->columnList(0, $this->webType),
            'pushCopy'       => dao('Category')->getList(1135),
        ];

        $this->show(self::$tpl, ['data' => $rs, 'other' => $other, 'columnId' => $columnId]);

    }

    public function editPost_4()
    {
        $id = get('id', 'intval', 0);

        $resource        = post('resource');
        $data            = post('info');
        $data['exam_id'] = post('info.exam_id', 'intval', 0);

        if (!$resource) {
            $this->ajaxReturn(['status' => false, 'msg' => '请上传课件']);
        }

        $data['resource'] = ['json', $resource];

        //开启事务
        table('Goods')->startTrans();
        $result = $this->defaults(); //保存主表

        if (!$result['status']) {
            table('Goods')->rollback();
            $this->ajaxReturn($result);
        }

        $dataId = $result['id'];

        //编辑
        if ($dataId && $id) {
            $resultData = table('Goods' . self::$dataTable)->where('id', $id)->save($data);
            $dataId     = $id;
        } else {
            $data['id'] = $dataId;
            $resultData = table('Goods' . self::$dataTable)->add($data);
        }

        if ($resultData === false) {
            table('Goods')->rollback();
            $this->ajaxReturn(['status' => false, 'msg' => '操作附表失败,请重新尝试', 'sql' => table('Goods' . self::$dataTable)->getLastSql()]);
        }

        table('Goods')->commit();
        $this->ajaxReturn(['status' => true, 'msg' => '操作成功']);

    }

}
