<?php
/**
 * 车友圈模块
 */
namespace app\app\controller\v1\common;

use app\app\controller;

class Sms extends \app\app\controller\Init
{
    /**
     * 验证码发送
     * @date   2017-10-10T13:53:28+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function verification()
    {
        $country = post('country_id', 'text', '');
        $mobile  = post('mobile', 'text', '');

        /*$this->appReturn(array('status' => false, 'msg' => json_encode($_POST), 'mobile' => $_POST['mobile'], ',mobile_2' => $mobile, 'post_array' => implode(',', $_POST)));*/

        if (!$mobile) {
            $this->appReturn(array('status' => false, 'msg' => '请输入电话号码'));
        }

        if (!is_numeric(trim($mobile))) {
            $this->appReturn(array('status' => false, 'msg' => '手机号码请不要输入特殊字符'));
        }

        if (!$country) {
            $this->appReturn(array('status' => false, 'msg' => '请选择手机号运营商'));
        }

        //创建验证码
        $code = rand('11111', '99999');

        $sendData['code']       = $code;
        $reslut                 = dao('Sms')->send($mobile, 'verification', $sendData, 'get', $country);
        $reslut['data']['time'] = 360;
        $this->appReturn($reslut);
    }

    /**
     * 获取国际区号
     * @date   2017-10-16T09:54:30+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function country()
    {
        $data = $this->appArray(getVar('country', 'sms'));
        $this->appReturn(array('data' => $data));
    }
}
