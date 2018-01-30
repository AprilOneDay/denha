<?php
/**
 * 系统消息通知
 */
namespace app\fastgo\app\controller\v1\user;

use app\app\controller;
use app\fastgo\app\controller\v1\Init;

class Message extends Init
{
    /** 系统通知列表 */
    public function index()
    {

        $type = get('type', 'text', 0);

        if ($type) {
            $map['type'] = array('in', $type);
        }

        $map['to_uid'] = $this->uid;

        $list = dao('Message')->getList($this->lg, $map);

        $data['list'] = $list ? $list : array();

        $this->appReturn(array('data' => $data));
    }

}
