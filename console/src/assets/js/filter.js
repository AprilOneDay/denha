import Vue from 'vue'
export default (function () {
  Vue.filter('date',function(value,type){
      if(!value){
        return '';
      }else{
        var dataTime ='',data = new Date();
        data.setTime(value); 
        var year   =  data.getFullYear();  
        var month  =  data.getMonth() + 1;  
        var day    =  data.getDate(); 
        var hour   =  data.getHours();
        var minute =  data.getMinutes();
        var second =  data.getSeconds();
        if(type == 'YMD'){
          dataTime =  year + '-'+ month + '-' + day;
        }else if(type == 'YMDHMS'){
          dataTime = year + '-'+month + '-' + day + ' ' +hour+ ':'+minute+':' +second;
        }else if(type == 'HMS'){
          dataTime = hour+':' + minute+':' + second;
        }else if(type == 'YM'){
          dataTime = year + '-' + month;
        }

        return dataTime;//将格式化后的字符串输出到前端显示
      }
  });
})()
