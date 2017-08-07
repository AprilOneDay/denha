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
										<span>上级菜单</span>
									</label>
									<!-- <div class="col-sm-8">
										<select v-model="data.parentid" class="form-control w160">
											<option value="0">作为一级菜单</option>
											<option v-repeat="vo in menulist" value="" v-selected="vo.id == data.parentid" v-bind-html="vo.htmlname|trustAsHtml"></option>
										</select>
									</div> -->
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>菜单名称</span>
									</label>
									<div class="col-sm-8">
										<input type="text" v-model="data.name" placeholder="菜单名称" class="form-control">	
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>Icon图标</span>
									</label>
									<div class="col-sm-8">
										<input type="text" v-model="data.icon" placeholder="Icon图标" class="form-control">	
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>模块名称</span>
									</label>
									<div class="col-sm-8">
										<input type="text" v-model="data.module" placeholder="控制器名称" class="form-control">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>控制器名称</span>
									</label>
									<div class="col-sm-8">
										<input type="text" v-model="data.controller" placeholder="控制器名称" class="form-control">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>方法名称</span>
									</label>
									<div class="col-sm-8">
										<input type="text" v-model="data.action" placeholder="方法名称" class="form-control">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>附加参数</span>
									</label>
									<div class="col-sm-8">
										<input type="text" v-model="data.parameter" placeholder="附加参数" class="form-control">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>请求地址</span>
									</label>
									<div class="col-sm-8">
										<input type="text" v-model="data.url" placeholder="请求地址" class="form-control">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">是否显示：</label>
									<div class="radio-inline">
										<label>
											<input type="radio" v-model="data.is_show" value="1"> 是
										</label>
									</div>
									<div class="radio-inline">
										<label >
											<input type="radio" v-model="data.is_show" value="0"> 否
										</label>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">是否白名单：</label>
									<div class="radio-inline">
										<label>
											<input type="radio" v-model="data.is_white"  value="1"> 是
										</label>
									</div>
									<div class="radio-inline">
										<label >
											<input type="radio" v-model="data.is_white"  value="0"> 否
										</label>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">是否有效：</label>
									<div class="radio-inline">
										<label>
											<input type="radio" v-model="data.status"  value="1"> 是
										</label>
									</div>
									<div class="radio-inline">
										<label >
											<input type="radio" v-model="data.status"  value="0"> 否
										</label>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary" name="aaaaa" v-on:click="comply">确定</button>
				<button type="button" class="btn btn-default" id="btn-close">取消</button>
			</div>
		</div>
	</div>
</template>
<script>
export default {
  name: 'console-settiv-menus-edit',
  data(){
    return {
      data:{is_show:1,status:1,is_white:0},
    }
  },
  methods: {
    comply: function () {
   		var data  = this.data;
   		this.$http.jsonp('http://console.denha.loc'+'/setting/menus/add').then(function(reslut){
   			layer.msg('11111');
   			console.log(reslut);
   		})
    }
  }
}
</script>