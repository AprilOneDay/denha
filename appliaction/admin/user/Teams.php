<?php
namespace app\admin\user;

use app\admin\Init;
use denha\Pages;

class Teams extends Init
{
    /** 团长列表 */
    public function lists()
    {
        $pageNo = get('pageNo', 'intval', 0);

        $field   = get('field', 'text', '');
        $keyword = get('keyword', 'text', '');

        $param = (array) get('param');

        $pageSize = 20;
        $offer    = max(($pageNo - 1), 0) * $pageSize;

        $param['field'] = 'name';

        $map = [];

        if (!empty($field) && !empty($keyword)) {
            if ($field == 'name' || $field == 'uid') {
                $map[$field] = $keyword;
            }

            $param['field']   = $field;
            $param['keyword'] = $keyword;
        }

        $lists = table('team')->where($map)->limit($offer, $pageSize)->select();
        $total = table('team')->where($map)->count();
        $page  = new Pages($total, $pageNo, $pageSize, url('lists', $param));

        foreach ($lists as $key => $item) {
            $lists[$key]['nickname'] = dao('User')->getNickname($item['uid']);
            $lists[$key]['nums']     = count((array) explode(',', $item['join_uids']));
        }

        $other = [];

        $this->show('', ['other' => $other, 'lists' => $lists, 'pages' => $page->loadConsole(), 'param' => $param]);
    }

    /** 团长详情展示 */
    public function edit($id = 0)
    {
        if ($id) {
            $data = table('team')->where('id', $id)->find();
        } else {
            $data = [];
        }

        $this->show('', ['data' => $data]);
    }

    /** 团长编辑 */
    public function editPost()
    {
        $id = get('id', 'intval', 0);

        $data['uid']       = post('uid', 'intval', 0);
        $data['name']      = post('name', 'text', '');
        $data['qr_url']    = post('qr_url', 'img', '');
        $data['notice']    = post('notice', 'text', '');
        $data['is_public'] = post('is_public', 'intval', 0);

        if (!$data['name']) {
            $this->ajaxReturn(false, '请输入团队名称');
        }

        if (!$data['notice']) {
            $this->ajaxReturn(false, '请输入团队公告');
        }

        $isUser = table('User')->where('uid', $data['uid'])->count();

        if (!$isUser) {
            $this->ajaxReturn(false, '会员信息不存在');
        }

        if (!$id) {
            $is = table('team')->where('join_uids', 'find_in_set', $data['uid'])->count();
            if ($is) {
                $this->ajaxReturn(false, '团长已建团 请勿重复创建');
            }

            $data['join_uids'] = $data['uid'];

            $result = table('team')->add($data);

        } else {
            $team = table('team')->where('id', $id)->field('uid,join_uids')->find();

            if ($team['uid'] != $data['uid']) {
                $joinUids = (array) explode(',', $team['join_uids']);
                $key      = array_search($team['uid'], $joinUids);
                if (isset($key)) {
                    unset($joinUids[$key]);
                    $joinUids[] = $data['uid'];
                }

                $data['join_uids'] = implode(',', $joinUids);
            }

            $result = table('team')->where('id', $id)->save($data);
        }

        if ($result === false) {
            $this->ajaxReturn(false, '操作失败');
        }

        $this->ajaxReturn(true, '操作成功');
    }
}
