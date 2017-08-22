<template>
	<div id="console-index-top">
		<div class="border-top">
			<div class="border-top-left fl">
				<ul>
					<li><a class="logo">Denha</a></li>
				</ul>
			</div>
			<div class="border-top-right fr">
				<ul>
					<li><a href="javascript:;">{{data.nickname}}</a></li>
					<li><a href="javascript:;" @click="outLogin()">退出</a></li>
				</ul>
			</div>
		</div>
	</div>
</template>
<script>
export default {
	name: 'console-index-top',
	data () {
		return {
			data:{},
		}
	},
	//更换验证码
	methods: {
		outLogin:function(){
			sessionStorage.admin = '';
			this.$router.push({path:'/login'})
		},
	},
	created:function(){
		if(sessionStorage.admin){
			this.data = JSON.parse(sessionStorage.admin);
		}
		
	}
}
</script>