<template>
	<div id="console-index-login">
		<div class="account-pages"></div>
		<div class="clearfix"></div>
		<div class="wrapper-page">
			<div class="card-box">
				<div class="panel-heading"><img v-bind:src="logo" /></div>
				<div class="panel-body">
					<form class="form-horizontal" @submit.prevent="submit">
						<div class="form-group">
							<div class="col-xs-12">
								<input type="text" class="form-control" v-model="data.username" required placeholder="用户名">
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-12">
								<input type="password" class="form-control"  v-model="data.password" required placeholder="密码">
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-4">
								<input type="text" class="form-control"  v-model="data.verify" required placeholder="验证码">
							</div>
							<div class="col-xs-8">
								<img  class="captcha" v-bind:src="validateCode" style="cursor: pointer;" @click="changeValidateCode()"  />
							</div>
						</div>
						<div class="form-group text-center">
							<div class="col-xs-12">
								<button class="btn btn-primary btn-block" style="padding:0px;" type="submit">登录</button>
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
</template>
<script>
export default {
	name: 'console-index-login',
	data () {
		return {
			data:{},
			logo:config.data.logo,
			validateCode:config.data.console+'/index/index/validateCode',
		}
	},
	//更换验证码
	methods: {
		changeValidateCode:function(){
			this.validateCode = config.data.console+'/index/index/validateCode?' + Math.random(); 
		},
		submit:function(){
			this.$layer.loading();
			this.$http.post(config.data.console+'/index/login/account',{data:JSON.stringify(this.data)}).then(function(reslut){
	   			this.$layer.closeAll('loading');
	   			var data = reslut.body;
	   			this.$layer.msg(data.msg);
	   			if(data.status){
	   				sessionStorage.admin = data.data;
	   				this.$router.push({path:'/console'})
	   			}
	   		})
		},
	}
}
</script>