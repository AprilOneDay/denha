<?php
/**
 * 评论管理
 */
namespace dao\base;

class Comment
{
    /**
     * 发表评论
     * @date   2019-11-28T14:00:28+0800
     * @author ChenMingjiang
     * @param  integer                  $uid         [发布UID]
     * @param  integer                  $type        [类型]
     * @param  integer                  $coding      [关联值]
     * @param  [type]                   $content     [内容]
     * @param  array                    $dataContent [附加内容-需要数据库字段配合]
     * @param  integer                  $toUid       [description]
     */
    public function add($uid = 0, $type = 0, $coding = 0, $content, $dataContent = [], $toUid = 0)
    {
        if (!$uid || !$coding || !$type) {
            return ['status' => false, 'msg' => '参数错误'];
        }

        $data              = $dataContent;
        $data['uid']       = $uid;
        $data['coding']    = $coding;
        $data['content']   = $content;
        $data['parent_id'] = 0;
        $data['created']   = TIME;
        $data['type']      = $type;
        $data['to_uid']    = $toUid;

        $result = table('Comment')->add($data);
        if (!$result) {
            return ['status' => false, 'msg' => '评论失败'];
        }

        //发送站内信
        $sendData = ['nickname' => dao('User')->getNickname($uid)];
        $sendJump = ['type' => 1, 'coding' => $coding];
        dao('Message')->send($data['to_uid'], 'comment', $sendData, $sendJump, 0, 2);

        return ['status' => true, 'msg' => '评论成功'];
    }

    /**
     * 回复评论
     * @date   2017-11-17T14:10:51+0800
     * @author ChenMingjiang
     * @param  [type]                   $uid         [评论人uid]
     * @param  [type]                   $type        [类型]
     * @param  [type]                   $content     [评论内容]
     * @param  [type]                   $parentId    [评论父级id]
     * @param  [type]                   $toUid       [接收人]
     * @param  array                    $dataContent [附加表参数-需要数据库字段配合]
     * @return [type]                                [description]
     */
    public function reply($uid, $type, $content, $parentId, $toUid, $dataContent = [])
    {
        if (!$uid || !$type || !$toUid) {
            return ['status' => false, 'msg' => '参数错误', 'uid' => $uid, 'type' => $type, 'touid' => $toUid];
        }

        if (!$content) {
            return ['status' => false, 'msg' => '内容不能为空'];
        }

        $map['id'] = $parentId;
        $comment   = table('Comment')->where($map)->field('coding,uid')->find();
        if (!$comment) {
            return ['status' => false, 'msg' => '回复信息不存在'];
        }

        $data              = $dataContent;
        $data['uid']       = $uid;
        $data['coding']    = $comment['coding'];
        $data['content']   = $content;
        $data['parent_id'] = $parentId;
        $data['to_uid']    = $toUid == $uid ? 0 : $toUid;
        $data['created']   = TIME;

        $result = table('Comment')->add($data);
        if (!$result) {
            return ['status' => false, 'msg' => '评论失败'];
        }

        // 发送站内信
        $sendData = ['nickname' => dao('User')->getNickname($uid)];
        $sendJump = ['type' => 1, 'coding' => $comment['coding']];
        dao('Message')->send($toUid, 'comment', $sendData, $sendJump, $uid, 2);

        return ['status' => true, 'msg' => '评论成功'];
    }

    /** 获取未读信息条数 */
    public function getNotReadTotal($uid)
    {
        if (!$uid) {
            return 0;
        }

        $map['to_uid']           = $uid;
        $map['is_to_uid_reader'] = 0;
        $count                   = (int) table('Comment')->where($map)->count();

        return $count;
    }

    /**
     * 评价内容
     * @date   2017-09-25T17:07:01+0800
     * @author ChenMingjiang
     * @param  [type]                   $type    [description]
     * @param  [type]                   $coding [description]
     * @return [type]                            [description]
     */
    public function getList($type, $coding)
    {
        if (!$type || !$coding) {
            return false;
        }

        $map['type']       = $type;
        $map['coding']     = $coding;
        $map['parent_id']  = 0;
        $map['del_status'] = 0;

        $list = table('Comment')->where($map)->order('is_top desc,created desc')->field('id,content,uid,created,ablum')->limit(60)->select();
        foreach ($list as $key => $value) {
            $list[$key]['child']        = $this->getChildList($type, $coding, $value['id']);
            $list[$key]['created_copy'] = date('m月d日', $value['created']);

            $user           = dao('User')->getInfo($value['uid'], 'nickname,avatar');
            $user['avatar'] = imgUrl($user['avatar'], 'avatar');

            $list[$key]['user'] = $user;

        }

        $list = $list ? $list : [];
        return $list;

    }

    /**
     * 回复内容
     * @date   2017-09-25T17:06:48+0800
     * @author ChenMingjiang
     * @param  [type]                   $type     [description]
     * @param  [type]                   $coding  [description]
     * @param  [type]                   $parentId [description]
     * @return [type]                             [description]
     */
    public function getChildList($type, $coding, $parentId)
    {
        $map               = [];
        $map['type']       = $type;
        $map['coding']     = $coding;
        $map['parent_id']  = $parentId;
        $map['del_status'] = 0;

        $list = table('Comment')->where($map)->order('is_top desc,created desc')->field('content,uid,created,to_uid')->select();

        // $list = table('Comment')->getLastSql();

        if ($list) {
            foreach ($list as $key => $value) {
                $toUser = dao('User')->getInfo($value['to_uid'], 'nickname,avatar');
                if (!$toUser) {
                    $toUser = ['avatar' => '', 'nickname' => ''];
                }

                $user = dao('User')->getInfo($value['uid'], 'nickname,avatar');
                if (!$user) {
                    $user = ['avatar' => '', 'nickname' => ''];
                }

                $toUser['avatar'] = imgUrl($toUser['avatar'], 'avatar');
                $user['avatar']   = imgUrl($user['avatar'] ? $user['avatar'] : 'default', 'avatar');

                $list[$key]['user']         = $user;
                $list[$key]['toUser']       = $toUser;
                $list[$key]['created_copy'] = date('m月d日', $value['created']);
            }
        }

        $list = $list ? $list : [];
        return $list;
    }

    /** 获取评论总数 */
    public function count($type = 1, $coding = 0)
    {
        $map['type']      = $type;
        $map['coding']    = $coding;
        $map['parent_id'] = 0;

        $total = (int) table('Comment')->where($map)->count();

        return $total;
    }
}
