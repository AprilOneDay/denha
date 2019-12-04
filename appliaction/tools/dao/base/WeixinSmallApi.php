<?php
/**
 * 通用微信小程序API
 * @author ChenMingjiang <ChenMingjiang1@linksus.com.cn>
 * @version $Id: WeixinOauth.php 2015-09-29 15:28:21 $
 */
namespace dao\base;

use app\tools\vendor\weixin\Oauth;

class WeixinSmallApi
{

    private static $appid;
    private static $secret;
    private static $accessTokenPath;

    public function __construct()
    {
        if (is_null(self::$appid)) {
            self::$appid           = config('wxs_appid');
            self::$secret          = config('wxs_secret');
            self::$accessTokenPath = APP_PATH . 'tools' . DS . 'vendor' . DS . 'weixin' . DS . 'wxs_access_token' . EXT;
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

        $result = response($url, 'GET', $data, []);

        if (isset($result['errcode'])) {
            response($url, 'GET', $data, [], ['debug' => true]);
            return array('status' => false, 'msg' => '请求失败' . $result['errcode']);
        }

        $result['unionid'] = isset($result['unionid']) ? $result['unionid'] : '';

        return ['status' => true, 'msg' => '请求成功', 'data' => $result];
    }

    /**
     * 创建二维码
     * @date   2019-11-19T10:33:00+0800
     * @author ChenMingjiang
     * @param  [type]                   $page   [打开页面路径]
     * @param  [type]                   $params [参数]
     * @param  [type]                   $width  [description]
     * @return [type]                   [description]
     */
    public function wxacode($page = '', $params = '', $width = 480)
    {
        $url = 'https://api.weixin.qq.com/wxa/getwxacodeunlimit?access_token=' . $this->getAccessToken();

        // $data['access_token'] = $this->getAccessToken();

        if (is_array($params)) {
            $params = http_build_query($params);
        }

        if ($params) {
            $data['scene'] = $params;
        }

        $data['page'] = $page;
        $result       = response($url, 'POST', json_encode($data), [], ['debug' => true]);

        if (isset($result['errcode'])) {
            // response($url, 'POST',$data, [], ['debug' => true]);
            return array('status' => false, 'msg' => '请求失败' . $result['errcode']);
        }

        return ['status' => true, 'msg' => '请求成功', 'data' => $result];

    }

    /**
     * [获取访问令牌]
     * @author Chenmingjiang
     * @datetime 2015-09-29T14:48:56+0800
     * @return   [json]                   [令牌]
     */
    public function getAccessToken()
    {
        // access_token 应该全局存储与更新，以下代码以写入到文件中做示例
        $data = json_decode($this->getPhpFile(self::$accessTokenPath));
        if (empty($data) || $data->expire_time < TIME) {
            // 如果是企业号用以下URL获取access_token
            // $url = "https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=$this->appId&corpsecret=$this->appSecret";

            $params['appid']  = self::$appid;
            $params['secret'] = self::$secret;

            $url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential";
            $res = response($url, 'GET', $params, [], ['debug' => false]);

            if (!empty($res['errcode'])) {
                exit('WxsApi获取AccessToken 失败' . $res['errmsg']);
            }

            $access_token = $res['access_token'];
            if ($access_token) {
                $data               = new \stdClass();
                $data->expire_time  = TIME + 7000;
                $data->access_token = $access_token;
                $this->setPhpFile(self::$accessTokenPath, json_encode($data));
            }
        } else {
            $access_token = $data->access_token;
        }
        return $access_token;
    }

    /**
     * 获取文件
     * @date   2017-11-22T19:41:59+0800
     * @author ChenMingjiang
     * @param  [type]                   $filename [description]
     * @return [type]                             [description]
     */
    private function getPhpFile($filename)
    {
        if (!file_exists($filename)) {
            return null;
        }

        return trim(substr(file_get_contents($filename), 15));
    }

    /**
     * 保存文件
     * @date   2017-11-22T19:42:16+0800
     * @author ChenMingjiang
     * @param  [type]                   $filename [description]
     * @param  [type]                   $content  [description]
     */
    private function setPhpFile($filename, $content)
    {

        file_put_contents($filename, '<?php exit();?>' . $content);
    }

}
