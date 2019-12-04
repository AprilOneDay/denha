<?php
/**
 * 快递鸟接口模块
 */
namespace dao\base;

class Kdniao
{
    private static $id;
    private static $key;

    public function __construct()
    {
        if (is_null(self::$id)) {
            self::$id  = config('kdniao_id');
            self::$key = config('kdniao_key');
        }
    }

    /**
     * 获取物流信息
     * @date   2019-04-11T12:00:56+0800
     * @author ChenMingjiang
     * @param  [type]                   $logisticCode [物流单号]
     * @param  string                   $shipperCode  [物流公司编号]
     * @param  string                   $orderCode    [订单编号 默认空]
     * @return [type]                   [description]
     */
    public function logistic($logisticCode, $shipperCode = '', $orderCode = '')
    {

        $url = 'http://api.kdniao.com/Ebusiness/EbusinessOrderHandle.aspx';

        $result = $this->cacheLogistic($logisticCode);
        if ($result) {
            return ['status' => true, 'data' => $result];
        }

        if (!$shipperCode) {
            $shipperCode = $this->shipper($logisticCode);
        }

        if (!$shipperCode) {
            return ['status' => false, 'msg' => '物流公司编号异常'];
        }

        $data['LogisticCode'] = $logisticCode;
        $data['ShipperCode']  = $shipperCode;
        $data['OrderCode']    = $orderCode;
        $data                 = json_encode($data);

        $params = [
            'EBusinessID' => self::$id,
            'RequestType' => '1002',
            'RequestData' => urlencode($data),
            'DataType'    => '2',
            'DataSign'    => $this->signKey($data),
        ];

        $result = response($url, 'POST', $params, ['application/x-www-form-urlencoded'], ['debug' => false]);

        if ($result['State'] == 3 || $result['State'] == 4) {
            $this->cacheLogistic($logisticCode, $result);
        }

        return ['status' => true, 'data' => $result];

    }

    public function cacheLogistic($key, $value = null)
    {
        $key = 'cache_logistic_' . $key;

        if ($value) {
            cache($key, $value);
        } else {
            return cache($key);
        }

    }

    // 根据物流单号识别物流公司
    public function shipper($logisticCode)
    {

        $url = 'http://api.kdniao.com/Ebusiness/EbusinessOrderHandle.aspx';

        $data['LogisticCode'] = $logisticCode;
        $data                 = json_encode($data);

        $params = [
            'EBusinessID' => self::$id,
            'RequestType' => '2002',
            'RequestData' => urlencode($data),
            'DataType'    => '2',
            'DataSign'    => $this->signKey($data),
        ];

        $result = response($url, 'POST', $params, ['application/x-www-form-urlencoded'], ['debug' => false]);

        if (isset($result['Success']) && $result['Success'] == true && $result['Shippers']) {
            return $result['Shippers'][0]['ShipperCode'];
        }

        return '';
    }

    public function signKey($data)
    {
        return urlencode(base64_encode(md5($data . self::$key)));
    }
}
