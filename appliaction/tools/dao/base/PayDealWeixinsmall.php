<?php
/**
 * 微信小程序支付接口
 */
namespace dao\base;

class PayDealWeixinsmall
{
    private static $config;
    private $baseUrl = 'https://api.mch.weixin.qq.com/pay/';
    private $headers = [];

    public function __construct()
    {
        if (is_null(self::$config)) {
            self::$config = getConfig('pay.php');
        }
    }

    /** 支付申请 */
    public function pay($param, $type, $returnUrl, $options)
    {

        $this->baseUrl .= 'unifiedorder';

        $debug = isset($options['debug']) ? $options['debug'] : false;

        $nonceStr = rand(100000, 999999);

        $data['appid']            = self::$config[$type]['appid']; //小程序ID
        $data['body']             = $param['title']; //支付标题
        $data['fee_type']         = $param['unit']; //支付货币币值
        $data['mch_id']           = self::$config[$type]['mch_id']; //商户ID
        $data['nonce_str']        = $nonceStr; //随机码
        $data['notify_url']       = self::$config[$type]['notify_url']; //异步通知地址
        $data['openid']           = $param['openid'];
        $data['out_trade_no']     = $param['pay_sn']; //商户订单号
        $data['sign_type']        = 'MD5'; //签名加密方式
        $data['spbill_create_ip'] = getIp(); //IP地址
        $data['total_fee']        = $param['money'] * 100; //支付金额
        $data['trade_type']       = 'JSAPI'; //交易类型
        $data['sign']             = $this->createSign($data, $type, $options); //签名

        $xml = $this->arrayToXml($data);

        $result = response($this->baseUrl, 'POST', $xml, $this->headers, ['is_json' => false, 'debug' => $debug]);
        $result = $this->xmlToArray($result);

        // debug
        if ($debug == 1 || !isset($result['result_code']) || $result['result_code'] == 'FAIL') {
            print_r('-------ACTION-----' . PHP_EOL);
            print_r('PayDealWeixinsmall:Pay' . PHP_EOL);
            print_r('-------END-----' . PHP_EOL);
            print_r('-------输入参数TIME-----' . PHP_EOL);
            print_r(TIME * 1000 . PHP_EOL);
            print_r('-------END-----' . PHP_EOL);
            print_r('-------输入参数nonceStr-----' . PHP_EOL);
            print_r($nonceStr . PHP_EOL);
            print_r('-------END-----' . PHP_EOL);
            print_r('-------输入参数Type-----' . PHP_EOL);
            print_r($type . PHP_EOL);
            print_r('-------END-----' . PHP_EOL);
            print_r('-------输入参数Config-----' . PHP_EOL);
            print_r(self::$config);
            print_r('-------END-----' . PHP_EOL);
            print_r('-------输入参数header-----' . PHP_EOL);
            print_r($this->headers);
            print_r('-------END-----' . PHP_EOL);
            print_r('-------输入参数Param-----' . PHP_EOL);
            print_r($data) . PHP_EOL;
            print_r(json_encode($data) . PHP_EOL);
            print_r('-------输入参数XmlParam-----' . PHP_EOL);
            print_r($xml) . PHP_EOL;
            print_r('-------END-----' . PHP_EOL);
            print_r('-------请求Url-----' . PHP_EOL);
            print_r($this->baseUrl . PHP_EOL);
            print_r('-------END-----' . PHP_EOL);
            print_r('-------返回结果-----' . PHP_EOL);
            print_r($result);
            print_r('-------END-----' . PHP_EOL);
            print_r('-------签名验证网址-----' . PHP_EOL);
            print_r($result);
            print_r('-------END-----' . PHP_EOL);
            die;
        }

        if ($result['return_code'] != 'FAIL') {
            // 返回API所需参数
            $resPaySign['appId']     = $result['appid']; // 小程序ID
            $resPaySign['timeStamp'] = (string) TIME; // 小程序ID
            $resPaySign['nonceStr']  = $result['nonce_str']; // 小程序ID
            $resPaySign['package']   = 'prepay_id=' . $result['prepay_id']; // 小程序ID
            $resPaySign['signType']  = 'MD5';
            $resPaySign['paySign']   = $this->createSign($resPaySign, $type, $options); // 签名

            return ['status' => true, 'data' => $resPaySign, 'payDebug' => $data];
        } else {

            return ['status' => false, 'data' => $result];
        }
    }

    /** 发起退款申请 */
    public function refund($param, $type, $returnUrl, $options)
    {
        $this->baseUrl .= 'refund';

        $debug = isset($options['debug']) ? $options['debug'] : false;

        $nonceStr = rand(100000, 999999);

        $data['appid']           = self::$config[$type]['appid']; // 小程序ID
        $data['refund_desc']     = $param['title']; // 支付标题
        $data['refund_fee_type'] = $param['unit']; // 货币类型
        $data['mch_id']          = self::$config[$type]['mch_id']; // 商户ID
        $data['nonce_str']       = $nonceStr; // 随机码
        $data['notify_url']      = self::$config[$type]['refund_notify_url']; // 异步通知地址
        $data['openid']          = $param['openid'];
        $data['out_trade_no']    = $param['pay_sn']; // 商户退款财务订单号
        $data['out_refund_no']   = $param['refund_sn']; // 商户收款[原支付]财务订单号
        $data['sign_type']       = 'MD5'; //签名加密方式
        $data['total_fee']       = $param['money'] * 100; // 支付金额
        $data['refund_fee']      = $param['pay_moeny'] * 100; // 申请退款金额
        $data['trade_type']      = 'JSAPI'; //交易类型
        $data['sign']            = $this->createSign($data, $type, $options); //签名

        $xml = $this->arrayToXml($data);

        $result = response($this->baseUrl, 'POST', $xml, $this->headers, ['is_json' => false, 'debug' => $debug]);
        $result = $this->xmlToArray($result);

        //debug
        if ($debug == 1) {
            print_r('-------ACTION-----' . PHP_EOL);
            print_r('PayDealWeixinsmall:Pay' . PHP_EOL);
            print_r('-------END-----' . PHP_EOL);
            print_r('-------输入参数TIME-----' . PHP_EOL);
            print_r(TIME * 1000 . PHP_EOL);
            print_r('-------END-----' . PHP_EOL);
            print_r('-------输入参数nonceStr-----' . PHP_EOL);
            print_r($nonceStr . PHP_EOL);
            print_r('-------END-----' . PHP_EOL);
            print_r('-------输入参数Type-----' . PHP_EOL);
            print_r($type . PHP_EOL);
            print_r('-------END-----' . PHP_EOL);
            print_r('-------输入参数Config-----' . PHP_EOL);
            print_r(self::$config);
            print_r('-------END-----' . PHP_EOL);
            print_r('-------输入参数header-----' . PHP_EOL);
            print_r($this->headers);
            print_r('-------END-----' . PHP_EOL);
            print_r('-------输入参数Param-----' . PHP_EOL);
            print_r($data) . PHP_EOL;
            print_r(json_encode($data) . PHP_EOL);
            print_r('-------输入参数XmlParam-----' . PHP_EOL);
            print_r($xml) . PHP_EOL;
            print_r('-------END-----' . PHP_EOL);
            print_r('-------请求Url-----' . PHP_EOL);
            print_r($baseUrl . PHP_EOL);
            print_r('-------END-----' . PHP_EOL);
            print_r('-------返回结果-----' . PHP_EOL);
            print_r($result);
            print_r('-------END-----' . PHP_EOL);
            print_r('-------签名验证网址-----' . PHP_EOL);
            print_r($result);
            print_r('-------END-----' . PHP_EOL);

            die;
        }

        if ($result['return_code'] != 'FAIL') {
            return ['status' => true, 'data' => $result];
        } else {
            return ['status' => false, 'data' => $result, 'payDebug' => $data];
        }
    }

    // 创建签名
    public function createSign($param = [], $type = 0, $options = [])
    {
        $debug = isset($options['debug']) ? $options['debug'] : false;

        ksort($param); //ASCII码从小到大排序
        $signStr = urldecode(http_build_query($param)); //拼装参数Url
        $signStr .= '&key=' . self::$config[$type]['mch_key']; //商户秘钥
        $result = md5($signStr);
        $result = strtoupper($result);

        if ($debug) {
            print_r('-------ACTION-----' . PHP_EOL);
            print_r('PayDealWeixinsmall:createSign' . PHP_EOL);
            print_r('-------参数Param-----' . PHP_EOL);
            print_r($param) . PHP_EOL;
            print_r('-------拼装SignStr-----' . PHP_EOL);
            print_r($signStr . PHP_EOL);
            print_r('-------签名结果-----' . PHP_EOL);
            print_r($result . PHP_EOL);
            print_r('-------END-----' . PHP_EOL);
        }

        return $result;
    }

    // 输出xml字符
    public function arrayToXml($param)
    {

        $xml = "<xml>";
        foreach ($param as $key => $val) {
            if (is_numeric($val)) {
                $xml .= "<" . $key . ">" . $val . "</" . $key . ">";
            } else {
                $xml .= "<" . $key . "><![CDATA[" . $val . "]]></" . $key . ">";
            }
        }
        $xml .= "</xml>";
        return $xml;
    }

    //将XML转为array
    public function xmlToArray($xml)
    {
        //禁止引用外部xml实体
        libxml_disable_entity_loader(true);
        $data = json_decode(json_encode(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA)), true);
        return $data;
    }

}
