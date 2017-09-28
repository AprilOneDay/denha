<?php
/**
 * 评论管理
 */
namespace app\blog\tools\dao;

class VisitorComment
{
    //发表评论
    public function add($nickname = '', $type = 0, $goodsId = 0, $content, $dataContent = array())
    {

        if (!$nickname || !$goodsId || !$type) {
            return array('status' => false, 'msg' => '参数错误');
        }

        if (!$content) {
            return array('status' => false, 'msg' => '内容不能为空');
        }

        $data              = $dataContent;
        $data['nickname']  = $nickname;
        $data['goods_id']  = $goodsId;
        $data['content']   = $content;
        $data['parent_id'] = 0;
        $data['created']   = TIME;
        $data['type']      = $type;
        $data['ip']        = getIP();

        $result = table('VisitorComment')->add($data);
        if (!$result) {
            return array('status' => false, 'msg' => '评论失败');
        }

        return array('status' => true, 'msg' => '评论成功');
    }

    //回复评论
    public function reply($nickname, $type, $content, $parentId, $dataContent = array())
    {
        if (!$nickname || !$type || !$toUid) {
            return array('status' => false, 'msg' => '参数错误');
        }

        if (!$content) {
            return array('status' => false, 'msg' => '内容不能为空');
        }

        $map['id'] = $parentId;
        $comment   = table('VisitorComment')->where($map)->field('goods_id')->find();
        if (!$comment) {
            return array('status' => false, 'msg' => '回复信息不存在');
        }

        $data              = $dataContent;
        $data['nickname']  = $nickname;
        $data['goods_id']  = $comment['goods_id'];
        $data['content']   = $content;
        $data['parent_id'] = $parentId;
        $data['created']   = TIME;
        $data['ip']        = getIP();

        $result = table('VisitorComment')->add($data);
        if (!$result) {
            return array('status' => false, 'msg' => '评论失败');
        }

        return array('status' => true, 'msg' => '评论成功');
    }

}
