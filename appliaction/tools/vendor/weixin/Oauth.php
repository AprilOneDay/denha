<?php
/**
 * 微信授权
 * @author Chenmingjiang <Chenmingjiang1@linksus.com.cn>
 * @version $Id: Oauth.php 2015-09-29 14:32:06 $
 */
namespace app\tools\vendor\weixin;

use app\tools\vendor\weixin;
use app\tools\vendor\weixin\Jssdk;
use denha\Start;

class Oauth
{
    private $appId;
    private $appSecret;
    public function __construct()
    {
        $this->appId     = Start::$config['weixin_appid'];
        $this->appSecret = Start::$config['weixin_secret'];
    }
    /**
     * [获取微信授权链接]
     * @author Chenmingjiang
     * @datetime 2015-09-29T14:33:14+0800
     * @param    string                   $redirectUri [跳转地址]
     * @param    string                   $state       [参数]
     * @return   [string]                 [授权链接]
     */
    public function getAuthorizeUrl($redirectUri = '', $state = '', $scope = 'snsapi_userinfo')
    {
        $redirectUri = urlencode($redirectUri);
        return 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=' . $this->appId . '&redirect_uri=' . $redirectUri . '&response_type=code&scope=' . $scope . '&state=' . $state . '#wechat_redirect';
    }
    /**
     * [获取授权token]
     * @author Chenmingjiang
     * @datetime 2015-09-29T14:34:16+0800
     * @param    string                   $code [通过getAuthorizeUrl获取到的code]
     * @return   [type]                   [description]
     */
    public function getAccessToken($code = '')
    {
        $tokenUrl  = "https://api.weixin.qq.com/sns/oauth2/access_token?appid={$this->appId}&secret={$this->appSecret}&code={$code}&grant_type=authorization_code";
        $tokenData = response($tokenUrl);

        if (!empty($tokenData['access_token'])) {
            return $tokenData;
        }

        $msg = !empty($tokenData['errmsg']) ? $tokenData['errmsg'] : '';

        return ['status' => false, 'msg' => '获取Token失败 ' . $msg];
    }
    /**
     * [获取授权后的微信用户信息]
     * @author Chenmingjiang
     * @datetime 2015-09-29T14:37:12+0800
     * @param    string                   $accessToken [token]
     * @param    string                   $openId      [openid]
     * @return   [json|bool]              [用户信息]
     */
    public function getUserInfo($accessToken = '', $openId = '', $options = [])
    {

        $isSubscribe = isset($options['subscribe']) ? $options['subscribe'] : false;

        if ($accessToken && $openId) {
            $infoUrl = "https://api.weixin.qq.com/sns/userinfo?access_token={$accessToken}&openid={$openId}&lang=zh_CN";
            $data    = response($infoUrl);

            // 默认未授权
            $data['subscribe'] = 0;
            // 获取多关注 唯一id
            $data['uuid'] = isset($data['unionid']) ? $data['unionid'] : '';

            // 查看是否关注公众号
            if ($isSubscribe) {
                $subscribe = $this->getUserInfoBySubscribe($openId);
                if ($subscribe['subscribe'] == '1') {
                    $data['subscribe'] = 1;
                }
            }

            return $data;

        }

        return false;
    }
    /**
     * [查看用户是否关注公众号]
     * @author Chenmingjiang
     * @datetime 2015-09-29T14:37:12+0800
     *
     * @param    string                   $openId      [openid]
     * @return   [json|bool]              [用户信息]
     */
    public function getUserInfoBySubscribe($openId = '')
    {
        if ($openId) {
            //查看是否关注公众号的token和网页授权的token不一样。需要重新请求
            $Jssdk       = new Jssdk();
            $accessToken = $Jssdk->getAccessToken();

            $infoUrl = "https://api.weixin.qq.com/cgi-bin/user/info?access_token={$accessToken}&openid={$openId}&lang=zh_CN";
            $data    = response($infoUrl);

            return $data;

        }
        return false;
    }

}
