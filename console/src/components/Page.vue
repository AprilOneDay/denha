<template>
    <tfoot>
      <tr>
          <td colspan="13">
            <div class="pull-right page-box" >
                <div class="pagination-info">当前{{data.pageNo}} - {{data.pageSize}}/{{data.pageSize * data.allPage}} 条</div>
                <ul class="pagination" >
                  <li :class="{active:data.pageNo == vo}" v-for="vo in data.pageList">
                    <a href="javascript:;" @click="getPages(vo)">{{vo}}</a>
                  </li>
                </ul>
                <span class="pagination-goto">
                  <input type="text" class="form-control w40">
                  <button class="btn btn-default" type="button" >GO</button>
                </span>
            </div>
          </td>
      </tr>
    </tfoot>
</template>
<script>
  export default {
    name: 'Page',
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
      getPages:function(pageNo){
        //this.pages.pageNo = pageNo;
        this.$emit('getPages',pageNo);
      
      }
    },
    watch:{
      pages(val){
        this.data = val;
      }
    },
  }
</script>
