<?php
/**
 * 账本模块
 */
namespace app\flower\app\controller\v1\user;

use app\app\controller;
use app\flower\app\controller\v1\WeixinSmallInit;

class Bill extends WeixinSmallInit
{
    public function __construct()
    {
        parent::__construct();
        //检测用户登录权限
        $this->checkIndividual('1');
    }

    public function add()
    {
        $money = get('money', 'text', '');
        $type  = get('type', 'text', '');
        $sign  = get('sign', 'text', '');

        if (!in_array($type, array(1055, 1056))) {
            $this->appReturn(array('status' => false, 'msg' => '参数错误'));
        }

        if (!$sign) {
            $this->appReturn(array('status' => false, 'msg' => '请选择收支项目'));
        }

        if (!$money || !is_numeric($money)) {
            $this->appReturn(array('status' => false, 'msg' => '金额有误'));
        }

        $data['uid']   = $this->uid;
        $data['money'] = $money;
        $data['type']  = $type == 1055 ? 1 : 0;

        $this->appReturn(array('status' => true, 'msg' => '保存成功'));
    }
}
