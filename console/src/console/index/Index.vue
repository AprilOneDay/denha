<template>
	<div id="console-index-index">
		<app-top></app-top>
		<div class="wrapper">
			<nav class="sidebar-inner fl">
				<div class="sidebar-fold" ><span class="glyphicon glyphicon-transfer"></span></div>
				<ul>
					<li v-for="list in data">
						<a href="javascript:;" data-toggle="tooltip" data-placement="right" title="Tooltip on right">
							<span v-bind:class="list.icon"></span>{{list.name}}</a>
						<dl v-if="list.child">
							<dd v-for="vo in list.child">
								<a href="javascript:;"><span v-bind:class="list.icon"></span>{{list.name}}</a>
							</dd>
						</dl>
					</li>
				</ul>
			</nav>
			
			<div class="product-nav-scene fl">
				<div class="title">设置</div>
				<ul>
					<li><router-link to="/console/menus/setting"><span></span>配置菜单</router-link></li>
					<li><a href="javascript:;"><span class="glyphicon glyphicon-triangle-right"></span>存储</a>
						<dl>
							<dd><a href="javascript:;">云盘</a></dd>
							<dd><a href="javascript:;">文件存储</a></dd>
						</dl>
					</li>
					<li><a href="javascript:;"><span class="glyphicon glyphicon-triangle-right"></span>存储</a>
						<dl>
							<dd><a href="javascript:;">云盘</a></dd>
							<dd><a href="javascript:;">文件存储</a></dd>
						</dl>
					</li>
				</ul>
			</div>
			<div class="content-main fl" >
				<router-view></router-view>
			</div>
		</div>
	</div>
</template>
<script>
import AppTop from './Top.vue'
export default {
	name: 'home',
	data () {
		return {
		  data: {},
		}
	},
	components:{AppTop},
	methods:{
		getList:function(){
			layer.load();
		  	this.$http.get(config.data.console+'/index/index/menus',{},{emulateJSON:true}).then(function(reslut){
		  		layer.closeAll('loading');
				this.data = reslut.body.list;
				console.log(this.data);
		  	})	
	  	},
	},
	created:function(){
		this.getList();
	},
}
</script>