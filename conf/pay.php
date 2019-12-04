<?php
return [
    /* paysapi */
    '1' => [
        'uid'        => '77eab48392ddfbf3ddd8b3d8',
        'token'      => '3f348f3b0f830c04e262050b6c152068',
        'notify_url' => 'http://fastgo.59156.cn/v1/pay/PayNotify/main/s/call_back/1',
    ],
    /* royalpay */
    '2' => [
        'partner_code'    => 'BFAS',
        'credential_code' => 'rOKWOfR0ZDwaLJanJszfx2WyXXsaEqJT',
        'notify_url'      => 'http://fastgo.59156.cn/v1/pay/PayNotify/main/s/call_back/2',
    ],
    /** 微信小程序支付 */
    '3' => [
        'appid'      => 'wx095d8aac10d20269', // 小程序ID
        'secret'     => '13abf6c2eb59fd490e47ea1fd475e142', // 小程序秘钥
        'mch_id'     => '1559219641', // 商户ID
        'mch_key'    => 'jiuruichuangxiangduoduofeng12345', // 商户秘钥
        'notify_url' => 'https://duofeng.wxs.denha.cn/wxs/v1/home/pay_callback/notify', // 异步回调地址
        'ssl'        => ['CERT' => CERT_PATH . 'apiclient_cert.pem', 'KEY' => CERT_PATH . 'apiclient_key.pem'], // 证书地址
    ],
];
