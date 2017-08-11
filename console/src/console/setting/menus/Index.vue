<template>
	<div id="console-menus-index">
		<div class="view-content-container" >
			<div class="row">
				<div class="col-sm-12">
					<div class="console-title console-title-border clearfix">
						<div class="pull-left">
							<h5>菜单列表</h5>
						</div>
						<div class="pull-right">
							<a class="btn btn-primary" v-on:click="open($event)" data-href="/#/console/setting/menus/add" data-height="75%">添加菜单</a>
						</div>
					</div>
					<div class="console-form">
						<div class="mt8">
							<form>
								<table class="table table-hover">
									<thead>
										<tr>
											<th style="width:75px;">ID</th>
											<th>菜单名称</th>
											<th style="width:120px;">图标</th>
											<th style="width:120px;">模块</th>
											<th style="width:120px;">控制器</th>
											<th style="width:120px;">方法</th>
											<th style="width:120px;">附加参数</th>
											<th style="width:80px; text-align:center;">排序</th>
											<th style="width:80px; text-align:center;">状态</th>
											<th style="width:80px; text-align:center;">显示</th>
											<th style="width:160px; text-align:center;">编辑/操作</th>
										</tr>
									</thead>
									<tbody>
									 	<tr v-for="list in data.list">
											<td>{{list.id}}</td>
											<td><span v-html="list.delimiter"></span>{{list.name}}</td>
											<td>{{list.icon}}</td>
											<td>{{list.module}}</td>
											<td>{{list.controller}}</td>
											<td>{{list.action}}</td>
											<td>{{list.parameter}}</td>
											<td align='center'>{{list.sort}}</td>
											<td align='center'>{{list.status}}</td>
											<td align='center'>{{list.is_show}}</td>
											<td align='center'>
												<a ng-click="open(0,list.id)">添加子菜单</a>
												<span class="text-explode">|</span>
												<a v-on:click="open($event)" data-title="编辑菜单" v-bind:data-id="list.id"  data-height="800">编辑</a>
												<span class="text-explode">|</span>
												<a ng-click="delete(list.id)">删除</a>
											</td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>
<script>
import edit from './Edit.vue'
export default {
	name: 'console-settiv-menus-edit',
	data(){
	return {
		data:{},
		editStatus:false,
	}
	},
	components:{edit},
	methods:{
	  	getList:function(){
			layer.load();
		  	this.$http.get(config.data.console+'/setting/menus/index',{data:JSON.stringify(this.data)},{emulateJSON:true}).then(function(reslut){
		  		layer.closeAll('loading');
				this.data = reslut.body.data.data;
		  	})	
	  	},
	  	open:function(event){
			event.preventDefault();
		    event.stopPropagation();
		    let target = event.target

			var href    =  target.getAttribute("data-href");
		    var title   =  target.getAttribute('data-title');
		    var width   =  target.getAttribute('data-width');
		    var height  =  target.getAttribute('data-height');
		    var id 		=  target.getAttribute('data-id');

		    store.dispatch('settingMenusEdit',id);

		    title  = title  ? title : target.innerHTML; 
		    width  = width  ? width+'px' : '890px'; 
		    height = height ? height+'px' : '800px'; 

	  		this.$layer.iframe({
				content: {
				  content: edit, //传递的组件对象
				  parent: this,//当前的vue对象
				  data:['msg']//props
				},
				closeBtn: 1,
				area:[width, height],
				title:title
			  });
		},
	},
	created:function(){
		this.getList();
	},
	computed: {
		settingMenusList() {
			return store.state.settingMenusList;
		}	
	},
	watch: {
		settingMenusList(val) {
			this.getList();
			store.dispatch('settingMenusList',false);
		}
	}
}
</script>