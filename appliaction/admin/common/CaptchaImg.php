<?php
namespace app\admin\common;

use app\tools\vendor\captcha\Captcha;
use denha\Controller;

class CaptchaImg extends Controller
{

    /**
     * 显示图形验证码
     * @date   2018-03-30T15:34:47+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function img()
    {
        return Captcha::doimg();
    }

    public function code()
    {
        echo Captcha::getCode();
    }
}
