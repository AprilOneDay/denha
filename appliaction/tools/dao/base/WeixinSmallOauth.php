<?php
/**
 * 通用微信小程序授权
 * @author ChenMingjiang <ChenMingjiang1@linksus.com.cn>
 * @version $Id: WeixinOauth.php 2015-09-29 15:28:21 $
 */
namespace dao\base;

use app\tools\vendor\weixin\Oauth;

class WeixinSmallOauth
{

    private static $appid;
    private static $secret;

    public function __construct()
    {
        if (is_null(self::$appid)) {
            self::$appid  = config('wxs_appid');
            self::$secret = config('wxs_secret');
        }
    }

    /**
     * [微信授权获取用户信息]
     * @author ChenMingjiang
     * @datetime 2015-09-29T15:29:38+0800
     * @param    [string]                 $appId     [应用ID]
     * @param    [string]                 $appSecret [应用密钥]
     * @return   [array]                  [用户信息]
     */
    public function getUserInfo($code)
    {
        $url = 'https://api.weixin.qq.com/sns/jscode2session';

        if (!$code) {
            echo '对不起，您取消了授权，无法参加此活动';
            exit;
        }

        $data['appid']      = self::$appid;
        $data['secret']     = self::$secret;
        $data['js_code']    = $code;
        $data['grant_type'] = 'authorization_code';

        $result = response($url, 'GET', $data, array());

        if (isset($result['errcode'])) {
            return array('status' => false, 'msg' => '请求失败' . $result['errcode']);
        }

        $result['unionid'] = isset($result['unionid']) ? $result['unionid'] : '';

        return array('status' => true, 'msg' => '请求成功', 'data' => $result);
    }
}
