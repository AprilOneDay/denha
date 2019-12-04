<?php
namespace app\admin\content;

use app\admin\Init;
use app\tools\util\base\MenuTree;

class Menus extends Init
{

    /**
     * [index 菜单管理首页]
     * @date   2016-09-05T10:22:28+0800
     * @author Sunpeiliang
     * @return [type]                   [description]
     */
    public function index()
    {
        $map             = [];
        $map['web_type'] = $this->webType;

        $result = table('Column')->where($map)->order('sort asc,id asc')->select();

        if ($result) {
            $modelType = getVar('admin.model.type');

            $tree = new MenuTree();
            $tree->setConfig('id', 'parentid', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
            $list = $tree->getLevelTreeArray($result);
            foreach ($list as $key => $value) {
                $list[$key]['is_show_copy'] = $value['is_show'] ? '√' : '×';

                $model = $modelType[$value['model_id']]['model'];

                if ($model == 'goods') {
                    $list[$key]['article_num'] = table('Goods')->where('column_id', $value['id'])->where('del_status', 0)->count();
                } elseif ($model == 'article') {
                    $list[$key]['article_num'] = table('Article')->where('column_id', $value['id'])->where('del_status', 0)->count();
                }
                
            }

            $this->assign('list', $list);
        }

        $this->show();

    }

    /**
     * [edit 编辑菜单]
     * @date   2016-09-05T10:21:29+0800
     * @author Sunpeiliang
     * @return [type]                   [description]
     */
    public function edit()
    {

        $id       = get('id', 'intval', 0);
        $parentid = get('parentid', 'intval', 0);
        $rs       = table('Column')->where(['id' => $id])->find();

        $autoId = table('Column')->getTableStatus('Auto_increment');

        if ($id == 0 || $parentid != 0) {
            $rs = [
                'parentid' => $parentid,
                'sort'     => 0,
                //'url'      => '/admin/content/article_list/lists?param[column_id]=' . $autoId,
                'is_show'  => 1,
            ];
        }

        $this->assign('tplCopy', getVar('admin.model.tpl'));
        $this->assign('modelCopy', getVar('admin.model.type'));
        $this->assign('treeList', $this->treeList());
        $this->assign('data', $rs);
        $this->show();

    }

    public function editPost()
    {
        $id       = post('id', 'intval', 0);
        $parentid = post('parentid', 'intval', 0);
        $add      = post('add', 'intval', 1);
        $content  = post('content', 'text', '');
        $modelId  = post('model_id', 'intval', 1);
        $url      = post('info.url', 'text', '');
        $tpl      = post('tpl', 'text', '');

        // 获取模型配置信息
        $model = getVar('admin.model.type');

        $data             = post('info');
        $data['web_type'] = $this->webType;
        $data['parentid'] = $parentid;
        $data['model_id'] = $modelId;

        if ($add == 1 && !$data['name']) {
            $this->ajaxReturn(['status' => false, 'msg' => '请填写菜单名称']);
        }

        // 编辑
        if ($id) {

            if (!$url) {
                $data['url'] = url($model[$modelId]['url'], ['param[column_id]' => $id], ['host' => false]);
            }

            if ($tpl) {
                $data['jump_url'] = url($tpl, ['cid' => $id], ['host' => false]);
            }

            $column = table('Column')->where('id', $id)->field('parentid,id')->find();
            if (!$column) {
                $this->ajaxReturn(['status' => false, 'msg' => '栏目不存在']);
            }

            if ($parentid == $id) {
                $this->ajaxReturn(['status' => false, 'msg' => '上级栏目选择错误,不可选择自己为上级栏目']);
            }

            $result = table('Column')->where('id', $id)->save($data);
            if ($result === false) {
                $this->ajaxReturn(['status' => false, 'msg' => '修改失败', 'sql' => table('Column')->getLastSql()]);
            }

            $this->ajaxReturn(['status' => true, 'msg' => '修改成功']);

        }
        // 添加
        else {
            // 编辑 默认复制副标题
            $data['bname'] ?: $data['bname'] = $data['name'];

            $autoId = table('Column')->getTableStatus('Auto_increment');

            $data['created'] = TIME;

            // 批量添加
            if ($add == 2 && $content) {
                $content = explode(PHP_EOL, $content);
                foreach ($content as $key => $value) {

                    if (stripos($value, '|') !== false) {
                        // 拆分别名
                        $value         = explode('|', $value);
                        $data['name']  = $value[0];
                        $data['bname'] = $value[1];
                    } else {
                        $data['name'] = $data['bname'] = $value;
                    }

                    if ($url) {
                        $data['url'] = $url;
                    } else {
                        $data['url'] = url($model[$modelId]['url'], ['param[column_id]' => $autoId], ['host' => false]);
                    }

                    // 如果选择了前台请求模型地址 并且 自定义请求地址未填写
                    if ($tpl && !$data['jump_url']) {
                        $data['jump_url'] = url($tpl, ['cid' => $autoId], ['host' => false]);
                    }

                    $dataAll[] = $data;
                    $autoId++;
                }

                $result = table('Column')->addAll($dataAll);

            }
            // 单条添加
            else {

                if (!$url) {
                    $data['url'] = url($model[$modelId]['url'], ['param[column_id]' => $autoId], ['host' => false]);
                }

                // 如果选择了前台请求模型地址 并且 自定义请求地址未填写
                if ($tpl && !$data['jump_url']) {
                    $data['jump_url'] = url($tpl, ['cid' => $autoId], ['host' => false]);
                }

                $result = table('Column')->add($data);
            }

            if ($result === false) {
                $this->ajaxReturn(['status' => false, 'msg' => '添加失败']);
            }

            $this->ajaxReturn(['status' => true, 'msg' => '添加成功', 'id' => $result]);
        }
    }

    /**
     * 更新排序
     * @date   2017-10-12T11:40:35+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function updateSort()
    {
        $id = post('id');
        foreach ($id as $key => $value) {
            if ($value !== '') {
                $data[$value][] = $key;
            }
        }

        foreach ($data as $key => $value) {
            $map       = [];
            $map['id'] = ['in', $value];

            $result = table('Column')->where($map)->save('sort', $key);

            if ($result === false) {
                $this->ajaxReturn(['status' => false, 'msg' => '更新失败']);
            }

        }

        $this->ajaxReturn(['msg' => '更新成功']);
    }

    /**
     * 删除菜单
     * @date   2017-08-22T14:59:55+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function delete()
    {
        $chlid = post('id', 'intval');

        //删除所有下级分类 引用 &很重要 不然返回不了完整信息
        $delColumn = function ($chlid, &$idArray = []) use (&$delColumn) {
            $idArray[] = $chlid;
            //获取下级分类
            $chlidList = table('Column')->where('parentid', $chlid)->field('id')->column();

            //递归条件
            if ($chlidList) {
                foreach ($chlidList as $key => $value) {
                    $delColumn((int) $value, $idArray);
                }
            }
            //返回需要删除的id
            return $idArray;
        }; //记得这里必须加``;``分号，不加分号php会报错，闭包函数

        //执行闭包函数
        $idArray = $delColumn($chlid);

        //执行删除操作
        $map['id'] = ['in', $idArray];
        $result    = table('Column')->where($map)->delete();
        if (!$result) {
            $this->ajaxReturn(['status' => false, 'msg' => '删除失败']);
        }

        $this->ajaxReturn(['status' => true, 'msg' => '删除成功']);

    }

    /**
     * [children 获取菜单子集]
     * @date   2016-09-30T10:37:55+0800
     * @author Sunpeiliang
     * @return [type]                   [description]
     */
    public function children()
    {
        $id   = get('id', 'intval', 0);
        $menu = table('ConsoleMenu')->order('sort asc,id asc')->select();
        if ($menu) {
            $tree = new MenuTree();
            $tree->setConfig('id', 'parentid');
            $ids = $tree->getChildsId($menu, $id);
            if ($ids) {
                $this->ajaxReturn(['status' => true, 'data' => $ids]);
            }
        }
        $this->ajaxReturn(['status' => false]);
    }

    /**
     * [获取树状菜单列表]
     * @date   2016-09-05T10:21:46+0800
     * @author Sunpeiliang
     */
    public function treeList()
    {
        $map             = [];
        $map['web_type'] = $this->webType;
        $result          = table('Column')->where($map)->field('id,parentid,name,bname')->select();
        if ($result) {
            $tree = new MenuTree();
            $tree->setConfig('id', 'parentid');
            $list = $tree->getLevelTreeArray($result);
            if (isset($list) && $list) {
                foreach ($list as $key => $value) {
                    $list[$key]['htmlname'] = isset($value['delimiter']) ? $value['delimiter'] . $value['name'] : $value['name'];
                }
            }
        }

        return isset($list) ? $list : [];
    }

}
