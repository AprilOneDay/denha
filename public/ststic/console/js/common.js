$(function(){
    //导航固定高度
    $('.sidebar-inner').height($(document).height());
    $(window).resize(function() {
        $('.sidebar-inner').height($(document).height());
    });

    //导航展开下级菜单
    $('.sidebar-inner ul li').click(function(){
        //初始化
        $('.sidebar-inner ul li dl').css('display','none');
        $('.sidebar-inner ul li').each(function(){
            $(this).children().children().eq(0).attr('class','glyphicon glyphicon-triangle-right');
        });

        //展开/收缩
        var ico = $(this).children().children(':first').attr('class');
        if(ico == 'glyphicon glyphicon-triangle-right'){
           $(this).children().children(':first').attr('class','glyphicon glyphicon-triangle-bottom');
            console.log($(this).find('dl').css('display'));
            $(this).find('dl').css('display','block');
        }else{
            $(this).children().children(':first').attr('class','glyphicon glyphicon-triangle-right');
            $(this).find('dl').css('display','none');
        }
        
    })

    //收缩一级导航
    $('.sidebar-fold').click(function(){
        var width = $(this).width();
        if( width > 38 ){
            $('.sidebar-inner').width(38);
        }else{
            $('.sidebar-inner').width(180);
        }

    });

    $('select').each(function(){
        var data = $(this).attr('data-selected');
        if(data){
            $(this).val(data);
        }
    });

    //详情
    $('.btn-console-detail').click(function(){
    	var href = $(this).attr('data-href');
    	//iframe层
		layer.open({
		  type: 2,
		  title: '详情',
		  shadeClose: true,
		  shade: 0.8,
		  area: ['700px', '70%'],
		  content: [href] //iframe的url
		});
    })
})