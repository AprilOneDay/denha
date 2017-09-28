<?php
/**
 * 抵扣卷模块管理
 */
namespace app\blog\controller\index;

use app\app\controller;

class Comment extends \app\app\controller\Init
{
    /**
     * 添加评论
     * @date   2017-09-28T17:34:18+0800
     * @author ChenMingjiang
     */
    public function add()
    {
        $nickname = post('nickname', 'text', '');
        $goodsId  = post('goods_id', 'intval', 0);
        $content  = post('content', 'text', '');
        $mail     = post('mail', 'text', '');

        if (!$nickname) {
            $this->ajaxReturn(array('status' => false, 'msg' => '输入昵称'));
        }

        if (!$mail) {
            $this->ajaxReturn(array('status' => false, 'msg' => '输入邮箱名称'));
        }

        if (!$content) {

        }

        $result = dao('VisitorComment', 'blog')->add($nickname, 1, $goodsId, $content);
        $this->ajaxReturn($result);
    }

    /**
     * 回复
     * @date   2017-09-28T17:34:10+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function reply()
    {
        $nickname = post('nickname', 'text', '');
        $goodsId  = post('goodsId', 'intval', 0);
        $content  = post('content', 'text', '');
        $parentId = post('parent_id', 'intval', 0);
        $mail     = post('mail', 'text', '');

        if (!$nickname) {
            $this->ajaxReturn(array('status' => false, 'msg' => '输入昵称'));
        }

        if (!$mail) {
            $this->ajaxReturn(array('status' => false, 'msg' => '输入邮箱名称'));
        }

        $result = dao('VisitorComment', 'blog')->reply($nickname, 1, $goodsId, $content, $parentId);
        $this->ajaxReturn($result);
    }
}
