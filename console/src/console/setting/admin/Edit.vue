<template>
	<div id="console-setting-admin-edit">
		<div class="modal-content">
			<div class="modal-body clearfix">
				<div class="panel">
					<div class="panel-body">
						<form class="form-horizontal" role="form">
							<fieldset>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>昵称</span>
									</label>
									<div class="col-sm-8">
										<input type="text" v-model="data.nickname" placeholder="昵称" class="form-control">	
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>用户名</span>
									</label>
									<div class="col-sm-8">
										<input type="text" v-model="data.username" placeholder="用户名" class="form-control">	
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>密码</span>
									</label>
									<div class="col-sm-8">
										<input type="password" v-model="data.password" placeholder="密码" class="form-control">	
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>所属分组</span>	
									</label>
									<div class="col-sm-8">
										<input type="text" v-model="data.group" placeholder="所属分组" class="form-control">
									</div>
								</div>

								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>手机号</span>	
									</label>
									<div class="col-sm-8">
										<input type="text" v-model="data.mobile" placeholder="手机号" class="form-control">
									</div>
								</div>
								
								<div class="form-group">
									<label class="control-label col-sm-3">状态：</label>
									<div class="radio-inline">
										<label>
											<input type="radio" v-model="data.status" value="1"> 开启
										</label>
									</div>
									<div class="radio-inline">
										<label >
											<input type="radio" v-model="data.status" value="0"> 关闭
										</label>
									</div>
								</div>
								
							</fieldset>
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary" v-on:click="comply">确定</button>
				<button type="button" class="btn btn-default" id="btn-close" v-on:click="btnClose">取消</button>
			</div>
		</div>
	</div>
</template>
<script>
export default {
  name: 'console-settiv-admin-edit',
  data(){
    return {
      data:{status:1,password:'123456'},
      menulist:{},
    }
  },
  props:['msg'],
  created:function(){
 	this.getDetail();
  },
  methods: {
  	getDetail:function(){
  		this.$layer.loading();
	  	//获取菜单ID内容
	  	if(store.state.UPDATE_EDIT_ID){
			this.$http.get(config.data.console+'/setting/admin/edit?id='+store.state.UPDATE_EDIT_ID,{},{emulateJSON:true}).then(function(reslut){
	  			this.data = reslut.body.data.data;
	  		})
	  	}

	  	this.$layer.closeAll('loading');
  	},
  	btnClose:function(){
  		this.clear();
    	this.$layer.closeAll();
    },
    comply: function () {
    	this.$layer.loading();
   		this.$http.post(config.data.console+'/setting/admin/edit',{data:JSON.stringify(this.data)},{emulateJSON:true}).then(function(reslut){
   			this.$layer.closeAll('loading');
   			var data = reslut.body;
   			this.$layer.msg(data.msg);
   			if(data.status){
   				this.btnClose();
   			}
   		})
    },
    clear:function(){
    	store.dispatch('UPDATE_LIST',true);
    	store.dispatch('UPDATE_EDIT_ID','');
    },
    
  },
}
</script>