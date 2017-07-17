<?php
/* 支付设置 */
return array(
    /*支付宝*/
    'alipayPartner'      => '2088911710705539', // 合作身份者ID
    'alipayEmail'        => 'service@chayu.com', // 收款账号邮箱
    'alipayKey'          => '3ooy0slrsewj6qjl8pqkx36hhmknr7qi', // 安全检验码
    'alipaySignType'     => 'RSA',
    'alipayInputCharset' => 'utf-8',
    'alipayCacert'       => ROOT_PATH . 'src' . DS . 'public' . DS . 'sdk' . DS . 'pay' . DS . 'alipay' . DS . 'cacert' . DS . 'cacert.pem',
    'alipayTransport'    => 'http',
    //商户的私钥
    'PrivateKeyPath'     => ROOT_PATH . 'src' . DS . 'public' . DS . 'sdk' . DS . 'pay' . DS . 'alipay' . DS . 'key' . DS . 'rsa_private_key.pem',
    //支付宝公钥
    'PublicKeyPath'      => ROOT_PATH . 'src' . DS . 'public' . DS . 'sdk' . DS . 'pay' . DS . 'alipay' . DS . 'key' . DS . 'alipay_public_key.pem',
    // curl超时设置
    'AlipayTimeout'      => 30,

    /*微信支付*/
    'AppId'              => 'wxc3e3fdb3cf26928d',
    'AppSecret'          => 'b8b07d6dba3319939ea78c3a80185cd4',
    'MchId'              => '1251749801', // 商户ID
    'Key'                => '2JoEJroJTNa7mOGGWftFqGD6WCKL8MuA', // 商户支付密钥Key
    // 证书路径设置(注意应该填写绝对路径)
    'SSLCertPath'        => ROOT_PATH . 'src' . DS . 'public' . DS . 'sdk' . DS . 'pay' . DS . 'weixin' . DS . 'cert' . DS . 'apiclient_cert.pem',
    'SSLKeyPath'         => ROOT_PATH . 'src' . DS . 'public' . DS . 'sdk' . DS . 'pay' . DS . 'weixin' . DS . 'cert' . DS . 'apiclient_key.pem',
    'SSLCaPath'          => ROOT_PATH . 'src' . DS . 'public' . DS . 'sdk' . DS . 'pay' . DS . 'weixin' . DS . 'cert' . DS . 'rootca.pem',
    // curl超时设置
    'CurlTimeout'        => 30,
    // 统一下单接口链接
    'Url'                => 'https://api.mch.weixin.qq.com/pay/unifiedorder',

    /*百付宝支付*/
    'baifubao'           => array(
        // 商户在百付宝的商户ID
        'spNo'                       => '1000201573',
        // 密钥文件路径
        'spKeyFile'                  => ROOT_PATH . 'src' . DS . 'public' . DS . 'sdk' . DS . 'pay' . DS . 'baifubao' . DS . 'key' . DS . 'sp.key',
        // 商户订单支付成功
        'spPayResultSuccess'         => 1,
        // 商户订单等待支付
        'spPayResultWaiting'         => 2,
        // 日志文件
        'logFile'                    => 'baifubao.log',

        // 即时到账支付接口URL
        // 不需要用户登录百付宝
        'bfbPayDirectNoLoginUrl'     => 'https://www.baifubao.com/api/0/pay/0/direct',
        // 需要用户登录百付宝，不支付银行网关支付
        'bfbPayDirectLoginUrl'       => 'https://www.baifubao.com/api/0/pay/0/direct/0',
        // 移动端即时到账（不需要用户登录百付宝，不支付银行网关支付）
        'bfbPayWapDirectUrl'         => 'https://www.baifubao.com/api/0/pay/0/wapdirect',
        // 订单号查询支付结果接口URL
        'bfbQueryOrderUrl'           => 'https://www.baifubao.com/api/0/query/0/pay_result_by_order_no',
        // 订单号查询重试次数
        'bfbQueryRetryTime'          => 3,
        // 百付宝支付成功
        'bfbPayResultSuccess'        => 1,
        // 支付通知成功后的回执
        'bfbNotifyMeta'              => '<meta name="VIP_BFB_PAYMENT" content="BAIFUBAO">',

        // 签名校验算法
        'signMethodMd5'              => 1,
        'signMethodSha1'             => 2,

        // 即时到账接口服务ID
        'bfbPayInterfaceServiceId'   => 1,
        // 查询接口服务ID
        'bfbQueryInterfaceServiceId' => 11,
        // 接口版本
        'bfbInterfaceVersion'        => 2,
        // 接口字符编码
        'bfbInterfaceEncoding'       => 1,
        // 接口返回格式：XML
        'bfbInterfaceOutputFormat'   => 1,
        // 接口货币单位：人民币
        'bfbInterfaceCurrentcy'      => 1,
    ),

    /*平安快捷支付*/
    'pingan'             => array(
        'masterId'           => '2000311146',
        'privateKeyPath'     => ROOT_PATH . 'src' . DS . 'public' . DS . 'sdk' . DS . 'pay' . DS . 'pingan' . DS . 'key' . DS . '2000311146.pfx',
        'privateKeyPassword' => '111111',
        'publicKeyPath'      => ROOT_PATH . 'src' . DS . 'public' . DS . 'sdk' . DS . 'pay' . DS . 'pingan' . DS . 'key' . DS . 'paygatetest.cer',
        'khpaymentUrl'       => 'https://testebank.sdb.com.cn/khpayment/',
        'corporbankUrl'      => 'https://testebank.sdb.com.cn/corporbank/',
    ),
);
