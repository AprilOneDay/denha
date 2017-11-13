<?php
/**
 * 前台用户管理
 */
namespace app\study\controller\teacher;

use denha;

class Message extends \app\study\controller\Init
{
    public function __construct()
    {
        parent::__construct();
        $this->checkIndividual(2);
    }

    public function index()
    {
        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 10);
        $sgin     = get('sgin', 'intval', 0);
        $offer    = max(($pageNo - 1), 0) * $pageSize;

        $map['to_uid']           = $this->uid;
        $map['touid_del_status'] = 0;

        switch ($sgin) {
            case '1':
                $map['is_reader'] = 1;
                break;
            case '3':
                $map['touid_important'] = 1;
                break;
            case '4':
                $map['uid'] = $this->uid;
                unset($map['to_uid']);
                break;
            default:
                # code...
                break;
        }

        $list = table('UserMessage')->where($map)->limit($offer, $pageSize)->field('uid,title,created,is_reader,type,uid_important')->order('created desc')->find('array');

        foreach ($list as $key => $value) {
            if ($value['uid'] == 0) {
                $user = array('nickname' => '系统消息', 'avatar' => '');
            } else {
                $user           = dao('User')->getInfo($value['uid'], 'nickname,avatar');
                $user['avatar'] = $this->appImg($user['avatar'], 'avatar');
            }

            $list[$key]['user']     = $user;
            $list[$key]['jump_app'] = $value['jump_app'] ? json_decode($value['jump_app']) : array();
        }

        $list = $list ? $list : array();

        //收者将标记改为已读
        //table('UserMessage')->where(array('to_uid' => $this->uid, 'is_reader' => 0))->save('is_reader', 1);
        $this->assign('list', $list);
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
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    public function detail()
    {
        $id = post('id', 'intval', 0);

        if (!$id) {
            denha\Log::error('参数错误');
        }

        $map['to_uid']           = $this->uid;
        $map['touid_del_status'] = 0;
        $map['id']               = $id;

        $data = table('UserMessage')->where($map)->find();
        $this->assign('data', $data);
        $this->show(CONTROLLER . '/' . ACTION . $this->lg);
    }

    public function del()
    {
        $id = post('id', 'intval', 0);
        if (!$id) {
            $this->appReturn(array('status' => false, 'msg' => '参数错误'));
        }

        $map['to_uid'] = $this->uid;

        $result = table('UserMessage')->where('id', $id)->save('touid_del_status', 1);
        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '删除失败,请重新尝试'));
        }

        $this->appReturn(array('msg' => '删除成功'));
    }

}
