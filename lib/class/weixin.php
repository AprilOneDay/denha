<?php
class weixin extends member
{
	public $info;
	public $access_token;
	public $openid;
	public $lang;
	public $AppSecret;
	public $mchid; 				//微信商户支付号
	public $key;				//微信商户密钥
	public $user_access_token;
	public $user_openid;
	public $user_refresh_token;
	public $userinfo; 			//微信用户信息
	public function __construct($openid='',$AppSecret='')
	{
		
		$do = new sql();
		if($do->existsTbale('lgsc_payconfig'))
		{
			$payconfig = $do->M('payconfig');
			$openid	= $do->M('payconfig')->F('value')->W("name = 'openid'")->find('only');
			if($openid == '-1'){ return ''; }
			$this->openid  = $openid;
			
			$AppSecret = $do->M('payconfig')->F('value')->W("name = 'AppSecret'")->find('only');
			if($AppSecret == '-1'){ return ''; }
			$this->AppSecret = $AppSecret;
			$this->lang = 'zh_CN';
			
			$mchid = $do->M('payconfig')->F('value')->W("name = 'mchid'")->find('only');
			if($mchid != '-1'){  $this->mchid = $mchid; }
			
			$key = $do->M('payconfig')->F('value')->W("name = 'key'")->find('only');
			if($key != '-1'){  $this->mchid = $key; }
		}
	}
	//获取access token
	public function open($openid,$AppSecret,$lang='zh_CN')
	{
		$this->openid  = $openid;
		$this->AppSecret = $AppSecret;
		$this->lang = $lang;
		
		if(!isset($_COOKIE['access_token']))
		{
			$rest = file_get_contents("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=$openid&secret=$AppSecret");
			$rest = parent::json($rest);
			$this->error($rest);
			$this->access_token = $rest['access_token'];
			setcookie('access_token',$rest['access_token'],time()+$rest['expires_in']);
		}else{
			$this->access_token = $_COOKIE['access_token'];
		}
		
		//print_r($this->access_token);
	}
	
	//登录授权
	public function oauth2()
	{
		$user  = parent::user();
		if($user == '')
		{	
			$location = 'http://m.lgdsc.net/weixin_oauth2.php';
			$url ="https://open.weixin.qq.com/connect/oauth2/authorize?appid=".$this->openid."&redirect_uri=".$location."&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect";
			header("location:$url");
		}
	}
	
	//获取code信息
	public function weixinCode($code)
	{
		$url="https://api.weixin.qq.com/sns/oauth2/access_token?appid=".$this->openid."&secret=".$this->AppSecret."&code=$code&grant_type=authorization_code";
		$rest=file_get_contents($url);
		$rest = parent::json($rest);
		$this->error($rest);
		$this->user_access_token = $rest['access_token'];
		$this->user_openid = $rest['openid'];
		$this->user_refresh_token = $rest['refresh_token'];
		$this->weixinUser();
	}
	
	//获取威信用户信息
	public function weixinUser($user_access_token='',$user_openid='')
	{
		
		$this->user_access_token = $user_access_token == '' ? $this->user_access_token : $user_access_token;
		$this->user_openid = $user_openid == '' ? $this->user_openid : $user_openid;
		
		$this->verifyAccess();
		$url="https://api.weixin.qq.com/sns/userinfo?access_token=".$this->user_access_token."&openid=".$this->user_openid."&lang=zh_CN";
		$rest=file_get_contents($url);
		$rest = parent::json($rest);
		if(isset($rest['errcode'])){ return '-1'; }
		$this->userinfo = $rest;
		return true;
	}
	
	//刷新access_token
	public function F5Access()
	{
		$url = "https://api.weixin.qq.com/sns/oauth2/refresh_token?appid=".$this->openid."&grant_type=refresh_token&refresh_token=".$this->user_refresh_token;
		$rest = file_get_contents($url);
		$rest = parent::json($rest);
		$this->user_access_token = $rest['access_token'];
		$this->user_openid = $rest['openid'];
		$this->user_refresh_token = $rest['refresh_token'];
	}
	
	//验证access_token
	public function verifyAccess()
	{
		$url = "https://api.weixin.qq.com/sns/auth?access_token=".$this->user_access_token."&openid=".$this->user_openid;
		$rest = file_get_contents($url);
		$rest = parent::json($rest);
		if($rest['errcode'] != '0')
		{
			$this->F5Access();	
		}
	}
	
	
	//报错提示
	private function error($rest)
	{
		if(is_array($rest))
		{
			if(isset($rest['errcode'])){die($this->weixinMessage($rest['errcode']));} 
		}else{
			die('json有误');
		}
	}
	//返回错误提示信息
	public  function weixinMessage($value)
	{
		switch($value)
		{
			case '-1' :
				return '系统繁忙，此时请开发者稍候再试';
				break;
			case '0' :
				return '请求成功';
				break;
			case '40001' :
				return '获取access_token时AppSecret错误，或者access_token无效。请开发者认真比对AppSecret的正确性，或查看是否正在为恰当的公众号调用接口 ';
				break;
			case '40002' :
				return '不合法的凭证类型';
				break;
			case '40003' :
				return '不合法的OpenID，请开发者确认OpenID（该用户）是否已关注公众号，或是否是其他公众号的OpenID ';
				break;
			case '40004' :
				return '不合法的媒体文件类型';
				break;
			case '40005' :
				return '不合法的文件类型';
				break;
			case '40006' :
				return '不合法的文件大小';
				break;
			case '40007' :
				return '不合法的媒体文件id';
				break;
			case '40008' :
				return '不合法的消息类型';
				break;
			case '40009' :
				return '不合法的图片文件大小';
				break;
			case '40010' :
				return '不合法的语音文件大小';
				break;
			case '40011' :
				return '不合法的视频文件大小';
				break;
			case '40012' :
				return '不合法的缩略图文件大小';
				break;
			case '40013' :
				return '不合法的AppID，请开发者检查AppID的正确性，避免异常字符，注意大小写 ';
				break;
			case '40014' :
				return '不合法的access_token，请开发者认真比对access_token的有效性（如是否过期），或查看是否正在为恰当的公众号调用接口 ';
				break;
			case '40015' :
				return '不合法的菜单类型';
				break;
			case '40016' :
				return '不合法的按钮个数';
				break;
			case '40017' :
				return '不合法的按钮个数';
				break;
			case '40018' :
				return '不合法的按钮名字长度';
				break;
			case '40019' :
				return '不合法的按钮KEY长度 ';
				break;
			case '40020' :
				return '不合法的按钮URL长度 ';
				break;
			case '40021' :
				return '不合法的菜单版本号';
				break;
			case '40022' :
				return '不合法的子菜单级数';
				break;
			default :
				return '未知错误信息:'.$value;																				 		 		 				 
		}
	}
}