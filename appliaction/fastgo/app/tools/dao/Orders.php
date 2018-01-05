<?php
/**
 * 订单模块
 */
namespace app\fastgo\tools\dao;

class Orders
{
    /** 创建运单号 */
    public function createOrderSn()
    {
        $url    = 'http://47.100.5.66/api/outside/getmailnos/1';
        $result = file_get_contents($url);
        $result = json_decode($result, true);
        if ($result['code'] == '0000') {
            return $result['result'];
        }

        return false;
    }
}
