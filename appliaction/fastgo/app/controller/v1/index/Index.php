<?php
/**
 * 会员模块
 */
namespace app\fastgo\app\controller\v1\index;

use app\app\controller;

class Index extends \app\fastgo\app\controller\Init
{
   /**
	 * 接口测试
	 */
   public function index(){
	   
	   $data = array(
	   
			'type' => 1,
			'username' => '测试',
			'password' => '123456',
			'mobile' => '15215051909',
			'is_agree' => 1
	   
	   );
	   //var_dump(json_encode($data));die();
	   $result = $this -> http_post_json('http://192.168.0.254:8092/v1/user/Operation/register',json_encode($data));
		var_dump($result);
   }
   
  
   
   //HTTP JSON请求
    public function http_post_json($url, $jsonStr)
	{
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $jsonStr);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_HTTPHEADER, array(
				'Content-Type: application/json; charset=utf-8',
				'Content-Length: ' . strlen($jsonStr)
			)
		);
		$response = curl_exec($ch);
		$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
		curl_close($ch);
	 
		return array($httpCode, $response);
	}
	
}