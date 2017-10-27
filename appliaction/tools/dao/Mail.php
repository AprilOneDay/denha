<?php
/**
 * 邮箱操作模块
 */
namespace app\tools\dao;

use denha;

class Mail
{

    /**
     * 发送邮件
     * @date   2017-10-27T16:09:51+0800
     * @author ChenMingjiang
     * @param  [type]                   $to      [接收邮箱名称]
     * @param  string                   $title   [标题]
     * @param  string                   $content [内容]
     * @return [type]                            [description]
     */
    public function send($to, $title = '', $content = '')
    {
        if (!$to) {
            return false;
        }

        $smtp   = new denha\Smtp();
        $result = $smtp->sendmail($to, $title, $content);

        //保存记录
        $data['title']   = $title;
        $data['md5']     = md5($content);
        $data['to']      = $to;
        $data['ip']      = getIP();
        $data['created'] = TIME;
        $data['status']  = $result;

        table('MailLog')->add($data);
    }

}
