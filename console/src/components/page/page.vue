<template>
    <tfoot>
      <tr>
          <td colspan="13">
            <div class="pull-right page-box" pages-data="pages" param-data="param" page-function="getPageList()">
                <div class="pagination-info">当前1 - 100/2500 条</div>
                <ul class="pagination" >
                  <li class="active"><a href="/frame/index.php?m=console&c=Credit&a=lists_all&pageNo=1">1</a></li>
                  <li ><a href="/frame/index.php?m=console&c=Credit&a=lists_all&pageNo=2">2</a></li>
                  <li ><a href="/frame/index.php?m=console&c=Credit&a=lists_all&pageNo=3">3</a></li>
                  <li ><a href="/frame/index.php?m=console&c=Credit&a=lists_all&pageNo=4">4</a></li>
                  <li ><a href="/frame/index.php?m=console&c=Credit&a=lists_all&pageNo=5">5</a></li>
                  <li><a href="/frame/index.php?m=console&c=Credit&a=lists_all&pageNo=2">›</a></li>
                  <li><a href="/frame/index.php?m=console&c=Credit&a=lists_all&pageNo=25">»</a></li>
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
    name: 'page',
    data () {
      return {}
    },
    props: {
      param: {
        type: Object
      },
    },
    mounted() {
      console.log(this.param)
    },
    methods: {},
  }
</script>
