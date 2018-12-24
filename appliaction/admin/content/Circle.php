<?php
/**
 * 圈子模块
 */
namespace app\admin\content;

use app\admin\Init;
use denha\Pages;

class Circle extends Init
{
    public function lists()
    {
        $param = get('param', 'text');

        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 25);

        !empty($param['field']) ?: $param['field'] = 'title';

        $offer = max(($pageNo - 1), 0) * $pageSize;
        $map   = [];

        if (!empty($param['type'])) {
            $map['type'] = $param['type'];
        }

        if (!empty($param['status'])) {
            $map['status'] = $param['status'];
        }

        if (!empty($param['field']) && !empty($param['keyword'])) {
            if ($param['field'] == 'description') {
                $map['description'] = array('instr', $param['keyword']);
            }
        }

        $list  = table('Circle')->where($map)->limit($offer, $pageSize)->order('created desc')->select();
        $total = table('Circle')->where($map)->count();
        $page  = new Pages($total, $pageNo, $pageSize, url('', $param));

        foreach ($list as $key => $value) {
            $list[$key]['like']  = (int) table('Enjoy')->where(array('type' => 1, 'value' => $value['id']))->count();
            $list[$key]['ablum'] = $value['ablum'] ? (array) explode(',', $value['ablum']) : array();

            $user               = dao('User')->getInfo($value['uid'], 'nickname,avatar,type');
            $list[$key]['user'] = $user;
        }

        $other = array(
            'typeCopy'        => dao('Category')->getList(1089),
            'isRecommendCopy' => array(1 => '推荐', 0 => '未推荐'),
            'delStatusCopy'   => array(1 => '已删除', 0 => '正常'),
            'statusCopy'      => array(0 => '待审核', 1 => '审核通过', 2 => '审核未通过'),
        );

        $this->assign('list', $list);
        $this->assign('param', $param);
        $this->assign('pages', $page->loadConsole());
        $this->assign('other', $other);
        $this->show();
    }

    public function edit()
    {
        $id = get('id', 'intval', 0);

        if ($id) {
            $data = table('Circle')->where('id', $id)->find();
        } else {
            $data = array();
        }

        $other = array(
            'typeCopy'        => dao('Category')->getList(1089),
            'isRecommendCopy' => array(1 => '推荐', 0 => '未推荐'),
            'delStatusCopy'   => array(1 => '已删除', 0 => '正常'),
            'statusCopy'      => array(0 => '待审核', 1 => '审核通过', 2 => '审核未通过'),
        );

        $this->assign('other', $other);
        $this->assign('data', $data);
        $this->show();
    }

    /** 更新状态 */
    public function changeStatus()
    {
        $id    = post('id', 'intval', 0);
        $value = post('value', 'text', '');

        //print_r($id);
        //print_r($value);

        $this->ajaxReturn(array('status' => true, 'msg' => '请求错误', 'data' => $id));
    }
}
