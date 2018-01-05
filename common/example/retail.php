<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>RoyalPay支付样例-线下QRCode支付</title>
</head>
<?php
require_once "../lib/RoyalPay.Api.php";
require_once 'Log.php';

//初始化日志
$logHandler = new CLogFileHandler("../logs/" . date('Y-m-d') . '.log');
$log = Log::Init($logHandler, 15);

//打印输出数组信息
function printf_info($data)
{
    foreach ($data as $key => $value) {
        echo "<font color='#00ff55;'>$key</font> : $value <br/>";
    }
}

$input = new RoyalPayRetailQRCode();
$input->setOrderId(RoyalPayConfig::PARTNER_CODE . date("YmdHis"));
$input->setDescription("test");
$input->setPrice("1");
$input->setCurrency("AUD");
$input->setNotifyUrl("http://115.29.162.214/example/notify.php");
$input->setDeviceId("18651874535");
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

//支付下单
$result = RoyalPayApi::retailQRCodeOrder($input);
$url2 = $result["code_url"];

?>
<body>
<form action="#" method="post">
    <img alt="扫码支付" src="qrcode.php?data=<?php echo urlencode($url2); ?>" style="width:150px;height:150px;"/>
</form>
</body>
</html>