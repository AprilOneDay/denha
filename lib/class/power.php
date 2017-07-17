<?php
include_once('member.class.php');
include_once('mysql.class.php');
class power  extends member
{
	public $member; 	//member模块
	public $do;			//sql 模块
	public $masking;	//是否屏蔽屏蔽
	public $value;
	public $name;
	
	//获取会员权限记录
	public function __construct()
	{
		$this->app = 'wap';
		$this->masking = true;
		//执行member模块
		$this->member = new member();
		$this->member->user();
		//执行sql 模块
		$this->do = new sql();
		if($this->member->userid != '')
		{
			//移动端权限
			if( $this -> app == 'wap')
			{
				$power = $this->do->M('power')->F('wapvalue,wappower')->W("userid = ".$this->member->userid)->find();
				if($power != '-1')
				{
					$this-> name  = explode('|',$power['wappower']);
					$this-> value = explode('|',$power['wapvalue']);
				}
			}
		}
	}
	
	
	//屏蔽权限
	public function fullMasking()
	{
		$this->masking = false;
	}
	
	//是否拥有该权限
	public function isPower($name,$masking=true)
	{
		//print_r($this->name."1</br>");
		if($this->masking == false){ return true; }
		if($this->name == ''){ return false; }
		$key = array_search($name,$this->name);
		if($key >= 0 )
		{
			$this -> value[$key];
			if($this -> value[$key] == 1){ return true; }
			else{ return false; }
		}else{
			die ($name.'该权限不存在');
		}
	}
}
?>