<template>
	<div id="console-content-edit">
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
										<input type="text" v-model="data.title" placeholder="标题" required class="form-control">	
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span for="myDate">标签</span>
									</label>
									<div class="col-sm-8">
										<select v-model="data.tag" class="form-control w160">
											<option v-for="(value,key) in other.tag" v-bind:value="key" v-html="value"></option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span for="myDate">发布时间</span>
									</label>
									<div class="col-sm-8">
										<my-datepicker field="myDate"	placeholder="选择日期" v-model="data.created" format="yyyy/mm/dd" :backward="false" :no-today="false" :forward="false"></my-datepicker>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>摘要</span>
									</label>
									<div class="col-sm-8">
										<textarea  v-model="data.module" placeholder="输入摘要内容" class="form-control"></textarea>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-3">
										<span class="text-danger">*</span>
										<span>内容</span>
									</label>
									<div class="col-sm-8">
										<vue-html5-editor :content="data.content" :height="500" @change="updateData"></vue-html5-editor>
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
				<button type="submit" class="btn btn-primary" @click="comply">确定</button>
				<button type="button" class="btn btn-default" id="btn-close"@click="btnClose">取消</button>
			</div>
		</div>
	</div>
</template>
<style>
.vue-datepicker .vue-datepicker-panels{ width: auto; }
</style>
<script>
import myDatepicker from 'vue-datepicker-simple/datepicker-2.vue'; //引入对应的组件
export default {
  name: 'console-content-edit',
  components:{myDatepicker},
  data(){
    return {
 	 	data:{is_show:1,created:'',tag:1,content:''},
 	 	other:{},
        config: {
          initialFrameWidth: null,
          initialFrameHeight: 350
        },
    }
  },
  props:['msg'],
  created:function(){
 	this.getDetail();
  },
  mounted:function() {
  }, 
  methods: {
  	updateData:function(content){
  		this.data.content = content;
  	},
  	getDetail:function(){
  		this.$layer.loading();
	  	//获取菜单ID内容
		this.$http.get(config.data.console+'/article/index/edit?id='+store.state.UPDATE_EDIT_ID).then(function(reslut){
			if(reslut.body.data.data){
				this.data = reslut.body.data.data;
			}
  			this.other = reslut.body.data.other;
  		})
	  	this.$layer.closeAll('loading');
  	},
  	btnClose:function(){
  		this.clear();
    	this.$layer.closeAll();
    },
    comply: function () {
    	this.$layer.loading();
   		this.$http.post(config.data.console+'/article/index/edit',{data:JSON.stringify(this.data)}).then(function(reslut){
   			this.$layer.closeAll('loading');
   			let _this = this;
   			var data = reslut.body;
   			this.$layer.msg(data.msg);
   			if(data.status){
   				setTimeout(function(){_this.btnClose();},2000);
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