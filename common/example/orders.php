<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>RoyalPay支付样例-查询账单</title>
</head>
<?php
ini_set('date.timezone', 'Asia/Shanghai');
error_reporting(E_ERROR);
require_once "../lib/RoyalPay.Api.php";
require_once 'Log.php';

//初始化日志
$logHandler = new CLogFileHandler("../logs/" . date('Y-m-d') . '.log');
$log = Log::Init($logHandler, 15);


function printf_info($data)
{
    echo json_encode($data);
}

$input = new RoyalPayQueryOrders();
$input->setLimit(10);
$input->setPage(1);
$input->setStatus('ALL');//允许值: 'ALL', 'PAID', 'REFUNDED'
printf_info(RoyalPayApi::orders($input));
exit();

?>
<body>
</body>
</html>