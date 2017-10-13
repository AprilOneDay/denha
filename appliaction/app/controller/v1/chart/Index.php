<?php
/**
 * 广告图模块
 */
namespace app\app\controller\v1\chart;

use app\app\controller;

class Index extends \app\app\controller\Init
{

    public function __construct()
    {
        parent::__construct();
        if (!$this->uid) {
            $this->appReturn(array('status' => false, 'msg' => '请登录'));
        }
    }

    /**
     * 拉取历史聊天记录
     * @date   2017-09-28T15:03:31+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function histroyLists()
    {

        $toUid = get('to_uid', 'intval', 0);

        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 10);
        $offer    = max(($pageNo - 1), 0) * $pageSize;

        $map['is_reader'] = 1;
        $map['_string']   = "(uid = $this->uid and to_uid = $toUid) or (uid = $toUid and to_uid = $this->uid)";

        $user               = (array) dao('User')->getInfo($this->uid, 'avatar,nickname');
        $user['avatar']     = $this->appImg($user['avatar'], 'avatar');
        $list[$key]['user'] = $user;
        if ($toUid) {
            $toUser           = (array) dao('User')->getInfo($toUid, 'avatar,nickname');
            $toUser['avatar'] = $this->appImg($toUser['avatar'], 'avatar');
        } else {
            $toUser['nickname'] = '口袋车平台';
            $toUser['avatar']   = $this->appImg();
        }

        $list = table('ChatLog')->where($map)->field('id,uid,to_uid,content,created')->order('created asc')->find('array');
        //echo table('ChatLog')->getSql();die;
        foreach ($list as $key => $value) {
            $list[$key]['float']   = $value['uid'] == $this->uid ? 'right' : 'left';
            $list[$key]['created'] = date('Y/m/d H:i:s', $value['created']);
        }

        $data['list']['user']    = $user;
        $data['list']['to_user'] = $toUser;
        $data['list']['content'] = $list ? $list : array();

        $this->appReturn(array('data' => $data));
    }

    /**
     * 发送聊天记录
     * @date   2017-09-28T15:05:01+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function send()
    {
        $toUid   = post('to_uid', 'intval', 0);
        $content = post('content', 'text', '');

        if (!$content) {
            $this->appReturn(array('status' => false, 'msg' => '消息为空'));
        }

        if ($toUid == $this->uid) {
            $this->appReturn(array('status' => false, 'msg' => '不可对自己发送信息'));
        }

        $data['to_uid']    = $toUid;
        $data['uid']       = $this->uid;
        $data['created']   = TIME;
        $data['content']   = $content;
        $data['is_reader'] = 1; //默认已读

        $reslut = table('ChatLog')->add($data);
        if (!$reslut) {
            $this->appReturn(array('status' => false, 'msg' => '消息发送失败'));
        }

        //发送站内推送提示
        dao('Message')->send($toUid, 'newComment', '', '', $this->uid, 3);

        $this->appReturn(array('msg' => '发送成功'));
    }
}
