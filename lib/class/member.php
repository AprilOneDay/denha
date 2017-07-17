<?php
include_once('function.class.php');
class member extends v
{	
	public $app;				//浏览端口
	public $userid; 			//用户id
	public $username;			//用户名
	public $password;			//密码
	public $lastlogintime;		//最后登录时间
	public $lastloginip;		//最后登录IP
	public $do;					//mysql
	public $exitstUserRest;		//该函数结果返回值
	
	
	public function __construct()
	{		
		$this -> app = 'wap'; //移动端
		
		$this->do = new sql();
	}
	
	//获取用户信息
	public function user()
	{
		$user['userid'] = isset($_COOKIE['userid']) ?  parent::AuthCode($_COOKIE['userid']) : ''; //id
		$user['username'] = isset($_COOKIE['username']) ? parent::AuthCode($_COOKIE['username']) : ''; //会员用户名
		$user['lastlogintime'] = isset($_COOKIE['lastlogintime']) ? parent::AuthCode($_COOKIE['lastlogintime']) : ''; //登陆时间
		$user['lastloginip'] = isset($_COOKIE['lastloginip']) ? parent::AuthCode($_COOKIE['lastloginip']) : ''; //登陆ip
		if($user['userid'] == ''){ $user = ''; }
		else{
			$this -> userid = 	$user['userid'];
			$this -> username = $user['username'];
		}
		return $user;
	}
	
	
	//用户登录
	public function login($username,$password)
	{
		
		if($this->exitstUser($username,$password))
		{
			$user = $this->do->M('member')->W("id=".$this->userid)->find(); 
			//生成登陆认证
			$rnd = self::makecode(6);
			
			//生成COOkie
			$cookie_time = time()+3600;
			setcookie('userid',      	self::AuthCode($user['id'],$rnd), $cookie_time,'/');
			setcookie('username',    	self::AuthCode($user['username'],$rnd), $cookie_time,'/');
			setcookie('lastlogintime', 	self::AuthCode($user['regtime'],$rnd), $cookie_time,'/');
			setcookie('lastloginip',   	self::AuthCode(self::GetIP(),$rnd), $cookie_time,'/');
			setcookie("qtrnd",$rnd, $cookie_time,'/');
			
			//更新最后登陆时间 和 登陆认证 登录IP
			$this->do->M('member')->F("logintime =".time()." , loginip=".self::GetIP())->W("userid = ".$user['id'])->exc('update');;
			if($this->userStartPower())
			{
				//登录成功			
				return true;
			}
		}
		else
		{
			return $this->exitstUserRest;
		}
	}
	
	//验证账号
	public function exitstUser($username,$password = '')
	{
		$user = $this->do->M('member')->W("username='$username' or mobile = '$username' or email = '$username'")->find(); 
		if($user == '-1' ){ $this->exitstUserRest = '00002'; return false; exit();}
		if($password != '')
		{
			//密码加密
			if( md5(md5($password)) !== $user['password']){  $this->exitstUserRest =  '00003'; return false; exit();   }
			$this->password = $password;
		}
		$this->userid = $user['id'];
		$this->username = $username;
		return true;
	}
	
	//生成初始操作权限
	public function userStartPower($username='',$password='',$userid='')
	{
		$this->username = $this->username != '' ? $this->username : $username;
		$this->password = $this->password != '' ? $this->password : $password;
		$this->userid   = $this->userid != '' ? $this->userid : $userid;
		if($this->username != '')
		{
			if($this->exitstUser($this->username,$this->password))
			{
				$post['userid']    = $this->userid;
				$post['wappower']  = 'zczx|zczx_ye|zczx_yhj|zczx_jf|zczx_mm|zczx_mm|zczx_cz|wdcs_sp|wdcs_sp|wddd|syt|shdz|shdz_bj|shdz_mr|shdz_tj|shdz_sc';	
				$post['wapvalue']  = '1|1|1|1|1|1|1|1|1|1|1|1|1|1|1';
				$power = $this->do->M('power')->F('id')->W("userid='".$this->userid."'")->find();
				//print_r($power);
				if($power == '-1')
				{
					$rest = $this->do->M('power')->S($post)->exc('insert into');
				}
			}
		}else
		{
			return false;
		}
		return true;
	}
	
	//第三方登录
	public function oauth2Login($id,$oauth2)
	{
		//echo "select * from lgsc_member where id='$id' and  oauth2 = '$oauth2'";
		$user =  $this->do->M('member')->W("id='$id' and  oauth2 = '$oauth2'")->find();
		if($user == '-1' ){return '-1'; exit();}
		$this->userid = $user['id'];
		//生成登陆认证
		$rnd = self::makecode(6);
		//生成COOkie
		$cookie_time = time()+3600;
		setcookie('userid',      	self::AuthCode($user['id'],$rnd), $cookie_time,'/');
		setcookie('username',    	self::AuthCode($user['username'],$rnd), $cookie_time,'/');
		setcookie('lastlogintime', 	self::AuthCode($user['regtime'],$rnd), $cookie_time,'/');
		setcookie('lastloginip',   	self::AuthCode(self::GetIP(),$rnd), $cookie_time,'/');
		setcookie("qtrnd",$rnd, $cookie_time,'/');
		//更新最后登陆时间 和 登陆认证 登录IP
		$this->do->M('member')->F("logintime =".time()." , loginip=".self::GetIP())->W("userid = ".$user['id'])->exc('update');
		//登录成功
		$post['userid']    = $this->userid;
		$post['wappower']  = 'zczx|zczx_ye|zczx_yhj|zczx_jf|zczx_mm|zczx_mm|zczx_cz|wdcs_sp|wdcs_sp|wddd|syt|shdz|shdz_bj|shdz_mr|shdz_tj|shdz_sc';	
		$post['wapvalue']  = '1|1|1|1|1|1|1|1|1|1|1|1|1|1|1';
		$power = $this->do->M('power')->F('id')->W("userid='".$this->userid."'")->find();
		//print_r($power);
		if($power == '-1')
		{
			$rest = $this->do->M('power')->S($post)->exc('insert into');
		}			
		return true;
	}
	function memberExit()
	{
		setcookie('userid',"",time()-3600*10,'/');
		setcookie('username',"",time()-3600*10,'/');
		setcookie('lastlogintime',"",time()-3600*10,'/');
		setcookie('lastloginip',"",time()-3600*10,'/');
		setcookie('qtrand',"",time()-3600*10,'/');
		//跳转登陆
		return true;
	}
	
	//显示顶级级联
	/*
		$hotdata => 当前高亮值
		$addsql => 查询条件
		$floor => 层级
		$revalue => 上层级值
		$list => 显示类型
	*/
	function returnCas($mark='trade',$floor='',$revalue='',$addsql='')
	{
		if($floor == 1){ $addsql = "`datagroup`='$mark' AND level=0";}
		elseif($floor == 2){ $addsql = " (datavalue > $revalue and datavalue < ".($revalue+499).") and level=1 "; }
		elseif($floor == 3){ $addsql = " (datavalue > $revalue and datavalue < ".($revalue+1).") and level=2 "; }
		$addsql = $addsql." ORDER BY orderid ASC, datavalue ASC ";
		$row = $this->do->M('cascadedata')->F('dataname,datavalue')->W($addsql)->find('array');
		if($row != '-1')
		{
			for($i=0,$n=count($row);$i<$n;$i++)
			{
				$r[$i]['name']  = $row[$i]['dataname'];
				$r[$i]['value'] = $row[$i]['datavalue'];
			}
		}else{ $r = '-1'; }
		return $r;
	}
	
	//获取对应城市社区地址
	function getCommunity($value)
	{
		$community = $this->do->M('community')->F('id,title')->W("address_prov = $value or address_city = $value or address_country = $value")->find('array');
		if($community == '-1'){ return  '-1'; }
		for($i=0,$n=count($community);$i<$n;$i++)
		{
			$r[$i]['name'] = $community[$i]['title'];
			$r[$i]['value']	= $community[$i]['id']; 
		}
		return $r;
	}

	//修改密码
	public function ChangePassword($username)
	{
		$one_user =  $this->do->M("member")->W("username = '$username'")->find();
		//判断是否存在该用户
		if($one_user == '-1'){ return -1; exit(); }			
		//对比密码是否正确
		if($oldpassword !=="")
		{
			if($one_user['password'] !== md5(md5($oldpassword)) ){ return -2;exit();}  
		}
		//获取密码强度
		$password_strength = password_strength($password);
		//密码修改
		if( $password != '')
		{
			//两次密码不一致请从新输入
			if( $password !== $repassword ){ return false;}
			else{
				$newpassword = md5(md5($password));
				$sql_password = "update lgsc_member set password ='$newpassword' , password_strength ='$password_strength' where id = ".$one_user['id'];
				$rest_password = mysql_query($sql_password);
				if(!$rest_password){ return false;}
			}	
		}
		return true;
	}
	
	//判断支付密码是否正确
	function isPayPassword($paypswd,$user,$falseNum='5')
	{
		date_default_timezone_set('PRC'); //取服务器时间
		if($user == ''){ return  '-1'; } //用户不存在
		
		
		$userinfo = $this->do->M('member')->F('payfalse,paypswd')->W("id='$user[userid]'")->find();
		if($userinfo['paypswd'] == ''){ return '-1';} //支付密码为空 未设置
		
		if($paypswd != $userinfo['paypswd'])
		{
			//记录当天错误次数
			if($userinfo['payfalse'] == '')
			{
				$payfalse = date('Y-m-d').",1";
				$rest = $this->do->M('member')->F("payfalse = '$payfalse'")->W("id='$user[userid]'")->exc('update');
				return '密码输入错误,你还有'.($falseNum-1).'次机会';
				exit();
			}else{
				//查询当天错误次数
				$false = explode(',',$userinfo['payfalse']);
				//不是当天的记录
				if($false[0] != date('Y-m-d'))
				{
					$payfalse = date('Y-m-d').",1";
					$rest = $this->do->M('member')->F("payfalse = '$payfalse'")->W("id='$user[userid]'")->exc('update');
					return '密码输入错误,你还有'.($falseNum-1).'次机会';
					exit();
				}else
				{
					//当天记录小于falseNum次,继续增加次数
					if($false[1] < $falseNum)
					{
						$payfalse = date('Y-m-d').",".($false[1]+1);
						$rest = $this->do->M('member')->F("payfalse = '$payfalse'")->W("id='$user[userid]'")->exc('update');
						if($false[1] == $falseNum - 1 )
						{
							return '密码输入错误,请明天尝试';
						}else
						{
							return '密码输入错误,你还有'.($falseNum - $false[1] - 1).'次机会';
						}
						exit();
					}
					//超过错误次数 禁止支付
					else{
						return '你已'.$falseNum.'次输入错误,请明天尝试';
						exit();
					}
				}
			}
		}
		elseif($userinfo['payfalse'] != '')
		{
			$false = explode(',',$userinfo['payfalse']);
			if($false[0] == date('Y-m-d') && $false[1] == $falseNum )
			{
				return '你已'.$falseNum.'次输入错误,请明天尝试';
				exit();
			}else{
				return 1;
			}
		}
		return 1;
	}
	//获取积分记录状态
	public function GetIntegralType($value)
	{
		switch($value)
		{
		case 1 :
			$blance['type']='商品购买';
			$blance['icon']='+';
			$blance['class']='style="color:red"';
			break;
		case 2 :
			$blance['type']='商品支付';
			$blance['icon']='-';
			$blance['class']='style="color:green"';
			break;
		case 3 :
			$blance['type']='商品评价';
			$blance['icon']='+';
			$blance['class']='style="color:red"';
			break;									
		default:
			$blance['type'] = $value;
			$blance['icon']='+';
			$blance['class']='style="color:red"';
		}
		return $blance;
	}
	
	//充值记录
	public function GetBalanceType($value)
	{
		switch($value)
		{
		case 1 :
			$blance['type']='充值';
			$blance['icon']='+';
			$blance['class']='style="color:red"';
			break;
		case 2 :
			$blance['type']='支出';
			$blance['icon']='-';
			$blance['class']='style="color:green"';
			break;
		case 3 :
			$blance['type']='退款';
			$blance['icon']='+';
			$blance['class']='style="color:red"';
			break;
		default:
			$blance['type'] = $value;
			$blance['icon']='';
			$blance['class']='style="color:#fff"';										
		}
		return $blance;
	}	
	
}
?>