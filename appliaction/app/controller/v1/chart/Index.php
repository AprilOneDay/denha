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
            $this->appReturn(array('status' => false, 'msg' => '请登录', 'code' => 501));
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

        $data['list'] = dao('Chart')->histroyLists($this->uid, $toUid, $pageNo, $pageSize);

        $data['list']['user']['avatar']    = $this->appImg($data['list']['user']['avatar'], 'avatar');
        $data['list']['to_user']['avatar'] = $this->appImg($data['list']['to_user']['avatar'], 'avatar');

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
