<?php
/**
 * 支付接口调用
 */
namespace dao\base;

class Pay
{
    /**
     * 支付接口
     * @date   2018-01-15T15:24:20+0800
     * @author ChenMingjiang
     * @param  [type]                   $param     [支付参数]
     * @param  [type]                   $payMatch  [支付调用接口]
     * @param  [type]                   $returnUrl [支付完成通知地址]
     * @return [type]                              [description]
     */
    public function main($param, $payMatch, $returnUrl, $options)
    {

        switch ($payMatch) {
            case '1': //paysapi
                $result = dao('PayDealSapi')->pay($param, $payMatch, $returnUrl, $options);
                break;
            case '2': //royalpay
                $result = dao('PayDealRoyalpay')->pay($param, $payMatch, $returnUrl, $options);
                break;
            case '3': //微信小程序公众支付
                $result = dao('PayDealWeixinsmall')->pay($param, $payMatch, $returnUrl, $options);
            default:
                # code...
                break;
        }

        $result['status'] = true;

        return $result;
    }

}
