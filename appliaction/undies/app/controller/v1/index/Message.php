<?php
/**
 * 单页详情
 */
namespace app\undies\app\controller\v1\index;

use app\undies\app\controller\Init;
use denha\controller;

class Message extends Init
{
    public function add()
    {

        $nickname = post('nickname', 'text', '游客');
        $mail     = post('', 'text', '123@123.com');
        $content  = post('content', 'text', '');
        $mobile   = post('mobile', 'text', '');

        if (!$mobile) {
            $this->ajaxReturn(array('status' => false, 'msg' => '请输入手机号'));
        }

        if (!$content) {
            $this->ajaxReturn(array('status' => false, 'msg' => '请输入留言内容'));
        }

        $data['mobile'] = $mobile;
        $result         = dao('VisitorComment', 'undies')->add($nickname, $mail, 2, 0, $content, $data);
        $this->ajaxReturn($result);
    }
}
