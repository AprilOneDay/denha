<?php
/**
 * 支付回调检验
 */
namespace dao\base;

class PayNotify
{
    private static $config;

    public function __construct()
    {
        if (is_null(self::$config)) {
            self::$config = getConfig('pay');
        }

    }

    /**
     * 执行函数
     * @date   2018-06-05T22:27:32+0800
     * @author ChenMingjiang
     * @param  [type]                   $callBackType [description]
     * @param  [type]                   $sign         [description]
     * @return [type]                                 [description]
     */
    public function main($callBackType, $sign = '')
    {

        switch ($callBackType) {
            case 1:
                $result = $this->Paysapi($callBackType);
                break;
            case 2:
                $result = $this->PayRoyalpay($callBackType);
                break;
            case 3:
                if (!$sign) {
                    $result = $this->PayWeixinsmall($callBackType);
                } elseif ($sign == 'refund') {
                    $result = $this->refundWeixinsmall($callBackType);
                }
                break;
            default:
                $result = array('msg' => 'callBackType参数错误');
                break;
        }

        $this->log($callBackType, $param, $result);
        if (!$result['status']) {
            return false;
        }

        $param = $result['data'];

        //检测支付金额/币种是否一致
        $result = dao('Finance')->checkPrice($param);
        $this->log($callBackType, $param, $result);
        if ($result['status']) {
            return false;
        }

        //执行支付成功后的后续处理
        $reslut = dao('PayCallBack')->main($param);
        $this->log($callBackType, $param, $result);

    }

    /** Paysapi验证 */
    public function Paysapi($callBackType)
    {
        $paysapi_id = post('paysapi_id', 'intval', 0);
        $realprice  = post('realprice', 'float', 0);
        $key        = post('key', 'text', '');

        $param['pay_sn']    = post('orderid', 'text', '');
        $param['pay_money'] = post('price', 'float', '');
        $param['uid']       = post('orderuid', 'intval', 0);

        //校验传入的参数是否格式正确，略
        $token = self::$config[$callBackType]['token'];

        $temps = md5($param['pay_sn'] . $param['uid'] . $paysapi_id . $param['price'] . $realprice . $token);

        if ($temps != $key) {
            $this->log($callBackType, $param, $result);
            $result = array('status' => false, 'msg' => '支付检验失败');
        } else {
            $result = array('status' => true, 'msg' => '认证通过', 'data' => $param);
        }

        $this->log($callBackType, $param, $result);

        return $result;
    }

    /** PayRoyalpay验证 */
    public function PayRoyalpay($callBackType)
    {

        $response = json_decode(file_get_contents('php://input'), true);

        $sign = hash('sha256', self::$config[$callBackType]['partner_code'] . '&' . $response['time'] . '&' . $response['nonce_str'] . '&' . self::$config[$callBackType]['credential_code']);

        //商户订单号
        $param['pay_sn'] = $response['partner_order_id'];
        //支付金额，单位是最小货币单位
        $param['pay_money'] = $response['real_fee'] / 100;
        //币种
        $param['unit'] = $response['currency'];
        //订单创建时间，格式为'yyyy-MM-dd HH:mm:ss'，澳洲东部时间
        $create_time = $response['create_time'];
        //订单支付时间，格式为'yyyy-MM-dd HH:mm:ss'，澳洲东部时间
        $pay_time = $response['pay_time'];
        //RoyalPay订单号
        $royal_order_id = $response['order_id'];
        //订单金额，单位是最小货币单位
        $order_amt = $response['total_fee'];

        if ($sign != $response['sign']) {
            $this->log($callBackType, $param, $result);
            $result = array('status' => false, 'msg' => '支付检验失败');
        } else {
            $result = array('status' => true, 'msg' => '认证通过', 'data' => $param);
        }

        $this->log($callBackType, $param, $result);

        return $result;
    }

    // 微信小程序支付验证
    public function PayWeixinsmall($callBackType)
    {

        $xml      = file_get_contents('php://input');
        $response = dao('PayDealWeixinsmall')->xmlToArray($xml);
        if (!$response || $response['return_code'] == 'FAIL') {
            $this->log($callBackType, array(), $response);
            $result = array('status' => false, 'msg' => '支付检验失败');
        }

        $sign = $response['sign'];
        unset($response['sign']);
        $checkSign = dao('PayDealWeixinsmall')->createSign($response, $callBackType);

        //商户订单号
        $param['pay_sn'] = $response['out_trade_no'];
        //支付金额，单位是最小货币单位
        $param['pay_money'] = $response['cash_fee'] / 100;
        //币种
        $param['unit'] = $response['fee_type'];

        if ($sign != $checkSign) {
            $this->log($callBackType, $param, $response);
            $result = array('status' => false, 'msg' => '支付检验失败');
        } else {
            $result = array('status' => true, 'msg' => '认证通过', 'data' => $param);
        }

        $this->log($callBackType, $param, $response);

        return $result;
    }

    // 微信小程序退款验证
    public function refundWeixinsmall($callBackType)
    {
        $config = self::$config[$callBackType];

        $xml      = file_get_contents('php://input');
        $response = dao('PayDealWeixinsmall')->xmlToArray($xml);
        if (!$response || $response['return_code'] == 'FAIL') {
            $this->log($callBackType, array(), $response);
            $result = array('status' => false, 'msg' => '支付检验失败');
        }

        $reqInfo = $response['req_info'];
        $reqInfo = dao('Encrypt')->setInit(array('key' => md5($config['secret'])))->base64Decrypt($reqInfo);
        if (!is_array($reqInfo)) {
            $this->log($callBackType, $param, $response);
            $result = array('status' => false, 'msg' => '解密失败');
        } else {
            $result = array('status' => true, 'msg' => '解密成功');
        }

        //商户订单号
        $param['pay_sn'] = $reqInfo['out_refund_no'];
        //支付金额，单位是最小货币单位
        $param['pay_money'] = $reqInfo['cash_fee'] / 100;
        //币种
        $param['unit'] = 'CNY';

        $this->log($callBackType, $param, $response);

        $result['data'] = $param;

        return $result;
    }

    /**
     * 日志记录
     * @date   2018-01-17T14:42:06+0800
     * @author ChenMingjiang
     * @param  [type]                   $callBackType [description]
     * @param  [type]                   $data         [description]
     * @param  [type]                   $result       [description]
     * @return [type]                                 [description]
     */
    private function log($callBackType, $data, $response)
    {

        //如果没有写入权限尝试修改权限 如果修改后还是失败 则跳过
        if (!isWritable(DATA_PATH)) {
            return false;
        }

        $path = DATA_PATH . 'pay_log' . DS;
        is_dir($path) ? '' : mkdir($path, 0755, true);

        $path = DATA_PATH . 'pay_log' . DS . date('Y_m_d') . '.log';

        $content = '--------CallBackType:' . $callBackType . '-------------' . PHP_EOL;
        $content .= json_encode($data, JSON_UNESCAPED_UNICODE) . PHP_EOL;
        $content .= '--------Result----------------------------------------' . PHP_EOL;
        $content .= json_encode($response, JSON_UNESCAPED_UNICODE) . PHP_EOL;
        $content .= '--------End-' . date('Y-m-d H:i:s', TIME) . '---------------' . PHP_EOL . PHP_EOL;

        $file = fopen($path, 'a');
        fwrite($file, $content . PHP_EOL);
        fclose($file);
    }

}
