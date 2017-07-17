<?php

//短信接口
class Sms extends base
{
    public function send()
    {
        $mobile = post('mobile', 'trim');
        $flag   = post('flag', 'trim');

        $reslut = dao('Sms')->send($mobile, $flag);
        $this->ajaxReturn($reslut);
    }
}
