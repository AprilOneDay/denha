<template>
	<div id="console-index-login">
		<div class="account-pages"></div>
		<div class="clearfix"></div>
		<div class="wrapper-page">
			<div class="card-box">
				<div class="panel-heading"><img src="/img/logo-200x200.png" ></div>
				<div class="panel-body">
					<form class="form-horizontal" id="Login">
						<div class="form-group">
							<div class="col-xs-12">
								<input type="text" class="form-control" id="account" name="account" required placeholder="用户名">
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-12">
								<input type="password" class="form-control" id="password" name="password" required placeholder="密码">
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-4">
								<input type="text" class="form-control" id="verify" name="verify" required placeholder="验证码">
							</div>
							<div class="col-xs-8">
								<img id="captcha" class="captcha" src="/login/account/captcha" />
							</div>
						</div>
						<div class="form-group text-center">
							<div class="col-xs-12">
								<button class="btn btn-primary btn-block" type="submit">登录</button>
							</div>
						</div>
						<p class="error-text"></p>
					</form>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-12 text-center">
					<p>Copyright © 2016 chayu.com All Rights Reserved</p>
				</div>
			</div>
		</div>
	</div>
</template>
<script>
export default {
	name: 'console-index-login',
	data () {
		return {}
	}
}
</script>