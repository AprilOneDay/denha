<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1" /> 
    <title>RoyalPay支付样例-退款</title>
</head>
<?php
ini_set('date.timezone','Asia/Shanghai');
error_reporting(E_ERROR);
require_once "../lib/RoyalPay.Api.php";
require_once 'Log.php';
header("Content-Type:text/html;charset=utf-8");

//初始化日志
$logHandler= new CLogFileHandler("../logs/".date('Y-m-d').'.log');
$log = Log::Init($logHandler, 15);

function printf_info($data)
{
    foreach($data as $key=>$value){
        echo "<font color='#f00;'>$key</font> : $value <br/>";
    }
}
if(isset($_REQUEST["order_id"]) && $_REQUEST["order_id"] != "" && isset($_REQUEST["refund_id"]) && $_REQUEST["refund_id"] != ""){
	if (!isset($_REQUEST["fee"]) || $_REQUEST["fee"] == ""){
		echo '请输入退款金额';
		exit();
	}
	$input = new RoyalPayApplyRefund();
	$input->setOrderId($_REQUEST["order_id"]);
	$input->setRefundId($_REQUEST["refund_id"]);
	$input->setFee($_REQUEST["fee"]);
	printf_info(RoyalPayApi::refund($input));
	exit();
}
?>
<body>  
	<form action="#" method="post">
        <div style="margin-left:2%;">商户订单号：</div><br/>
        <input type="text" style="width:96%;height:35px;margin-left:2%;" name="order_id" /><br /><br />
		<div style="margin-left:2%;">退款单号：</div><br/>
		<input type="text" style="width:96%;height:35px;margin-left:2%;" name="refund_id" /><br /><br />
        <div style="margin-left:2%;">退款金额(澳元)：</div><br/>
        <input type="text" style="width:96%;height:35px;margin-left:2%;" name="fee" /><br /><br />
		<div align="center">
			<input type="submit" value="提交退款" style="width:210px; height:50px; border-radius: 15px;background-color:#FE6714; border:0px #FE6714 solid; cursor: pointer;  color:white;  font-size:16px;" type="button" />
		</div>
	</form>
</body>
</html>