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
									<div class="col-sm-8">
										<select v-model="g.parentid" class="form-control w160">
											<option value="0">作为一级菜单</option>
											<option v-repeat="vo in menulist" value="" v-selected="vo.id == g.parentid" v-bind-html="vo.htmlname|trustAsHtml"></option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>菜单名称</span>
									</label>
									<div class="col-sm-8">
										<input type="text" v-model="g.name" placeholder="菜单名称" class="form-control">	
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>Icon图标</span>
									</label>
									<div class="col-sm-8">
										<input type="text" v-model="g.icon" placeholder="Icon图标" class="form-control">	
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>模块名称</span>
									</label>
									<div class="col-sm-8">
										<input type="text" v-model="g.module" placeholder="控制器名称" class="form-control">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>控制器名称</span>
									</label>
									<div class="col-sm-8">
										<input type="text" v-model="g.controller" placeholder="控制器名称" class="form-control">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>方法名称</span>
									</label>
									<div class="col-sm-8">
										<input type="text" v-model="g.action" placeholder="方法名称" class="form-control">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>附加参数</span>
									</label>
									<div class="col-sm-8">
										<input type="text" v-model="g.parameter" placeholder="附加参数" class="form-control">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>请求地址</span>
									</label>
									<div class="col-sm-8">
										<input type="text" v-model="g.url" placeholder="请求地址" class="form-control">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">是否显示：</label>
									<div class="radio-inline">
										<label>
											<input type="radio" v-model="g.is_show" v-check="g.is_show" v-value="1"> 是
										</label>
									</div>
									<div class="radio-inline">
										<label >
											<input type="radio" v-model="g.is_show" v-check="!g.is_show" v-value="0"> 否
										</label>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">是否白名单：</label>
									<div class="radio-inline">
										<label>
											<input type="radio" v-model="g.is_white" v-check="g.is_white" v-value="1"> 是
										</label>
									</div>
									<div class="radio-inline">
										<label >
											<input type="radio" v-model="g.is_white" v-check="!g.is_white" v-value="0"> 否
										</label>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">是否有效：</label>
									<div class="radio-inline">
										<label>
											<input type="radio" v-model="g.status" v-check="g.status" v-value="1"> 是
										</label>
									</div>
									<div class="radio-inline">
										<label >
											<input type="radio" v-model="g.status" v-check="!g.status" v-value="0"> 否
										</label>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary" v-on:click="greet">确定</button>
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
      g:{},
      msessage:'hello world',
      counter:0
    }
  },
  methods: {
    greet: function (event) {
      // `this` 在方法里指当前 Vue 实例
      alert('Hello ' + this.name + '!')
      // `event` 是原生 DOM 事件
      if (event) {
        alert(event.target.tagName)
      }
    }
  }
}
</script>