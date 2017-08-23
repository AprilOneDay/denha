<template>
   <div>
      <input type="file" style="display:none;" @change="upImg" multiple="multiple" >
      <p id='add' @click="add" class="form-control-static" >添加图片</p>
      <div v-if="images.length > 0">
         <ul>
            <li v-for="(value,key) in images">
                <img :src="value" @click='delImage(key)' class="pull-left" />
               <a href="javascript:;" style="position:absolute;float:left;margin-left:-15px;" @click='delImage(key)'>
                 
                  <span class="glyphicon glyphicon-remove"></span>
              </a>
            </li>
            <div class="clearfix"></div>
          </ul>
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
      }
    },
    props: {
      maxNum: {
        type: Number
      },
    },
    mounted:function() {
    },
    methods: {
    	add:function(){
    		$('input[type=file]').trigger('click');
    	},
      upImg:function(e){
         var files = e.target.files || e.dataTransfer.files;
         if(this.maxNum && this.maxNum >= this.images.length +  files.length){
            this.createImage(files);
         }else{
            return this.$layer.msg('最多只能传'+this.maxNum+'张图片');
         }

         console.log(this.images.length);
         console.log(this.maxNum);
         console.log(files.length);
      },
      //预览图片
      createImage:function(file) {
          if(typeof FileReader==='undefined'){
              alert('您的浏览器不支持图片上传，请升级您的浏览器');
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
          console.log(_this.images);                   
      },
      //删除图片
      delImage:function(key){
        this.images.shift(key);
      }
    },
    watch:{},
  }
</script>