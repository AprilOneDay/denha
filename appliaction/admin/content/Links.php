<?php
/**
 * 友情链接模块
 */
namespace app\admin\content;

use app\admin\Init;
use denha\Pages;

class Links extends Init
{
    public function lists()
    {
        $param = get('param');

        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 25);

        $offer = max(($pageNo - 1), 0) * $pageSize;

        $map = [];

        if (isset($param['category']) && $param['category']) {
            $map['category'] = $param['category'];
        }

        if (isset($param['field']) && isset($param['keyword'])) {
            if ($param['field'] == 'name') {
                $map['name'] = ['like', '%' . $param['keyword'] . '%'];
            }
        }
	
        $list = table('Links')->where($map)->limit($offer, $pageSize)->order('sort asc,id desc')->select();

        $total = table('Links')->where($map)->count();
        $page  = new Pages($total, $pageNo, $pageSize, url('', $param));

        $other = [
            'targetCopy'   => [1 => '当前窗口', 2 => '新窗口'],
            'categoryCopy' => dao('Category')->getList(1168),
        ];

        $this->show('', [
            'list'  => $list,
            'param' => $param,
            'pages' => $page->loadConsole(),
            'other' => $other,
        ]);

    }

    public function edit()
    {
        $id = get('id', 'intval', 0);
        if ($id) {
            $data = table('Links')->where('id', $id)->find();
        } else {
            $data = ['sort' => 0];
        }

        $other = array(
            'targetCopy'   => [1 => '当前窗口', 2 => '新窗口'],
            'categoryCopy' => dao('Category')->getList(1168),
        );

        $this->show('', [
            'data'  => $data,
            'other' => $other,
        ]);
    }

    public function editPost()
    {
        $id = get('id', 'intval', 0);

        $data['category'] = post('category', 'text', '');
        $data['name']     = post('name', 'text', '');
        $data['name']     = post('name', 'text', '');
        $data['thumb']    = post('thumb', 'img', '');
        $data['url']      = post('url', 'text', '');
        $data['sort']     = post('sort', 'intval', 0);
        $data['target']   = post('target', 'intval', 0);

        if (!$data['category']) {
            $this->ajaxReturn(['status' => false, 'msg' => '请选择分类']);
        }

        if (!$data['name']) {
            $this->ajaxReturn(['status' => false, 'msg' => '请输入名称']);
        }

        if (!$id) {
            $result = table('Links')->add($data);
        } else {
            $result = table('Links')->where('id', $id)->save($data);
        }

        if ($result === false) {
            $this->ajaxReturn(['status' => false, 'msg' => '操作失败']);
        }

        $this->ajaxReturn(['status' => true, 'msg' => '操作成功']);
    }

    /** 快速修改参数 */
    public function changeDataPost()
    {
        $id    = post('id', 'intval', 0);
        $field = post('field', 'text', '');
        $value = post($field, 'text', '');

        if (!$id || !in_array($field, array('name', 'url'))) {
            $this->ajaxReturn(['status' => false, 'msg' => '参数错误']);
        }

        $result = table('Links')->where('id', $id)->save($field, $value);

        if ($result == false) {
            $this->ajaxReturn(['status' => false, 'msg' => '修改失败']);
        }

        $this->ajaxReturn(['status' => true, 'msg' => '修改成功']);
    }

    /** 删除分类 */
    public function delPost()
    {
        $id = post('id', 'intval');

        //执行删除操作
        $map['id'] = $id;
        $result    = table('Links')->where($map)->delete();
        if ($result === false) {
            $this->ajaxReturn(['status' => false, 'msg' => '删除失败']);
        }

        $this->ajaxReturn(['status' => true, 'msg' => '删除成功']);
    }

}
