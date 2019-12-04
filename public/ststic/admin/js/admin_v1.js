
	var thisConsoleUrl 	= sessionStorage.getItem('thisConsoleUrl');
	var contentMainWidth 	= $('.content-main').width();
	var sidebarFoldIcoWidth = 38; //一级栏目图标宽度

	// 如果存在缓存url 则显示缓存url
	if(thisConsoleUrl){
		$('.J_iframe').attr('src',thisConsoleUrl);
	}

	//导航展开下级菜单
	$('.mian-menus').on('click','.product-nav-scene ul li',function(){
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

	//收缩一级导航
    $('.sidebar-fold').click(function() {
        var width = $(this).width();
        if (width > sidebarFoldIcoWidth) {
            $('.sidebar-inner').width(sidebarFoldIcoWidth);
            $('.content-main').width(contentMainWidth + 152);
        } else {
        	$('.content-main').width(contentMainWidth - 152);
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


    //一级高亮
    $('.sidebar-inner dd').click(function() {
        $('.sidebar-inner dd').each(function() {
            $(this).find('a').removeClass('cur');
        })
        $(this).find('a').addClass('cur');
    });

 	//二级高亮
	$('.mian-menus').on('click','.product-nav-scene dd',function(){
 		$('.product-nav-scene dd').each(function() {
            $(this).find('a').removeClass('cur');
        })
        $(this).find('a').addClass('cur');
	})

	//栏目点击事件
	$('.mian-menus').on('click','.btn-jump-main',function(){
		var id = $(this).attr('data-id');
		var url = $(this).attr('data-url');
		var bodyWidth = $('body').width();

		//记录url
		sessionStorage.setItem('thisConsoleUrl',url);
		//跳转
		window.iframe0.location.href = url;

		if(bodyWidth < 768){
			$('.sidebar-inner').hide(500);
		}
	})

	//ajax动态加载第二导航条
	$('.sec-list-show').click(function(){
		var id = $(this).attr('data-id');
		var name = $(this).attr('dh-name');
		var bodyWidth = $('body').width();
		$.post("/admin/index/index/menus",{id:id,level:2},function(result){
			result = result.replace(/(^\s*)|(\s*$)/g, "");
			if(typeof result == "undefined" || result == null || result == ""){
				$('.product-nav-scene').css('display','none');
				contentMainWidth = $('.content-main').width();
				if(bodyWidth >= 768 ){
					$('.content-main').css('width','90%');
				}
			}else{
				$('.product-nav-scene').find('.title label').text(name);
				$('.product-nav-scene').css('display','block');
				$('.product-nav-scene').find('ul').html(result);
				contentMainWidth = $('.content-main').width();
				if(bodyWidth >= 768 ){
					$('.content-main').css('width','80%');
				}
			}

			var sidebarFold = $('.sidebar-fold').width();
		},"html");
	})

	// wap版导航效果
	$('.btn-menus').click(function(){
		var menus = $('.sidebar-inner');
		if($('.sidebar-inner').css('display') == 'none'){
			$('.sidebar-inner').show(500);
		}else{
			$('.sidebar-inner').hide(500);
		}
	})

	$('.btn-menus-scene').click(function(){
		var menus = $('.product-nav-scene ul');
		if(menus.css('display') == 'none'){
			menus.show(500);
		}else{
			menus.hide(500);
		}
	})