<template>
	<div id="console-content-index-index">
		<div class="view-content-container" >
			<div class="row">
				<div class="col-sm-12">
					<div class="console-title console-title-border clearfix">
						<div class="pull-left">
							<h5>菜单列表</h5>
						</div>
						<div class="pull-right">
							<a class="btn btn-primary" v-on:click="open($event)" data-id="" data-height="750">添加文章</a>
						</div>
					</div>
					<form class="form-inline ng-pristine ng-valid">
                        <div class="form-group">
                    	  	<select class="form-control" v-model="data.param.tag">
                                <option value="0">选择类型</option>
                               <option v-for="(value,key) in other.tag" v-bind:value="key" v-html="value"></option>
                            </select>
                            <select class="form-control" v-model="data.param.field">
                                <option value="">请选择搜索条件</option>
                                <option value="title">标题</option>
                            </select>
                            <input type="text" class="form-control w120" placeholder="Search" v-model="data.param.keyword" >
                            <button type="button" class="btn btn-default" @click="search()">搜索</button>
                        </div>
                    </form>
					<div class="console-form">
						<div class="mt8">
							<form>
								<table class="table table-hover">
									<thead>
										<tr>
											<th style="width:75px;">ID</th>
											<th>标题</th>
											<th style="width:120px;">类型</th>
											<th style="width:120px;">发布时间</th>
											<th style="width:120px;">状态</th>
											<th style="width:160px; text-align:center;">编辑/操作</th>
										</tr>
									</thead>
									<tbody>
									 	<tr v-for="list in data.list">
											<td>{{list.id}}</td>
											<td>{{list.title}}</td>
											<td>{{other.tag[list.tag]}}</td>
											<td>{{list.created * 1000 | date('YMD')}}</td>
											<td>{{other.isShowCopy[list.is_show]}}</td>
											<td align='center'>
												<a v-on:click="open($event)" data-title="编辑文章" v-bind:data-id="list.id"  data-height="800">编辑</a>
												<span class="text-explode">|</span>
												<a ng-click="delete(list.id)">删除</a>
											</td>
										</tr>
									</tbody>
									<page :pages="data.pages" v-on:getPages="getPages"></page>
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
import page from '@/components/page/page.vue'
export default {
	name: 'console-content-index-index',
	components: {page,edit},
    data() {
      return {
      	data:{param:{}},
      	other:{},
      }
    },
	methods:{
	  	getList:function(){
			this.$layer.loading();
			let get = config.data.unserializeArray(this.data.param);
		  	this.$http.get(config.data.console+'/article/index'+get).then(function(reslut){
		  		this.$layer.closeAll('loading');
				this.data   = reslut.body.data.data;
				this.other  = reslut.body.data.other;
		  	})	
	  	},
	  	getPages:function(pageNo){
	  		this.data.param.pageNo = pageNo;
	  		this.getList();
	  	},
	  	search:function(){
	  		this.getList();
	  	},
	  	open:function(event){

		    var id 		 =  event.target.getAttribute('data-id');
		    var title 	 =  event.target.getAttribute('data-title');
		    var parentId =  event.target.getAttribute('data-parentId');

		  	id 		 ?  store.dispatch('UPDATE_EDIT_ID',id) : '';
		    title 	 = title ? title : event.target.innerHTML; 

	  		this.$layer.iframe({
				content: {
				  content: edit, //传递的组件对象
				  parent: this,//当前的vue对象
				  data:['msg']//props
				},
				closeBtn: 1,
				area:['1200px', '770px'],
				title:title
			  });
		},
	},
	mounted:function(){
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