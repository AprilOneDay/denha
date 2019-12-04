<?php
/**
 * 前台用户管理
 */
namespace app\admin\user;

use app\admin\Init;
use denha\Pages;

class Home extends Init
{
    public function lists()
    {

        $pageNo = get('pageNo', 'intval', 0);

        $field   = get('field', 'text', '');
        $keyword = get('keyword', 'text', '');

        $param = (array) get('param');

        $pageSize = 20;
        $offer    = max(($pageNo - 1), 0) * $pageSize;

        $map['del_status'] = 0;
        $param['field']    = 'id';

        if (!empty($param['type'])) {
            $map['type'] = $param['type'];
        }

        if (!empty($param['status'])) {
            $map['status'] = $param['status'];
        }

        if (!empty($field) && !empty($keyword)) {
            if ($field == 'id' || $field == 'mobile') {
                $map[$field] = $keyword;
            } elseif ($field == 'username') {
                $map['username'] = array('instr', $keyword);
            } elseif ($field = 'nickname') {
                $map['nickname'] = array('instr', $keyword);
            }
            $param['field']   = $field;
            $param['keyword'] = $keyword;
        }

        $lists = table('User')->where($map)->limit($offer, $pageSize)->select();
        $total = table('User')->where($map)->count();
        $page  = new Pages($total, $pageNo, $pageSize, url('lists', $param));

        $other = [
            'typeCopy'   => dao('Category')->getList('1137'), // 会员类型
            'statusCopy' => ['0' => '关闭', '1' => '开启'],
        ];

        $this->show('', ['other' => $other, 'list' => $lists, 'pages' => $page->loadConsole(), 'param' => $param]);
    }

    public function editPost()
    {
        $id = get('id', 'intval', 0);

        //编辑
        if ($id) {
            $data   = post('info');
            $result = table('User')->where('id', $id)->save($data);
        }
        //添加
        else {

            $data      = post('info');
            $password2 = post('password2', 'text', 123456);

            $result = dao('User')->register($data, $password2);
            if (!$result['status']) {
                $this->ajaxReturn($result);
            }

        }

        if (!$result) {
            $this->ajaxReturn(array('status' => false, 'msg' => '操作失败'));
        }

        $this->ajaxReturn(array('msg' => '操作成功'));
    }

    public function edit()
    {
        $id = get('id', 'intval', 0);

        if ($id) {
            $data = table('User')->where('id', $id)->find();
        } else {
            $data = array('integral' => 0, 'status' => 1);
        }

        $other = array(
            'typeCopy'   => dao('Category')->getList('1137'), // 会员类型
            'statusCopy' => ['0' => '关闭', '1' => '开启'],
        );

        $this->assign('other', $other);
        $this->assign('data', $data);
        $this->show();
    }
}
