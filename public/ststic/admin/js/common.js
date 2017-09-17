$(function() {

    init();
    $(window).resize(function() {
       init();
    });

    //监听product-nav-scene的宽度变化
    $(".product-nav-scene").bind("DOMNodeInserted",function(e){
        $('.content-main').width(($(document).width() - $('.sidebar-inner').width() - $('.product-nav-scene').width()) );
        return true;
    })

    //主页容器固定高宽
    function init(){
        $('.sidebar-inner').height($(document).height() - $('.border-top').height() - 2);
        $('.product-nav-scene').height($(document).height() - $('.border-top').height() - 2)
        $('.content-main').height($(document).height() - $('.border-top').height() - 2);
        if($('.product-nav-scene').css('display') == 'block'){
            $('.content-main').width(($(document).width() - $('.sidebar-inner').width() - $('.product-nav-scene').width()) );
        }else{
            $('.content-main').width(($(document).width() - $('.sidebar-inner').width()) );
        }
    }

    //收缩一级导航
    $('.sidebar-fold').click(function() {
        var width = $(this).width();
        if (width > 38) {
            $('.sidebar-inner').width(38);
        } else {
            $('.sidebar-inner').width(180);
        }

    });

    //导航展开下级菜单
    $('.sidebar-inner ul li').click(function() {
        //初始化
        $('.sidebar-inner ul li dl').css('display', 'none');
        $('.sidebar-inner ul li').each(function() {
            if ($(this).children().children().eq(0).attr('class') == 'glyphicon glyphicon-triangle-bottom') {
                $(this).children().children().eq(0).attr('class', 'glyphicon glyphicon-triangle-right');
            }
        });

        //展开/收缩
        var ico = $(this).children().children(':first').attr('class');
        if (ico == 'glyphicon glyphicon-triangle-right') {
            $(this).children().children(':first').attr('class', 'glyphicon glyphicon-triangle-bottom');
            $(this).find('dl').css('display', 'block');
        } else if (ico == 'glyphicon glyphicon-triangle-bottom') {
            $(this).children().children(':first').attr('class', 'glyphicon glyphicon-triangle-right');
            $(this).find('dl').css('display', 'none');
        }

    })

    //导航展开下级菜单
    $('.product-nav-scene ul li').click(function() {
        //初始化
        $('.product-nav-scene ul li dl').css('display', 'none');
        $('.product-nav-scene ul li').each(function() {
            if ($(this).children().children().eq(0).attr('class') == 'glyphicon glyphicon-triangle-bottom') {
                $(this).children().children().eq(0).attr('class', 'glyphicon glyphicon-triangle-right');
            }
        });

        //展开/收缩
        var ico = $(this).children().children(':first').attr('class');
        if (ico == 'glyphicon glyphicon-triangle-right') {
            $(this).children().children(':first').attr('class', 'glyphicon glyphicon-triangle-bottom');
            $(this).find('dl').css('display', 'block');
        } else if (ico == 'glyphicon glyphicon-triangle-bottom') {
            $(this).children().children(':first').attr('class', 'glyphicon glyphicon-triangle-right');
            $(this).find('dl').css('display', 'none');
        }

    })

    //一级高亮
    $('.sidebar-inner dd').click(function() {
        $('.sidebar-inner dd').each(function() {
            $(this).find('a').removeClass();
        })
        $(this).find('a').addClass('cur');
    });

    //二级高亮
    $('.product-nav-scene dd').click(function() {
        $('.product-nav-scene dd').each(function() {
            $(this).find('a').removeClass();
        })
        $(this).find('a').addClass('cur');
    });

    //绑定初试信息
    $('select').each(function() {
        var data = $(this).attr('data-selected');
        if (data) {
            $(this).val(data);
        }
    });

    //绑定radio值
    $(".radio").each(function(){
        var data = $(this).attr('data-radio');
        $(this).find('input[type=radio]').each(function(){
            if($(this).attr('value') == data){
                $(this).attr("checked","checked");
            }
        })
    })

   //打开弹出
    $('.btn-open').click(function() {
        var href = $(this).attr('data-href');
        var title = $(this).attr('data-title');
        var width = $(this).attr('data-width');
        var height = $(this).attr('data-height');

        if (!title) {
            title = $(this).text();
        }
        if (!width) {
            width = '890px';
        }
        if (!height) {
            height = '80%';
        }
        if (!href) {
            layer.msg('请设置data-href的值');
            return false;
        }
    
        //iframe层
        layer.open({
            type: 2,
            title: title,
            shadeClose: true,
            shade: 0.8,
            fixed:true,
            area: [width, height],
            content: [href] //iframe的url
        });
    })

    //提交信息
    $('.btn-comply').click(function(){
        var a= $('.form-horizontal').serializeArray();
        var url = $('.form-horizontal').attr('action');
        $.post(url,a,function(reslut){
            layer.msg(reslut.msg);
            if(reslut.status){
                parent.location.reload();
                var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
                parent.layer.close(index);
            }
        })
    })

    //get提交
    $('.btn-ajax-get').click(function(){
        var url = $(this).attr('data-url');
        $.get(url,function(reslut){
            layer.msg(reslut.msg);
            if(reslut.status){
                location.reload();
            }
        },"json");
    })

    //渲染图片上传插件
    $('.btn-ablum').each(function(){
        var _this   = this;
        var name    = $(this).attr('data-name');
        var maxNum  = Math.max($(this).attr('data-max'),1);
        var path    = $(this).attr('data-path'); 
        var content = '<input type="file" style="display:none;" name="'+name+'" multiple="multiple"><div class="img-list"><ul></ul></div>';
        if(maxNum == 1){
            var ablum   = '';
        }else{
            var ablum   = new Array();
        }
       
        $(this).parent().append(content);
        //上传
        $(this).click(function(){
            $('input[type=file]').wrap('<form>').closest('form').get(0).reset();
            $('input[type=file]').trigger('click');
        })

        //转换图片url
        $('input[name='+name+']').change(function(e){
            var imgLength = $('img-list').find('img').length;
            console.log(imgLength);
            var files = e.target.files || e.dataTransfer.files;
            if(maxNum  && maxNum < files.length + imgLength){
                 return layer.msg('最多只能传'+maxNum+'张图片');
            }

            for(var i=0;i<files.length;i++){
                console.log(files[i]);
                var reader = new FileReader();
                reader.readAsDataURL(files[i]); 
                reader.onload = function(e){
                    var content = '<li><img src="'+e.target.result+'" width="150" height="100"> <a style="position:relative;float:left;margin-left:-15px;"><i class="glyphicon glyphicon-remove"></i></a></li>';
                    $('img-list ul').append(content);
                } 
            }

        })
    })

    //渲染编辑器
    $('.ue-editor').each(function(){
        /*if($(this).index() == 0){
            $.getScript("/vendor/ueditor/ueditor.config.js"); 
            $.getScript("/vendor/ueditor/ueditor.all.js"); 
        }*/
        var id = $(this).attr('id');
        UE.getEditor(id);
    })

    //渲染时间插件
    $('.data-time').each(function(){
        var id      = $(this).attr('id');
        var time    = $(this).val();                    //int
        var min     = $(this).attr('data-min');         // string int
        var max     = $(this).attr('data-max');         // string int
        var format    = $(this).attr('data-format');
        var type    = $(this).attr('data-type');        //year month date time datetime


        if(!format){ format  = 'yyyy-MM-dd'; }
        if(!min){ min = '1900-1-1';}
        if(!max){ max = '2099-12-31';}
        if(!type){ type = 'date';}

        laydate.render({
          elem: '#'+id, //指定元素
          value:new Date(time),
          format:format,
          type:type,
          min:min,
          max:max,
        });
    })

    //关闭弹窗
    $('#btn-close').click(function(){
        var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
        parent.layer.close(index);
    });
})
