<?php
//include($_SERVER['DOCUMENT_ROOT'].'/wap/public/config/index.php');
include($_SERVER['DOCUMENT_ROOT'].'/public/config/index.php');

class pay
{
	public $payinfo;
	public $do;
	public $showlog;
	public function __construct()
	{
		   
			$this->showlog = new showlog();
			$this->do = new Sql();
			$rows = $this->do->M('payconfig')->find('array');
			if($rows != '-1')
			{
				foreach($rows as $rows)
				{
					$this->payinfo[$rows['name']] = $rows['value'];
				}
			}
			else
			{
				$log = date('Y-m-d h:i:s',time()).'未发现支付配置信息';
				$this->showlog->write($log,'payconfiglog.txt');		
			}
	}
}