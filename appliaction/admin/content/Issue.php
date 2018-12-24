<?php
/**
 * 游客提问模块
 */
namespace app\admin\content;

use app\admin\Init;
use denha\Pages;

class Issue extends Init
{
    public function lists()
    {
        $param = get('param', 'text');

        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 25);

        $offer = max(($pageNo - 1), 0) * $pageSize;

        $map = [];

        $list  = table('Issue')->where($map)->limit($offer, $pageSize)->order('id desc')->select();
        $total = table('Issue')->where($map)->count();
        $page  = new Pages($total, $pageNo, $pageSize, url('', $param));

        $this->show('', ['list' => $list, 'pages' => $page->loadConsole(), 'param' => $param]);
    }

    /**
     * 回复
     * @date   2018-07-20T16:28:30+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function reply()
    {
        $id = get('id', 'intval', 0);

        $data = table('Issue')->where('id', $id)->find();

        $this->show('', ['data' => $data]);
    }

    public function replyPost()
    {
        $id    = get('id', 'intval', 0);
        $reply = post('reply', 'text', '');

        if (!$reply) {
            $this->ajaxReturn(['status' => false, 'msg' => '请输入回复内容']);
        }

        $result = table('Issue')->where('id', $id)->save('reply', $reply);
        if ($result === false) {
            $this->ajaxReturn(['status' => false, 'msg' => '操作失败']);
        }

        $this->ajaxReturn(['status' => true, 'msg' => '回复成功']);
    }

    /** 删除 */
    public function del()
    {
        $id = post('id');

        $map['id'] = $id;

        $result = table('Issue')->where($map)->delete();
        if (!$result) {
            $this->ajaxReturn(['status' => true, 'msg' => '删除失败']);
        }

        $this->ajaxReturn(['msg' => '删除成功']);
    }
}
