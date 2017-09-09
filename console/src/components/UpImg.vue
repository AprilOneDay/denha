<template>
   <div>
      <form>
        <input type="file" style="display:none;" @change="upImg" multiple="multiple">
        <a id='add' @click="add" class="btn btn-primary pull-left" style="margin-right:15px;" >添加图片</a>
        <!-- <a class="btn btn-primary pull-left" >上传图片</a> -->
      </form>
      <div class="clearfix"></div>
      <!--多图显示-->
      <div v-if="images.length > 0" style="margin-top:20px;">
         <ul>
            <li v-for="(value,key) in images">
              <img :src="value" class="pull-left" />
              <a href="javascript:;" style="position:relative;float:left;margin-left:-15px;" @click='delImage(key)'>
                <span class="glyphicon glyphicon-remove"></span>
              </a>
            </li>
            <div class="clearfix"></div>
          </ul>
      </div>
      <!--单图显示-->
      <div v-if="oneImg" style="margin-top:20px;">
          <img :src="oneImg" class="pull-left" style="width:150px;height:100px;" />
          <a href="javascript:;" style="position:relative;float:left;margin-left:-15px;" @click='delImage()'>
            <span class="glyphicon glyphicon-remove"></span>
          </a>
      </div>
   </div>
</template>
<style type="text/css">
  li img{padding: 10px; width: 10%; height: 70px; border: 1px solid #ccc;}
</style>
<script>
  export default {
    name: 'UpImg',
    data () {
      return {
        images:[],
        oneImg:'',
      }
    },
    props: {
      path:{
        type:String
      },
      maxNum: {
        type: Number
      },
      value: {
        default:false
      },
    },
    mounted:function() {
      console.log(this.oneImg);
      console.log(this.images);
    },
    methods: {
    	add:function(){
        //重置表单 支持同一个文件多次上传
        $('input[type=file]').wrap('<form>').closest('form').get(0).reset();
    		$('input[type=file]').trigger('click');
    	},
      upImg:function(e){
         var files = e.target.files || e.dataTransfer.files;
         if(this.maxNum  && this.maxNum < this.images.length +  files.length){
             return this.$layer.msg('最多只能传'+this.maxNum+'张图片');
         }
         this.upServerImg(files);
      },
      upServerImg:function(file){
          if(typeof FileReader==='undefined'){
              this.$layer.msg('您的浏览器不支持图片上传，请升级您的浏览器');
              return false;
          }
          let _this = this; 
          let leng  = file.length;
          for(let i=0;i<leng;i++){
              var reader = new FileReader();
              reader.readAsDataURL(file[i]); 
              reader.onload = function(e){ 
                //上传图片                                 
                _this.$http.post(config.data.console+'/common/upload/up_base64_img',{data:e.target.result,path:_this.path}).then(function(reslut){
                    if(reslut.body.status){
                      if(this.maxNum == 1){
                        _this.oneImg = reslut.body.data;
                      }else{
                        _this.images.push(reslut.body.data);
                      }
                    }
                })
              };                 
          }
      },
      //预览图片
      createImage:function(file) {
        if(typeof FileReader==='undefined'){
              this.$layer.msg('您的浏览器不支持图片上传，请升级您的浏览器');
              return false;
          }
          let _this = this; 
          var leng  = file.length;
          for(var i=0;i<leng;i++){
              var reader = new FileReader();
              reader.readAsDataURL(file[i]); 
              reader.onload =function(e){
                _this.images.push(e.target.result);                                    
              };                 
          }                      
      },
      //删除图片
      delImage:function(key = 0){
        if(this.maxNum == 1){
          this.oneImg = '';
        }
        else{
          if(this.images.length == 1){
            this.images = []
          }else if(key == 0 && this.images.length > 1){
            this.images.shift();
          }else{
            this.images.splice(1,key);
          }
        }
        console.log('1:'+ this.oneImg);
         console.log('2:'+ this.images);
      }
    },
    watch:{
      value:function(val){
        var type = Object.prototype.toString.call(val);
        console.log(val);
        if(type == '[object String]'){
          this.oneImg = val;
        }else{
          this.images = val;
        }
      },
      images:function(val) {
        console.log('1:'+val);
        this.$emit('input', val);
      },
      oneImg:function(val) {
        console.log('2:'+val);
        this.$emit('input', val);
      }
    },
  }
</script>