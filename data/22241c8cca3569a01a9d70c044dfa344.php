<!doctype html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=8">
	<meta name="keywords" content=""/>
	<title>后台管理</title>
		<link rel="stylesheet" href="/vendor/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/vendor/pace/themes/blue/pace-theme-minimal.css" />
	<link rel="stylesheet" href="/ststic/admin/css/common.css" />
	<link rel="stylesheet" href="/ststic/admin/css/css.css" />
</head>
  	<body>
		<div class="account-pages"></div>
		<div class="clearfix"></div>
		<div class="wrapper-page">
			<div class="card-box">
				<div class="panel-heading"><img src="<?php echo getVar('logo','admin.sys'); ?>"></div>
				<div class="panel-body">
					<form class="form-horizontal" >
						<div class="form-group">
							<div class="col-xs-12">
								<input type="text" class="form-control" name="username" required placeholder="用户名">
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-12">
								<input type="password" class="form-control"  name="password" required placeholder="密码">
							</div>
						</div>
						<!-- <div class="form-group">
							<div class="col-xs-4">
								<input type="text" class="form-control"  v-model="verify" required placeholder="验证码">
							</div>
							<div class="col-xs-8">
								<img  class="captcha" v-bind:src="validateCode" style="cursor: pointer;" @click="changeValidateCode()"  />
							</div>
						</div> -->
						<div class="form-group text-center">
							<div class="col-xs-12">
								<button class="btn btn-primary btn-block btn-login"  type="button">登录</button>
							</div>
						</div>
						<p class="error-text"></p>
					</form>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-12 text-center">
					<p>Copyright © 2017 denha.cn All Rights Reserved</p>
				</div>
			</div>
		</div>
	</div>
		<script type="text/javascript" src="/ststic/admin/js/jquery-1.12.3.min.js"></script>
	<script type="text/javascript" src="/ststic/admin/js/common.js"></script>
	<script type="text/javascript" src="/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/vendor/pace/pace.min.js"></script>
	<script type="text/javascript" src="/vendor/layer/layer.js"></script>

	<script type="text/javascript">
		$('.btn-login').click(function(){
			var username = $('input[name=username]').val();
			var password = $('input[name=password]').val();
			$.post('/index/login',{username:username,password:password},function(result){
				layer.msg(result.msg);
				if(result.status){
					window.location.href = '/';
				}
			},"json");
		});
	</script>
</body>
</html>