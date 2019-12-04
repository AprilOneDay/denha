<?php
/**
 * 飞印Api接口
 */
namespace dao\base;

class Feiyin
{
    public static $code;
    public static $secret;
    public static $accessTokenPath;

    public function __construct()
    {
        self::$code            = config('feiyin_code');
        self::$secret          = config('feiyin_secret');
        self::$accessTokenPath = PUBLIC_PATH . 'uploadfile' . DS . 'feiyin.txt';
    }

    /** 下单模板 */
    public function templete($param)
    {
        // 获取今日支付订单总数
        $beginToday     = mktime(0, 0, 0, date('m'), date('d'), date('Y'));
        $endToday       = mktime(0, 0, 0, date('m'), date('d') + 1, date('Y')) - 1;
        $map['is_new']  = 1;
        $map['type']    = ['in', '3,4'];
        $map['created'] = ['between', $beginToday, $endToday];
        $count          = table('OrdersLog')->where($map)->count();

        $content = '<center><Font# Bold=1 Width=2 Height=2> #' . $count . ' 仁和外卖</Font#>' . PHP_EOL . PHP_EOL;
        $content .= '<left><Font# Bold=0 Width=1 Height=2>下单时间:' . date('Y-m-d H:i:s', $param['created']) . '</Font#>' . PHP_EOL;
        $content .= '<left>------备注------' . PHP_EOL;
        $content .= '<left><Font# Bold=1 Width=2 Height=2>' . $param['message'] . '</Font#>' . PHP_EOL;
        $content .= '<left>--------------------' . PHP_EOL;
        foreach ($param['goods'] as $key => $value) {
            $content .= '<left><Font# Bold=0 Width=1 Height=2>' . $value['title'] . ' ' . $value['spec_name'] . '      x' . $value['num'] . '  ' . $value['account'] . '</Font#>' . PHP_EOL;
        }

        $content .= '<left>------其他费用------' . PHP_EOL;
        $content .= '<left><Font# Bold=0 Width=1 Height=2>优惠        ' . $param['coupon_price'] . '</Font#>' . PHP_EOL;
        $content .= '<left><Font# Bold=0 Width=1 Height=2>配送费      ' . $param['fare_price'] . '</Font#>' . PHP_EOL;
        $content .= '<left><Font# Bold=1 Width=2 Height=2>支付  ' . $param['account'] . '</Font#>' . PHP_EOL;
        $content .= '<left>--------------------' . PHP_EOL;
        $content .= '<Font# Bold=1 Width=2 Height=2>' . $param['address'] . '</Font#>' . PHP_EOL;

        return $content;
    }

    /** 申请退款模板 */
    public function backTemplete($param)
    {
        // 获取进入退款订单总数
        $beginToday     = mktime(0, 0, 0, date('m'), date('d'), date('Y'));
        $endToday       = mktime(0, 0, 0, date('m'), date('d') + 1, date('Y')) - 1;
        $map['is_new']  = 1;
        $map['type']    = ['in', '5,6'];
        $map['created'] = ['between', $beginToday, $endToday];
        $count          = table('OrdersLog')->where($map)->count();

        $content = '<center><Font# Bold=1 Width=2 Height=2> #' . $count . ' 仁和外卖申请退款</Font#>' . PHP_EOL . PHP_EOL;
        $content .= '<left><Font# Bold=0 Width=1 Height=2>下单时间:' . date('Y-m-d H:i:s', $param['created']) . '</Font#>' . PHP_EOL;
        $content .= '<left>--------------------' . PHP_EOL;
        foreach ($param['goods'] as $key => $value) {
            $content .= '<left><Font# Bold=0 Width=1 Height=2>' . $value['title'] . ' ' . $value['spec_name'] . '      x' . $value['num'] . '  ' . $value['account'] . '</Font#>' . PHP_EOL;
        }
        $content .= '<left>------其他费用------' . PHP_EOL;
        $content .= '<left><Font# Bold=0 Width=1 Height=2>优惠        ' . $param['coupon_price'] . '</Font#>' . PHP_EOL;
        $content .= '<left><Font# Bold=0 Width=1 Height=2>配送费      ' . $param['fare_price'] . '</Font#>' . PHP_EOL;
        $content .= '<left><Font# Bold=1 Width=2 Height=2>支付  ' . $param['account'] . '</Font#>' . PHP_EOL;
        $content .= '<left>--------------------' . PHP_EOL;
        $content .= '<Font# Bold=1 Width=2 Height=2>该订单已申请退款，请不要发货 如已发货请联系买家</Font#>' . PHP_EOL;
        $content .= '<left>--------------------' . PHP_EOL;
        $content .= '<left><Font# Bold=1 Width=1 Height=2>' . $param['address'] . '</Font#>' . PHP_EOL;

        return $content;
    }

    public function accessToken()
    {

        $data = $this->getPhpFile(self::$accessTokenPath);
        if (empty($data['expire_time']) || $data['expire_time'] < TIME) {
            $url         = "https://api.open.feyin.net/token?code=" . self::$code . "&secret=" . self::$secret;
            $result      = response($url, 'GET');
            $accessToken = $result['access_token'];
            if ($accessToken) {
                $data['expire_time']  = TIME + 7200;
                $data['access_token'] = $accessToken;
                $this->setPhpFile(self::$accessTokenPath, json_encode($data));
            }
        } else {
            $accessToken = $data['access_token'];
        }
        return $accessToken;
    }

    /** 发送信息 */
    public function send($deviceNo, $content)
    {
        $accessToken = $this->accessToken();
        $url         = "https://api.open.feyin.net/msg?access_token=" . $accessToken;

        $data['device_no']   = $deviceNo;
        $data['msg_content'] = $content;

        $result = response($url, 'POST', json_encode($data), array('Content-Type:application/json'), array('debug' => true));
        if ($result['errcode']) {
            return array('status' => false, 'msg' => $result['errmsg']);
        }

        return array('status' => true, 'msg' => '发送成功', 'debug' => $result);

    }

    /** 获取文件 */
    private function getPhpFile($filename)
    {
        return json_decode(trim(substr(file_get_contents($filename), 15)), true);
    }

    /** 保存文件 */
    private function setPhpFile($filename, $content)
    {
        $fp = fopen($filename, "w");
        fwrite($fp, "<?php exit();?>" . $content);
        fclose($fp);
    }
}
