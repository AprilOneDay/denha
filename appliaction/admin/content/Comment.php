<?php
/**
 * 评论管理
 */
namespace app\admin\content;

use app\admin\Init;
use denha\Pages;

class Comment extends Init
{
    public function lists()
    {
        $param = get('param', 'text');

        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 25);

        !empty($param['field']) ?: $param['field'] = 'title';

        $offer = max(($pageNo - 1), 0) * $pageSize;

        $map              = [];
        $map['parent_id'] = 0;

        if (!empty($param['type'])) {
            $map['type'] = $param['type'];
        }

        if (!empty($param['coding'])) {
            $map['coding'] = $param['coding'];
        }

        if (!empty($param['status']) && $param['status'] != '') {
            $map['status'] = $param['status'];
        }

        if (!empty($param['field']) && !empty($param['keyword'])) {
            if ($param['field'] == 'description') {
                $map['description'] = array('instr', $param['keyword']);
            }
        }

        $total = table('Comment')->where($map)->count();
        $page  = new Pages($total, $pageNo, $pageSize, url('', $param));

        $lists = table('Comment')->where($map)->limit($offer, $pageSize)->order('is_top desc,created desc')->select();

        foreach ($lists as $key => $item) {
            $lists[$key]['nickname'] = dao('User')->getNickname($item['uid']);
            $lists[$key]['nums']     = table('Comment')->where(['parent_id' => $item['id']])->count();
        }

        $other = [
            'statusCopy' => [0 => '关闭', 1 => '开启'],
        ];

        $this->show('', [
            'lists' => $lists,
            'param' => $param,
            'other' => $other,
            'pages' => $page->loadConsole(),
        ]);
    }

    public function edit()
    {
        $id = get('id', 'intval', 0);

        $data = [];
        if ($id) {
            $data          = table('Comment')->where('id', $id)->find();
            $data['reply'] = table('Comment')->where('parent_id', $id)->where('uid', 0)->value('content');
        }

        $other = [
            'score' => ['5' => '5分', '4' => '4分', '3' => '3分', '2' => '2分', '1' => '1分'],
        ];

        $this->show('', ['data' => $data, 'other' => $other]);

    }

    public function editPost()
    {

        $id = get('id', 'intval', 0);

        $params            = post('info');
        $params['created'] = post('info.created', 'time', '');

        if (!$params['content']) {
            $this->ajaxReturn(false, '内容不能为空');
        }

        $comment = table('Comment')->where('id', $id)->find();

        if ($id) {

            $data = [
                'created' => $params['created'],
                'content' => $params['content'],
                'status'  => $params['status'],
            ];

            $result = table('Comment')->where('id', $id)->save($data);
        }

        // 判断是否存在回复
        if ($params['reply']) {
            $replyId = table('Comment')->where('parent_id', $id)->where('uid', 0)->value('id');
            if ($replyId) {
                $result = table('Comment')->where('parent_id', $replyId)->save('content', $params['reply']);
            } else {
                $data = [
                    'uid'       => 0,
                    'type'      => $comment['type'],
                    'coding'    => $comment['coding'],
                    'content'   => $params['reply'],
                    'parent_id' => $id,
                    'created'   => TIME,
                ];

                $result = table('Comment')->add($data);

            }
        }

        $this->ajaxReturn(['status' => true, 'msg' => '操作成功']);
    }

    /** 删除 */
    public function delPost()
    {

        $ids = post('ids', 'text', '');
        if (!$ids) {
            $this->ajaxReturn(['status' => false, 'msg' => '请选择需要删除的内容']);
        }

        $map       = [];
        $map['id'] = ['in', $ids];

        $result = table('Comment')->where($map)->delete();

        $this->ajaxReturn(['status' => true, 'msg' => '删除成功']);
    }

    // 批量审核
    public function ExaminePost()
    {
        $ids = post('ids', 'text', '');

        if (!$ids) {
            $this->ajaxReturn(['status' => false, 'msg' => '请选择需要审核的内容']);
        }

        $map       = [];
        $map['id'] = ['in', $ids];

        $result = table('Comment')->where($map)->save('status', 1);

        $this->ajaxReturn(['status' => true, 'msg' => '审核完成']);
    }

    // 批量置顶
    public function topPost()
    {
        $ids   = post('ids', 'text', '');
        $value = post('value', 'intval', 0);

        if (!$ids) {
            $this->ajaxReturn(['status' => false, 'msg' => '请选择内容']);
        }

        $map       = [];
        $map['id'] = ['in', $ids];

        $result = table('Comment')->where($map)->save('is_top', $value);

        $this->ajaxReturn(['status' => true, 'msg' => '操作成功']);

    }

}
