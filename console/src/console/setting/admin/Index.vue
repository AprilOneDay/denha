<template>
	<div id="console-admin-index">
		<div class="view-content-container" >
			<div class="row">
				<div class="col-sm-12">
					<div class="console-title console-title-border clearfix">
						<div class="pull-left">
							<h5>管理员列表</h5>
						</div>
						<div class="pull-right">
							<a class="btn btn-primary" @click="open($event)" data-id="" data-height="750">添加管理员</a>
						</div>
					</div>
					<div class="console-form">
						<div class="mt8">
							<form>
								<table class="table table-hover">
									<thead>
										<tr>
											<th >ID</th>
											<th>用户名</th>
											<th>昵称</th>
											<th>管理组</th>
											<th>手机号</th>
											<th>创建时间</th>
											<th>登录时间</th>
											<th>状态</th>
											<th style="text-align:center;">编辑/操作</th>
										</tr>
									</thead>
									<tbody>
									 	<tr v-for="list in data.list">
											<td>{{list.id}}</td>
											<td>{{list.username}}</td>
											<td>{{list.nickname}}</td>
											<td>{{list.group}}</td>
											<td>{{list.mobile}}</td>
											<td>{{list.created * 1000 | date('YMD')}}</td>
											<td>{{list.login_time * 1000 | date('YMD')}}</td>
											<td>
												<p style="color:green" v-if="list.status">{{other.statusCopy[list.status]}}</p>
												<p style="color:red" v-else>{{other.statusCopy[list.status]}}</p>
											</td>
											<td align='center'>
												<a @click="open($event)" data-title="编辑菜单" v-bind:data-id="list.id"  data-height="800">编辑</a>
												<span class="text-explode">|</span>
												<a @click="del(list.id)">删除</a>
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
	name: 'console-settiv-admin-index',
	data(){
		return {
			data:{},
			other:{},
		}
	},
	components:{edit},
	methods:{
	  	getList:function(){
			this.$layer.loading();
		  	this.$http.get(config.data.console+'/setting/admin',{},{emulateJSON:true}).then(function(reslut){
		  		this.$layer.closeAll('loading');
				this.data  = reslut.body.data.data;
				this.other = reslut.body.data.other;
		  	})	
	  	},
	  	del:function(id){
		  	let self = this;
			this.$layer.confirm('确定删除该用户', {
			  btn: ['确定','取消'] //按钮
			}, function(){
	 			self.$http.post(config.data.console+'/setting/admin/delete',{id:id},{emulateJSON:true}).then(function(reslut){
	 				this.$layer.closeAll();
			  		this.$layer.alert(reslut.body.msg);
			  		if(reslut.body.status){
			  			this.getList();
			  		}
			  	})
			});
	  	},
	  	open:function(event){
		    var id 		 =  event.target.getAttribute('data-id');
		    var title 	 =  event.target.getAttribute('data-title');

		    id 		 ?  store.dispatch('UPDATE_EDIT_ID',id) : '';
		    title 	 = title ? title : event.target.innerHTML; 

	  		this.$layer.iframe({
				content: {
				  content: edit, //传递的组件对象
				  parent: this,//当前的vue对象
				  data:['msg']//props
				},
				closeBtn: 1,
				area:['490px', '490px'],
				title:title
			  });
		},
	},
	created:function(){
		this.getList();
	},
	computed: {
		UPDATE_LIST() {
			return store.state.UPDATE_LIST;
		}	
	},
	watch: {
		UPDATE_LIST(val) {
			this.getList();
			store.dispatch('UPDATE_LIST',false);
		}
	}
}
</script>