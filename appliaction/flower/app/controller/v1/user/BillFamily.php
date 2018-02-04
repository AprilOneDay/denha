<?php
/**
 * 家庭模块
 */
namespace app\flower\app\controller\v1\user;

use app\app\controller;
use app\flower\app\controller\v1\WeixinSmallInit;

class BillFamily extends WeixinSmallInit
{

    public function __construct()
    {
        parent::__construct();
        //检测用户登录权限
        $this->checkIndividual('1');
    }

    /** 加入家庭 */
    public function add()
    {

        $familySn = get('family_sn', 'text', '');

        if (!$familySn) {
            $this->appReturn(array('status' => false, 'msg' => '参数错误'));
        }

        //更新自己的家庭编码
        $map        = array();
        $map['uid'] = $this->uid;

        $data['family_sn'] = $familySn;

        $result = table('BillFamily')->where('uid', $uid)->save($data);
        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '加入家庭失败'));
        }

        //将自己的账单更新进入新的家庭中
        $map        = array();
        $map['uid'] = $this->uid;

        $data['family_sn'] = $familySn;

        $result = table('BillLog')->where('uid', $uid)->save($data);
        if (!$result) {
            $this->appReturn(array('status' => false, 'msg' => '财务记录更新失败'));
        }

        $this->appReturn(array('status' => true, 'msg' => '操作成功'));
    }
}
