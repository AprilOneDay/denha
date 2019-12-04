<?php
/**
 * 文章内容管理
 */
namespace app\admin\content;

use app\admin\Init;

class ArticleEdit extends Init
{

    //模型配置信息
    private static $model;
    //模型ID
    private static $modelId;
    //当前模型数据库
    private static $dataTable;
    //模板视图地址
    private static $tpl;
    //栏目id
    private static $columnId = 0;

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

            $modelTable = getVar('admin.model.type');

            if ($isEdit) {
                abort('存在子级栏目,不可创建文章');
            }
        } elseif ($id) {
            $modelId = table('Article')->where('id', $id)->value('model_id');
        }

        if (empty($modelTable[$modelId]) || !$modelId) {
            abort('模型配置信息不存在....[' . $modelId . ']');
        }

        self::$modelId   = $modelId;
        self::$model     = $modelTable[self::$modelId];
        self::$dataTable = self::$model['db'];
        self::$tpl       = 'article_edit/edit_' . self::$model['tpl'];

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

    //保存主表信息
    public function defaults()
    {
        $id = get('id', 'intval', 0);

        $data['title']          = post('title', 'text', '');
        $data['title_en']       = post('title_en', 'text', '');
        $data['title_jp']       = post('title_jp', 'text', '');
        $data['description']    = post('description', 'text', '');
        $data['description_en'] = post('description_en', 'text', '');
        $data['description_jp'] = post('description_jp', 'text', '');
        $data['btitle']         = post('btitle', 'text', '');
        $data['thumb']          = post('thumb', 'img', '');
        $data['origin']         = post('origin', 'text', '');
        $data['jump_url']       = post('jump_url', 'text', '');
        $data['push_id']        = implode(',', (array) post('push_id', 'text', ''));
        $data['tags']           = post('tags', 'text', '');
        $data['hot']            = post('hot', 'intval', 0);

        $data['is_show']   = post('is_show', 'intval', 1);
        $data['is_review'] = post('is_review', 'intval', 1);
        $data['column_id'] = post('column_id', 'intval', 1);

        $data['created']      = post('created', 'time', '');
        $data['publish_time'] = post('publish_time', 'time', '');

        $data['model_id'] = self::$modelId;

        $modelId = table('Column')->where('id', $data['column_id'])->value('model_id');
        if ($modelId != self::$modelId) {
            $this->ajaxReturn(['status' => false, 'msg' => '栏目模型不一致,不可保存']);
        }

        if (!$data['title']) {
            $this->ajaxReturn(['status' => false, 'msg' => '请填写标题']);
        }

        //编辑
        if ($id) {
            if (!$data['created']) {
                unset($data['created']);
            }

            if (!$data['publish_time']) {
                unset($data['publish_time']);
            }

            $result = table('Article')->where('id', $id)->save($data);
            if ($result === false) {
                return false;
            } else {
                return $id;
            }
        }
        //添加
        else {
            $data['created'] = $data['publish_time'] = TIME;
            $result          = table('Article')->add($data);
            if ($result) {
                return $result;
            } else {
                return false;
            }
        }

    }

    /** 删除文章 */
    public function del()
    {

        $id = post('id', 'text', 0);

        if (!$id) {
            $this->ajaxReturn(['status' => false, 'msg' => '参数错误']);
        }

        $result = table('Article')->where('id', 'in', $id)->save('del_status', 1);

        $this->ajaxReturn(['status' => true, 'msg' => '删除成功']);

    }

    /** 文章复制 */
    public function copy()
    {
        $ids      = get('ids', 'text', '');
        $columnId = get('column_id', 'intval', 0);

        $other = [
            'columnListCopy' => dao('Admin.Column')->columnList(0, $this->webType),
        ];

        $this->show('', ['other' => $other, 'columnId' => $columnId]);
    }

    /** 文章复制提交 */
    public function copyPost()
    {
        $id = get('id', 'intval', 0);

        $columnId = post('column_id', 'intval', '');

        if (!$id) {
            $this->ajaxReturn(false, '参数错误');
        }

        $dataBase = table('Article')->where('id', $id)->find();
        $dataDep  = table('Article' . self::$dataTable)->where('id', $id)->find();

        // 判断模型是否一致
        $modelId = table('Column')->where('id', $columnId)->value('model_id');
        if ($dataBase['model_id'] != $modelId) {
            $this->ajaxReturn(false, '模型不一致,不可以复制到该栏目');
        }

        //开启事务
        table('Article')->startTrans();

        unset($dataBase['id']);

        $newId = table('Article')->add($dataBase);

        if ($newId === false) {
            table('Article')->rollback();
            $this->ajaxReturn(false, '主表复制失败');
        }

        $dataDep['id'] = $newId;

        $result = table('Article' . self::$dataTable)->add($dataDep);

        if ($result === false) {
            table('Article')->rollback();
            $this->ajaxReturn(false, '附表复制失败');
        }

        table('Article')->commit();
        $this->ajaxReturn(true, '复制成功');

    }

    /** 获取内容详情 */
    private function getEditConent($id = 0)
    {
        if (!$id) {
            return '';
        }

        $article     = table('Article')->getTableName();
        $articleData = table('Article' . self::$dataTable)->getTableName();

        $map[$article . '.id']     = $id;
        $map[$articleData . '.id'] = $id;

        $rs = table('Article')->join($articleData)->where($map)->find();

        $tagsCopy = dao('Category')->getName($rs['tags']);
        $tagsCopy = count($tagsCopy) > 1 ? implode(' ', $tagsCopy) : $tagsCopy;

        $rs['tags_copy'] = $tagsCopy;
        if (!$rs) {
            abort('附属表异常');
        }

        return $rs;
    }

    // 文章模型
    public function edit_1()
    {
        $id       = get('id', 'intval', 0);
        $columnId = get('column_id', 'intval', 0);

        if ($id) {
            $rs = $this->getEditConent($id);
        } else {
            $rs = [
                'is_show'      => 1,
                'is_recommend' => 0,
                'created'      => date('Y-m-d', TIME),
                'model_id'     => self::$modelId,
                'column_id'    => $columnId,
                'tags'         => '',
            ];
        }

        $other = [
            'columnListCopy' => dao('Admin.Column')->columnList(0, $this->webType),
            'pushCopy'       => dao('Category')->getList(1135),
            'tagsData'       => zipStr(dao('Category')->getListTree(1109)),
        ];

        $this->assign('data', $rs);
        $this->assign('other', $other);
        $this->show(self::$tpl);

    }

    public function editPost_1()
    {
        $id = get('id', 'intval', 0);

        $data = post('info');

        //开启事务
        table('Article')->startTrans();
        $dataId = $this->defaults(); //保存主表

        if (!$dataId) {
            table('Article')->rollback();
            $this->ajaxReturn(array('status' => false, 'msg' => '保存主表失败'));
        }

        //编辑
        if ($dataId && $id) {
            $resultData = table('Article' . self::$dataTable)->where('id', $id)->save($data);
            $dataId     = $id;
        } else {
            $data['id'] = $dataId;
            $resultData = table('Article' . self::$dataTable)->add($data);
        }

        if ($resultData === false) {
            table('Article')->rollback();
            $this->ajaxReturn(array('status' => false, 'msg' => '操作失败,请重新尝试'));
        }

        table('Article')->commit();
        $this->ajaxReturn(array('status' => true, 'msg' => '操作成功'));

    }

    // 直播模型
    public function edit_2()
    {
        $id       = get('id', 'intval', 0);
        $columnId = get('column_id', 'intval', 0);

        if ($id) {
            $rs = $this->getEditConent($id);
        } else {
            $rs = [
                'is_show'      => 1,
                'is_recommend' => 0,
                'created'      => date('Y-m-d', TIME),
                'model_id'     => self::$modelId,
                'column_id'    => $columnId,
                'tags'         => '',
            ];
        }

        $other = [
            'columnListCopy' => dao('Admin.Column')->columnList(0, $this->webType),
            'pushCopy'       => dao('Category')->getList(1135),
            'tagsData'       => zipStr(dao('Category')->getListTree(1109)),
        ];

        $this->assign('data', $rs);
        $this->assign('other', $other);
        $this->show(self::$tpl);

    }

    public function editPost_2()
    {
        $id = get('id', 'intval', 0);

        $data = post('info');

        //开启事务
        table('Article')->startTrans();
        $dataId = $this->defaults(); //保存主表

        if (!$dataId) {
            table('Article')->rollback();
            $this->ajaxReturn(array('status' => false, 'msg' => '保存主表失败'));
        }

        //编辑
        if ($dataId && $id) {
            $resultData = table('Article' . self::$dataTable)->where('id', $id)->save($data);
            $dataId     = $id;
        } else {
            $data['id'] = $dataId;
            $resultData = table('Article' . self::$dataTable)->add($data);
        }

        if ($resultData === false) {
            table('Article')->rollback();
            $this->ajaxReturn(array('status' => false, 'msg' => '操作失败,请重新尝试'));
        }

        table('Article')->commit();
        $this->ajaxReturn(array('status' => true, 'msg' => '操作成功'));

    }

    // 店铺模型
    public function edit_5()
    {
        $id       = get('id', 'intval', 0);
        $columnId = get('column_id', 'intval', 0);

        if ($id) {
            $rs = $this->getEditConent($id);
        } else {
            $rs = [
                'is_show'      => 1,
                'is_recommend' => 0,
                'created'      => date('Y-m-d', TIME),
                'model_id'     => self::$modelId,
                'column_id'    => $columnId,
                'tags'         => '',
            ];
        }

        // print_r(dao('Category')->getListTree(1109));

        $other = array(
            'columnListCopy' => dao('Admin.Column')->columnList(0, $this->webType),
            'pushCopy'       => dao('Category')->getList(1135),
            'tagsData'       => zipStr(dao('Category')->getListTree(1109)),
        );

        $this->assign('data', $rs);
        $this->assign('other', $other);
        $this->show(self::$tpl);

    }

    public function editPost_5()
    {
        $id = get('id', 'intval', 0);

        $data = post('info');

        //开启事务
        table('Article')->startTrans();
        $dataId = $this->defaults(); //保存主表

        if (!$dataId) {
            table('Article')->rollback();
            $this->ajaxReturn(array('status' => false, 'msg' => '保存主表失败'));
        }

        //编辑
        if ($dataId && $id) {
            $resultData = table('Article' . self::$dataTable)->where(array('id' => $id))->save($data);
            $dataId     = $id;
        } else {
            $data['id'] = $dataId;
            $resultData = table('Article' . self::$dataTable)->add($data);
        }

        if ($resultData === false) {
            table('Article')->rollback();
            $this->ajaxReturn(array('status' => false, 'msg' => '操作失败,请重新尝试'));
        }

        table('Article')->commit();
        $this->ajaxReturn(array('status' => true, 'msg' => '操作成功'));

    }

}
