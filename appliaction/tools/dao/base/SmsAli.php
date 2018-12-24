<?php
/**
 * 阿里大鱼短信模块
 */
namespace dao\base;

use denha\Start;

class SmsAli
{
    public static $accessKeyId;
    public static $accessKeySecret;

    public function __construct()
    {
        self::$accessKeyId     = Start::$config['ALIDAYU_SENDSMS_APPKEY'];
        self::$accessKeySecret = Start::$config['ALIDAYU_SENDSMS_APPSECRETKEY'];
    }

    /**
     * 短信发送
     * @date   2018-03-30T13:44:55+0800
     * @author ChenMingjiang
     * @param  integer                  $mobile         [手机号]
     * @param  string                   $sign           [签名]
     * @param  string                   $template       [模板ID]
     * @param  array                    $templateParam  [替换参数]
     * @param  boolean                  $isVerification [是否开启验证码]
     * @return [type]                                   [description]
     */
    public function send($mobile = 0, $sign = '卓猎网', $template = '', $templateParams = [], $options = [])
    {
        $isCode  = isset($options['is_code']) ? $options['is_code'] : false;
        $codeKey = isset($options['code_key']) ? $options['code_key'] : 'code';

        if (!is_numeric(trim($mobile))) {
            $this->ajaxReturn(['status' => false, 'msg' => '手机号参数错误了']);
        }

        //每日发送最大次数
        $result = dao('Sms')->maxSendNum($mobile, 10);
        if (!$result['status']) {
            return $result;
        }

        $params = [];

        // *** 需用户填写部分 ***

        // fixme 必填: 请参阅 https://ak-console.aliyun.com/ 取得您的AK信息
        // $accessKeyId     = "your access key id";
        // $accessKeySecret = "your access key secret";

        // fixme 必填: 短信接收号码
        $params["PhoneNumbers"] = $mobile;

        // fixme 必填: 短信签名，应严格按"签名名称"填写，请参考: https://dysms.console.aliyun.com/dysms.htm#/develop/sign
        $params["SignName"] = $sign;

        // fixme 必填: 短信模板Code，应严格按"模板CODE"填写, 请参考: https://dysms.console.aliyun.com/dysms.htm#/develop/template
        $params["TemplateCode"] = $template;

        // fixme 可选: 设置模板参数, 假如模板中存在变量需要替换则为必填项
        $params['TemplateParam'] = $templateParams;
        //自动生成验证码
        if ($isCode && !isset($params['TemplateParam'][$codeKey])) {
            $params['TemplateParam'][$codeKey] = $templateParams[$codeKey] = rand(100000, 999990);
        }

        // fixme 可选: 设置发送短信流水号
        $params['OutId'] = "12345";

        // fixme 可选: 上行短信扩展码, 扩展码字段控制在7位或以下，无特殊需求用户请忽略此字段
        $params['SmsUpExtendCode'] = "1234567";

        // *** 需用户填写部分结束, 以下代码若无必要无需更改 ***
        if (!empty($params["TemplateParam"]) && is_array($params["TemplateParam"])) {
            $params["TemplateParam"] = json_encode($params["TemplateParam"], JSON_UNESCAPED_UNICODE);
        }

        // 此处可能会抛出异常，注意catch
        $content = $this->request(
            self::$accessKeyId,
            self::$accessKeySecret,
            "dysmsapi.aliyuncs.com",
            array_merge($params, array(
                "RegionId" => "cn-hangzhou",
                "Action"   => "SendSms",
                "Version"  => "2017-05-25",
            ))
            // fixme 选填: 启用https
            // ,true
        );

        if ($content->Message != 'OK' && $content->Message != 'ok') {

            return ['status' => false, 'msg' => '发送失败请重写尝试', 'debug' => (array) $content, 'params' => $params];
        }

        //保存发送记录
        dao('Sms')->savelog($mobile, $template);

        //保存验证码
        if ($isCode) {
            dao('Sms')->saveVerif($mobile, $templateParams[$codeKey]);
        }

        return ['status' => true, 'msg' => '发送成功'];
    }

    /**
     * 生成签名并发起请求
     *
     * @param $accessKeyId string AccessKeyId (https://ak-console.aliyun.com/)
     * @param $accessKeySecret string AccessKeySecret
     * @param $domain string API接口所在域名
     * @param $params array API具体参数
     * @param $security boolean 使用https
     * @return bool|\stdClass 返回API接口调用结果，当发生错误时返回false
     */
    public function request($accessKeyId, $accessKeySecret, $domain, $params, $security = false)
    {
        $apiParams = array_merge(array(
            "SignatureMethod"  => "HMAC-SHA1",
            "SignatureNonce"   => uniqid(mt_rand(0, 0xffff), true),
            "SignatureVersion" => "1.0",
            "AccessKeyId"      => $accessKeyId,
            "Timestamp"        => gmdate("Y-m-d\TH:i:s\Z"),
            "Format"           => "JSON",
        ), $params);
        ksort($apiParams);

        $sortedQueryStringTmp = "";
        foreach ($apiParams as $key => $value) {
            $sortedQueryStringTmp .= "&" . $this->encode($key) . "=" . $this->encode($value);
        }

        $stringToSign = "GET&%2F&" . $this->encode(substr($sortedQueryStringTmp, 1));

        $sign = base64_encode(hash_hmac("sha1", $stringToSign, $accessKeySecret . "&", true));

        $signature = $this->encode($sign);

        $url = ($security ? 'https' : 'http') . "://{$domain}/?Signature={$signature}{$sortedQueryStringTmp}";

        try {
            $content = $this->fetchContent($url);
            return json_decode($content);
        } catch (\Exception $e) {
            return false;
        }
    }

    private function encode($str)
    {
        if (!$str) {
            return '';
        }

        $res = urlencode($str);
        $res = preg_replace("/\+/", "%20", $res);
        $res = preg_replace("/\*/", "%2A", $res);
        $res = preg_replace("/%7E/", "~", $res);
        return $res;
    }

    private function fetchContent($url)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_TIMEOUT, 5);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            "x-sdk-client" => "php/2.0.0",
        ));

        if (substr($url, 0, 5) == 'https') {
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        }

        $rtn = curl_exec($ch);

        if ($rtn === false) {
            trigger_error("[CURL_" . curl_errno($ch) . "]: " . curl_error($ch), E_USER_ERROR);
        }
        curl_close($ch);

        return $rtn;
    }

}
