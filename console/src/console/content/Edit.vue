<template>
	<div id="console-setting-menus-edit">
		<div class="modal-content">
			<div class="modal-body clearfix">
				<div class="panel">
					<div class="panel-body">
						<form class="form-horizontal" role="form">
							<fieldset>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>标题</span>
									</label>
									<div class="col-sm-8">
										<input type="text" v-model="data.name" placeholder="标题" required class="form-control">	
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>上级菜单</span>
									</label>
									 <div class="col-sm-8">
										<select v-model="data.parentid" class="form-control w160">
											<option value="0">作为一级菜单</option>
											<option v-for="vo in menulist" v-bind:value="vo.id" v-html="vo.htmlname"></option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>发布时间</span>
									</label>
									<div class="col-sm-8">
										<input type="text" v-model="data.icon" placeholder="Icon图标" class="form-control">	
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>摘要</span>
									</label>
									<div class="col-sm-8">
										<input type="text" v-model="data.module" placeholder="控制器名称" class="form-control">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>内容</span>
									</label>
									<div class="col-sm-8">
										<div id="editor" type="text/plain" style="width:1024px;height:500px;"></div> 
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">显示状态：</label>
									<div class="radio-inline">
										<label>
											<input type="radio" v-model="data.is_show"  value="1"> 显示
										</label>
									</div>
									<div class="radio-inline">
										<label >
											<input type="radio" v-model="data.is_show"  value="0"> 隐藏
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
import '../../assets/ueditor/ueditor.config' 
import '../../assets/ueditor/ueditor.all'; 
import '../../assets/ueditor/lang/zh-cn/zh-cn'; 
export default {
  name: 'console-setting-menus-edit',
  data(){
    return {
      data:{is_show:1},
      menulist:{},
    }
  },
  props:['msg'],
  created:function(){
 	this.getDetail();
  },
  mounted:function() { 
	this.ue = UE.getEditor('editor',{ 
		BaseUrl: '', 
		UEDITOR_HOME_URL: 'assets/ueditor/', 
		// toolbars:[] 
	}); 
  }, 
  methods: {
  	getDetail:function(){
  		this.$layer.loading();
  		this.$http.get(config.data.console+'/setting/menus/tree_list',{data:JSON.stringify(this.data)}).then(function(reslut){
  			this.menulist = reslut.body.menulist;
	  	})
	  	//获取菜单ID内容
	  	if(store.state.settingMenusEditId){
			this.$http.get(config.data.console+'/setting/menus/edit?id='+store.state.settingMenusEditId).then(function(reslut){
	  			this.data = reslut.body.data.data;
	  		})
	  	}

	  	//定位父级菜单
	  	if(store.state.settingMenusEditparentId){
	  		this.data.parentid = store.state.settingMenusEditparentId;
	  	}

	  	this.$layer.closeAll('loading');
  	},
  	btnClose:function(){
  		this.clear();
    	this.$layer.closeAll();
    },
    comply: function () {
    	this.$layer.loading();
   		this.$http.post(config.data.console+'/setting/menus/edit',{data:JSON.stringify(this.data)}).then(function(reslut){
   			this.$layer.closeAll('loading');
   			var data = reslut.body;
   			this.$layer.msg(data.msg);
   			if(data.status){
   				this.btnClose();
   			}
   		})
    },
    clear:function(){
    	store.dispatch('settingMenusList',true);
    	store.dispatch('settingMenusEditId','');
    	store.dispatch('settingMenusEditparentId','')
    },
    
  },
}
</script>