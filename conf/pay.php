<?php
return array(
    /* paysapi */
    '1' => array(
        'uid'        => '77eab48392ddfbf3ddd8b3d8',
        'token'      => '3f348f3b0f830c04e262050b6c152068',
        'notify_url' => 'http://fastgo.59156.cn/v1/pay/PayNotify/main/s/call_back/1',
    ),
    /* royalpay */
    '2' => array(
        'partner_code'    => 'BFAS',
        'credential_code' => 'rOKWOfR0ZDwaLJanJszfx2WyXXsaEqJT',
        'notify_url'      => 'http://fastgo.59156.cn/v1/pay/PayNotify/main/s/call_back/2',
    ),
    /** 微信小程序支付 */
    '3' => array(
        'appid'      => 'wxe9c02b887e72c577', //小程序ID
        'secret'     => '882cb769e441866f958cef14251aa212', //小程序秘钥
        'mch_id'     => '1483115632', //商户ID
        'mch_key'    => 'pexCOirLvAAiRnhgiswkwrjco1rbwiy9', //商户秘钥
        'notify_url' => 'http://www.baidu.com', //异步回调地址
        'ssl'        => array(), //证书地址
    ),

);
