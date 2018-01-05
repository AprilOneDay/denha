<?php
ini_set('date.timezone', 'Asia/Shanghai');
require_once "../lib/RoyalPay.Api.php";
header("Content-Type:text/html;charset=utf-8");
/**
 * 流程：
 * 1、创建QRCode支付单，取得code_url，生成二维码
 * 2、用户扫描二维码，进行支付
 * 3、支付完成之后，RoyalPay服务器会通知支付成功
 * 4、在支付成功通知中需要查单确认是否真正支付成功（见：notify.php）
 */
//获取扫码
$input = new RoyalPayUnifiedOrder();
$input->setOrderId(RoyalPayConfig::PARTNER_CODE . date("YmdHis"));
$input->setDescription("test");
$input->setPrice("1");
$input->setCurrency("AUD");
$input->setNotifyUrl("http://115.29.162.214/example/notify.php");
$input->setOperator("123456");
$currency = $input->getCurrency();
if (!empty($currency) && $currency == 'CNY') {
    //建议缓存汇率,每天更新一次,遇节假日或其他无汇率更新情况,可取最近一个工作日的汇率
    $inputRate = new RoyalPayExchangeRate();
    $rate = RoyalPayApi::exchangeRate($inputRate);
    if ($rate['return_code'] == 'SUCCESS') {
        $real_pay_amt = $input->getPrice() / $rate['rate'] / 100;
        if ($real_pay_amt < 0.01) {
            echo '人民币转换澳元后必须大于0.01澳元';
            exit();
        }
    }
}

$result = RoyalPayApi::qrOrder($input);
$url2 = $result["code_url"];

//跳转
$inputObj = new RoyalPayRedirect();
$inputObj->setRedirect(urlencode('http://115.29.162.214/example/success.php?order_id=' . strval($input->getOrderId())));
?>

<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>RoyalPay支付样例-扫码</title>
    <script>
        function redirect(url) {
            window.location.href = url;
        }
    </script>
</head>
<body>
<div style="margin-left: 10px;color:#556B2F;font-size:30px;font-weight: bolder;">方式一、扫码支付</div>
<br/>
<img alt="扫码支付" src="qrcode.php?data=<?php echo urlencode($url2); ?>" style="width:150px;height:150px;"/>
<div style="margin-left: 10px;color:#556B2F;font-size:30px;font-weight: bolder;">方式二、跳转到RoyalPay支付</div>
<br/>
<button onclick="redirect('<?php echo RoyalPayApi::getQRRedirectUrl($result['pay_url'], $inputObj); ?>')">跳转
</button>
</body>
</html>