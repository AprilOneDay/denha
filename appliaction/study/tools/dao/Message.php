<?php
/**
 * 提示消息管理
 */
namespace app\study\tools\dao;

class Message
{
    /**
     * 发送站内信
     * @date   2017-11-14T11:15:51+0800
     * @author ChenMingjiang
     * @param  integer                  $uid  [发送人]
     * @param  array                    $data [保存信息数组]
     * @return [type]                         [description]
     */
    public function send($uid = 0, $data = array())
    {
        if (!$data['to_uid']) {
            return array('status' => false, 'msg' => '请选择发送人');
        }

        if (!$data['title']) {
            return array('status' => false, 'msg' => '请输入标题');
        }

        if ($data['to_uid'] == $uid) {
            return array('status' => false, 'msg' => '不可给自己发送');
        }

        $beginToday = mktime(0, 0, 0, date('m'), date('d'), date('Y'));
        $endToday   = mktime(0, 0, 0, date('m'), date('d') + 1, date('Y')) - 1;

        $data['uid']     = $uid;
        $data['created'] = TIME;

        //如果存在相同推送内容信息则直接更新时间
        $map['uid']     = $uid;
        $map['to_uid']  = $data['to_uid'];
        $map['title']   = $data['title'];
        $map['created'] = array('between', $beginToday, $endToday);

        $id = table('UserMail')->where($map)->field('id')->find('one');

        if ($id) {
            return array('status' => false, 'msg' => '请勿重复发送');
        }

        $result = table('UserMail')->add($data);
        if (!$result) {
            return array('status' => false, 'msg' => '发送失败,请稍后重试');
        }

        return array('status' => true, 'msg' => '发送成功');
    }

}
