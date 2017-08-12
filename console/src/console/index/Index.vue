<template>
	<div id="console-index-index">
		<app-top></app-top>
		<div class="wrapper container-fluid">
			<nav class="sidebar-inner fl col-md-1">
				<div class="sidebar-fold" ><span class="glyphicon glyphicon-transfer"></span></div>
				<ul>
					<li v-for="(value,key) in list" >
						<a href="javascript:;" v-on:click="open(key)">
							<span v-bind:class="value.icon"></span>{{value.name}}</a>
						<dl v-if="value.child" v-show="value.childShow">
							<dd v-for="v in value.child">
								<router-link v-bind:to="v.url+'?id='+v.id" active-class="cur">
									<span v-bind:class="v.icon"></span>{{v.name}}
								</router-link>
							</dd>
						</dl>
					</li>
				</ul>
			</nav>
			
			<div class="product-nav-scene fl col-md-1" v-show="this.$route.query.id">
				<div class="title">设置</div>
				<ul>
					<li v-for="(value,key) in secList" >
						<router-link v-bind:to="value.url+'?id='+value.id" active-class="cur">
							<span v-bind:class="value.icon"></span>{{value.name}}
						</router-link>
						<dl v-if="value.child" v-show="value.childShow">
							<dd v-for="v in value.child">
								<router-link v-bind:to="v.url+'?id='+v.id" active-class="cur">
									<span v-bind:class="v.icon"></span>{{v.name}}
								</router-link>
							</dd>
						</dl>
					</li>
				</ul>
			</div>
			<div class="content-main fl col-md-10" v-if="this.$route.query.id">
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
	name: 'home',
	data () {
		return {
		  list: {},
		  secList:{},
		}
	},
	components:{AppTop},
	methods:{
		getList:function(){
		  	this.$http.get(config.data.console+'/index/index/menus',{},{emulateJSON:true}).then(function(reslut){
				this.list = reslut.body.list;
		  	})
	  	},
	  	getSecList:function(){
	  		if(this.$route.query.id){
	  			let dataId  = this.$route.query.id;
	  			this.$http.get(config.data.console+'/index/index/menus?id='+dataId,{},{emulateJSON:true}).then(function(reslut){
					this.secList = reslut.body.list;
			  	})
	  		}
	  	},
	  	//显示下拉菜单
	  	open:function(index){
	  		if(this.list[index].child){
	  			if(this.list[index].childShow  == false){
		  			this.list[index].childShow = true;
		  			this.list[index].icon = 'glyphicon glyphicon-triangle-bottom';
		  		}else{
		  			this.list[index].childShow = false;
		  			this.list[index].icon = 'glyphicon glyphicon-triangle-right';
		  		}
	  		}	
	  	}
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

	    //导航展开下级菜单
	    $('.sidebar-inner ul li').click(function() {
	        //初始化
	        $('.sidebar-inner ul li dl').css('display', 'none');
	        $('.sidebar-inner ul li').each(function() {
	            if ($(this).children().children().eq(0).attr('class') == 'glyphicon glyphicon-triangle-bottom') {
	                $(this).children().children().eq(0).attr('class', 'glyphicon glyphicon-triangle-right');
	            }
	        });

	    })

	    //导航展开下级菜单
	    $('.product-nav-scene ul li').click(function() {
	        //初始化
	        $('.product-nav-scene ul li dl').css('display', 'none');
	        $('.product-nav-scene ul li').each(function() {
	            if ($(this).children().children().eq(0).attr('class') == 'glyphicon glyphicon-triangle-bottom') {
	                $(this).children().children().eq(0).attr('class', 'glyphicon glyphicon-triangle-right');
	            }
	        });

	        //展开/收缩
	        var ico = $(this).children().children(':first').attr('class');
	        if (ico == 'glyphicon glyphicon-triangle-right') {
	            $(this).children().children(':first').attr('class', 'glyphicon glyphicon-triangle-bottom');
	            $(this).find('dl').css('display', 'block');
	        } else if (ico == 'glyphicon glyphicon-triangle-bottom') {
	            $(this).children().children(':first').attr('class', 'glyphicon glyphicon-triangle-right');
	            $(this).find('dl').css('display', 'none');
	        }

	    })
	},
	created:function(){
		this.getList();
		this.getSecList();
	},
}
</script>