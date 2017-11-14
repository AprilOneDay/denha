<?php
/**
 * 学生消息管理
 */
namespace app\study\controller\user;

use denha;

class Message extends \app\study\controller\Init
{
    public function __construct()
    {
        parent::__construct();
        $this->checkIndividual();
    }

    public function index()
    {
        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 10);
        $sign     = get('sign', 'intval', 0);
        $offer    = max(($pageNo - 1), 0) * $pageSize;

        $map['to_uid']            = $this->uid;
        $map['to_uid_del_status'] = 0;

        switch ($sign) {
            case '1':
                $map['is_reader'] = 0;
                break;
            case '3':
                $map['to_uid_important'] = 1;
                break;
            case '4':
                $map['uid']            = $this->uid;
                $map['uid_del_status'] = 0;
                unset($map['to_uid'], $map['to_uid_del_status']);
                break;
            default:
                # code...
                break;
        }

        $list  = table('UserMail')->where($map)->limit($offer, $pageSize)->field('id,title,to_uid,created,to_uid_important')->order('created desc')->find('array');
        $total = table('UserMail')->where($map)->count();
        $page  = new \denha\Pages($total, $pageNo, $pageSize, url('', array('sign' => $sign)));

        //收者将标记改为已读
        //table('UserMessage')->where(array('to_uid' => $this->uid, 'is_reader' => 0))->save('is_reader', 1);
        $this->assign('list', $list);
        $this->assign('sgin', $sgin);
        $this->assign('total', $this->mailTotal());
        $this->assign('pages', $page->pages());
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    public function send()
    {
        $ot = table('Orders')->tableName();
        $ct = table('OrdersCourse')->tableName();

        $map[$ct . '.teacher_uid'] = $this->uid;
        $map[$ot . '.is_pay']      = 1;

        $field = "DISTINCT $ot.uid";

        $list = table('Orders')->join($ct, "$ot.order_sn = $ct.order_sn")->where($map)->field($field)->find('array');
        foreach ($list as $key => $value) {
            $userList[$key] = dao('User')->getInfo($value['uid'], 'id,nickname,real_name');
        }

        $this->assign('userList', $userList);
        $this->assign('total', $this->mailTotal());
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    /** 发信息 */
    public function sendPost()
    {
        $data['to_uid']  = post('to_uid', 'intval', 0);
        $data['title']   = post('title', 'text', '');
        $data['content'] = post('content', 'text', '');
        $data['annex']   = post('annex', 'text', '');

        $result = dao('Message', 'study')->send($this->uid, $data);
        $this->appReturn($result);
    }

    /** 邮件详情 */
    public function detail()
    {
        $id = get('id', 'intval', 0);

        if (!$id) {
            denha\Log::error('参数错误');
        }

        $data = table('UserMail')->where('id', $id)->find();

        $data['user']        = dao('User')->getInfo($data['uid'], 'real_name,nickname');
        $data['toUser']      = dao('User')->getInfo($data['to_uid'], 'real_name,nickname');
        $data['content']     = nl2br($data['content']);
        $data['annex']       = $data['annex'] ? explode(',', $data['annex']) : array();
        $data['annex_total'] = count($data['annex']);
        foreach ($data['annex'] as $key => $value) {
            unset($data['annex'][$key]);
            $pathinfo                    = explode(':::', $value);
            $data['annex'][$key]['url']  = $pathinfo[0];
            $data['annex'][$key]['name'] = $pathinfo[1];

        }

        //接受者标记已读
        if (!$data['is_reader'] && $this->uid == $data['to_uid']) {
            table('UserMail')->where('id', $id)->save('is_reader', 1);
        }

        $this->assign('data', $data);
        $this->assign('total', $this->mailTotal());
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    /** 回复 */
    public function reply()
    {
        $id = get('id', 'intval');

        $data           = table('UserMail')->where('id', $id)->find();
        $data['user']   = dao('User')->getInfo($data['uid'], 'real_name,nickname');
        $data['toUser'] = dao('User')->getInfo($data['to_uid'], 'real_name,nickname');
        $this->assign('data', $data);
        $this->assign('total', $this->mailTotal());
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    /** 删除邮件 */
    public function important()
    {
        $id = post('id', 'intval', 0);
        if (!$id) {
            $this->appReturn(array('status' => false, 'msg' => '参数错误'));
        }

        $mail = table('UserMail')->where('id', $id)->field('uid,to_uid,to_uid_important,uid_important')->find();

        //标记自己删除
        if ($this->uid == $mail['uid']) {
            $data['uid_important'] = $mail['uid_important'] ? 0 : 1;

            $result = table('UserMail')->where('id', $id)->save($data);
        }
        //标记接收删除
        elseif ($this->uid == $mail['to_uid']) {
            $data['to_uid_important'] = $mail['to_uid_important'] ? 0 : 1;

            $result = table('UserMail')->where('id', $id)->save($data);
        }

        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '操作失败,请重新尝试'));
        }

        $this->appReturn(array('msg' => '操作成功'));
    }

    /** 删除邮件 */
    public function del()
    {
        $id = post('id', 'intval', 0);
        if (!$id) {
            $this->appReturn(array('status' => false, 'msg' => '参数错误'));
        }

        $mail = table('UserMail')->where('id', $id)->field('uid,to_uid')->find();

        //标记自己删除
        if ($this->uid == $mail['uid']) {
            $result = table('UserMail')->where('id', $id)->save('uid_del_status', 1);
        }
        //标记接收删除
        elseif ($this->uid == $mail['to_uid']) {
            $result = table('UserMail')->where('id', $id)->save('to_uid_del_status', 1);
        }

        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '删除失败,请重新尝试'));
        }

        $this->appReturn(array('msg' => '删除成功'));
    }

    private function mailTotal()
    {
        //所有信息
        $map['to_uid']            = $this->uid;
        $map['to_uid_del_status'] = 0;
        $data['total']            = table('UserMail')->where($map)->count();

        //未读信息
        $map                      = array();
        $map['to_uid']            = $this->uid;
        $map['is_reader']         = 0;
        $map['to_uid_del_status'] = 0;
        $data['not_reader_total'] = table('UserMail')->where($map)->count();

        //重要信息
        $map                      = array();
        $map['to_uid']            = $this->uid;
        $map['to_uid_del_status'] = 0;
        $map['to_uid_important']  = 1;
        $data['important_total']  = table('UserMail')->where($map)->count();

        //已发送信息
        $map                   = array();
        $map['uid']            = $this->uid;
        $map['uid_del_status'] = 0;
        $data['send_total']    = table('UserMail')->where($map)->count();

        return $data;

    }
}
