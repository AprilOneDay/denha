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

        if (!$mobile) {
            $this->appReturn(array('status' => false, 'msg' => '请输入电话号码'));
        }

        if (!$country) {
            $this->appReturn(array('status' => false, 'msg' => '请选择手机号运营商'));
        }

        //创建验证码
        $code = rand('11111', '99999');

        //保存验证码
        $map['mobile'] = $mobile;
        $sms           = table('SmsVerify')->where($map)->field('id,created')->find();
        if ($sms) {
            if ($sms['created'] <= TIME + 360) {
                $this->appReturn(array('status' => false, 'msg' => '请等待' . (360 - (time() - $sms['created'])) . '秒'));
            }

            $data['code']    = $code;
            $data['created'] = TIME;
            table('SmsVerify')->where('id', $sms['id'])->save($data);

        } else {
            $data['code']    = $code;
            $data['created'] = TIME;
            $data['mobile']  = $mobile;
            table('SmsVerify')->add($data);
        }

        $sendData['code'] = $code;

        $reslut = dao('Sms')->send($mobile, 'verification', $sendData, 'post', $country);
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
