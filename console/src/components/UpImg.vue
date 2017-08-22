<template>
   <div>
	 	<input type="file" style="display:none;">
    	<p id='add' @click="add" class="form-control-static">添加图片</p>
   </div>
</template>
<script>
  export default {
    name: 'UpImg',
    data () {
      return {
        data:{},
      }
    },
    props: {
      pages: {
        type: Object
      },
    },
    mounted:function() {
    },
    methods: {
    	add:function(){
    		$('input[type=file]').trigger('click');
    	},
    },
    watch:{},
  }
</script>