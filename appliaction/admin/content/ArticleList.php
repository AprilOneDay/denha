<?php
/**
 * 文章内容管理
 */
namespace app\admin\content;

use app\admin\Init;
use denha\Pages;

class ArticleList extends Init
{
    public function lists()
    {

        $isComment = false;

        $param = get('param', 'text');

        if (isset($param['column_id']) && $param['column_id'] == 14) {
            $isComment = true;
        }

        if (!$param) {
            $param = session('param');
        } else {
            session('param', $param);
        }

        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 25);

        !empty($param['field']) ?: $param['field'] = 'title';

        !empty($param['column_id']) ?: $param['column_id'] = 0;

        $offer = max(($pageNo - 1), 0) * $pageSize;

        $map['del_status'] = 0;

        if ($param['column_id']) {
            $map['column_id'] = $param['column_id'];
        }

        if (!empty($param['tag'])) {
            $map['tag'] = $param['tag'];
        }

        if (!empty($param['is_recommend'])) {
            $map['push_id'] = ['!=', ''];
        }

        if (!empty($param['is_show'])) {
            $map['is_show'] = $param['is_show'];
        }

        if (!empty($param['field']) && !empty($param['keyword'])) {
            if ($param['field'] == 'title') {
                $map['title'] = array('like', '%' . $param['keyword'] . '%');
            }
        }

        $list = table('Article')->where($map)->limit($offer, $pageSize)->order('id desc')->select();

        foreach ($list as $key => $value) {
            $list[$key]['comment_nums'] = (int) table('Comment')->where('type', 2)->where('coding', $value['id'])->where('parent_id', 0)->count();
        }

        $total = table('Article')->where($map)->count();
        $page  = new Pages($total, $pageNo, $pageSize, url('', $param));

        $other = [
            'isShowCopy'      => [0 => '未审核', 1 => '已审核'],
            'isRecommendCopy' => [0 => '未推荐', 1 => '已推荐'],
            'columnListCopy'  => dao('Admin.Column')->columnList($param['column_id'], $this->webType),
            'isComment'       => $isComment,
        ];

        $this->show('', [
            'list'  => $list,
            'param' => $param,
            'other' => $other,
            'pages' => $page->loadConsole(),
            'navs'  => dao('Admin.Column')->navs($param['column_id']),
        ]);
    }

    /** 批量更换栏目 */
    public function changeColumn()
    {
        $ids = get('ids', 'text', '');

        $other = [
            'columnListCopy' => dao('Admin.Column')->columnList(0, $this->webType),
        ];

        $this->show('', ['other' => $other]);
    }

    /** 批量更换栏目提交 */
    public function changeColumnPost()
    {
        $ids      = get('ids', 'text', '');
        $columnId = post('column_id', 'intval', '');

        $result = table('Article')->where('id', 'in', $ids)->save('column_id', $columnId);

        if ($result === false) {
            $this->ajaxReturn(false, '修改失败');
        }

        $this->ajaxReturn(true, '修改成功');

    }

}
