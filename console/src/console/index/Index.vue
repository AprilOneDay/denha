<template>
	<div id="console-index-index">
		<app-top></app-top>
		<div class="wrapper container-fluid">
			<nav class="sidebar-inner fl col-md-1">
				<div class="sidebar-fold" ><span class="glyphicon glyphicon-transfer"></span></div>
				<ul>
					<li v-for="(value,key) in list" >
						<a href="javascript:;" @click="open(key)">
							<span v-bind:class="value.icon"></span>{{value.name}}</a>
						<dl v-if="value.child" v-show="value.childShow">
							<dd v-for="v in value.child">
								<a @click="secListShow(v)">
									<span v-bind:class="v.icon"></span>{{v.name}}
								</a>
							</dd>
						</dl>
					</li>
				</ul>
			</nav>
			
			<div class="product-nav-scene fl col-md-1" v-show="secList.length">
				<div class="title">设置</div>
				<ul>
					<li v-for="(value,key) in secList" >
						<a v-if="value.child" @click="open(key,2)">
							<span class="glyphicon glyphicon-triangle-right"></span>
							{{value.name}}
						</a>
						<router-link v-bind:to="value.url" active-class="cur" v-else>
							<span></span>
							{{value.name}}
						</router-link>
						<dl v-if="value.child" v-show="value.childShow">
							<dd v-for="v in value.child">
								<router-link v-bind:to="v.url" active-class="cur">
									<span v-bind:class="v.icon"></span>{{v.name}}
								</router-link>
							</dd>
						</dl>
					</li>
				</ul>
			</div>
			<div class="content-main fl col-md-10" v-if="secList.length">
				<router-view></router-view>
			</div>
			<div class="content-main fl col-md-11" v-else>
				<router-view></router-view>
			</div>
		</div>
	</div>
</template>
<script>
import AppTop from './Top.vue'
export default {
	name: 'console-index-index',
	data () {
		return {
		  list: {},
		  secList:{},
		}
	},
	components:{AppTop},
	methods:{
		getListOne:function(){
		  	this.$http.get(config.data.console+'/index/index/menus',{},{emulateJSON:true}).then(function(reslut){
				this.list = reslut.body.list;
		  	})
	  	},
	  	getSecListSec:function(id){
	  		if(id){
	  			this.$http.get(config.data.console+'/index/index/menus?id='+id,{},{emulateJSON:true}).then(function(reslut){
					this.secList = reslut.body.list;
			  	})
	  		}
	  	},
	  	//显示下拉菜单
	  	open:function(index,type = 1){
	  		let listData = {};
	  		if(type == 1){
	  			listData = this.list[index];
	  		}else if(type == 2){
	  			listData = this.secList[index];
	  		}

  			if(listData.child){
	  			if(listData.childShow  == false){
		  			listData.childShow = true;
		  			listData.icon = 'glyphicon glyphicon-triangle-bottom';
		  		}else{
		  			listData.childShow = false;
		  			listData.icon = 'glyphicon glyphicon-triangle-right';
		  		}
	  		}	
	  	},
	  	secListShow:function(obj){
	  		this.getSecListSec(obj.id);
	  	},
	},
	mounted:function(){
		//主页容器固定高宽
	    $('.sidebar-inner').height($(document).height() - $('.border-top').height());
	    $('.product-nav-scene').height($(document).height() - $('.border-top').height())
	    $('.content-main').height($(document).height() - $('.border-top').height());

	    $(window).resize(function() {
	        $('.sidebar-inner').height($(document).height() - $('.border-top').height());
	        $('.product-nav-scene').height($(document).height() - $('.border-top').height())
	        $('.content-main').height($(document).height() - $('.border-top').height());
	    });

		 //收缩一级导航
	    $('.sidebar-fold').click(function() {
	        var width = $(this).width();
	        if (width > 38) {
	            $('.sidebar-inner').width(38);
	        } else {
	            $('.sidebar-inner').width(180);
	        }

	    });
	},
	created:function(){
		this.getListOne();
	},
	watch: {
		/*'$route' (to, from) {
			this.getSecListSec();
		}*/
	}

}
</script>