// JavaScript Document
$(document).ready(function(){
	initDropList('site_main_class','site_sub_class');//初始化地址菜单
	$("#switchsystembar").css("cursor","pointer").click(function(){//点击事件,打开或者关闭左栏
		var buttonimg = $(this).find("img");
		var imgsrc = buttonimg.attr("src").toLowerCase();
		var title = $(this).attr("title");
		if (imgsrc != "images/butclose.gif")
		{
			buttonimg.attr("src","Images/butClose.gif");
			$(this).attr("title","关闭左栏");
			$("#left").css("display","");
			$("#main").width((document.documentElement.clientWidth-192)+"px");
		}
		else
		{
			buttonimg.attr("src","Images/butOpen.gif");
			$(this).attr("title","打开左栏")
			$("#left").css("display","none");
			$("#main").width((document.documentElement.clientWidth-12)+"px");
		}
	}).attr("title","关闭左栏")
	onload();
	window.onresize = onload;
})

function onload(){
	var theHeight, theWidth;
	theHeight = document.documentElement.clientHeight - 80;
	theWidth  = document.documentElement.clientWidth - 192;

	$("#main").width((theWidth > 0 ? theWidth : 0)+"px");
	$("#main").height((theHeight > 0 ? theHeight : 0)+"px");
	$("#left").height((theHeight > 0 ? theHeight : 0)+"px");
}




