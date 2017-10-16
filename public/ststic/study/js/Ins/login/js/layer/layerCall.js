//弹出层调用

$(document).ready(function(){

	//搜索查询
	$(".search-link").on("click",function(){
		layer.open({
			type: 2,
			title: false,
			shadeClose: false,
			closeBtn: false,
			shade: 0.4,
			area: ["430px","275px"],
			content: "_search.html",
			skin: "skin01"
		}); 
	});

	//投诉办理
	$(".handle-link").on("click",function(){
		layer.open({
			type: 2,
			title: false,
			shadeClose: false,
			closeBtn: false,
			shade: 0.4,
			area: ["825px","100%"],
			offset: "rb",
			content: "_handle.html"
		}); 
	});

	//投诉归档
	$(".archive-link").on("click",function(){
			layer.open({
			type: 2,
			title: false,
			shadeClose: false,
			closeBtn: false,
			shade: 0.4,
			area: ["825px","100%"],
			offset: "rb",
			content: "_archive.html"
		}); 
	});

	//投诉录入
	$(".entry-link").on("click",function(){
		parent.layer.open({
			type: 2,
			title: false,
			shadeClose: false,
			closeBtn: false,
			shade: 0.4,
			area: ["825px","100%"],
			offset: "rb",
			content: "_entry.html"
		}); 
	});

	//修改密码
	$(".passwd-change").on("click",function(){
    	layer.open({
        	type: 2,
			title: false,
			shadeClose: false,
			closeBtn: false,
			shade: 0.4,
			area: ["495px","280px"],
			content: "html/_passwd.html",
			skin: "skin01"
        });
	});

	//修改用户信息
	$(".user-change").on("click",function(){
    	layer.open({
        	type: 2,
			title: false,
			shadeClose: false,
			closeBtn: false,
			shade: 0.4,
			area: ["495px","500px"],
			content: "_cuser.html",
			skin: "skin01"
        });
	});

	//新增用户信息
	$(".user-add").on("click",function(){
    	layer.open({
        	type: 2,
			title: false,
			shadeClose: false,
			closeBtn: false,
			shade: 0.4,
			area: ["495px","500px"],
			content: "_auser.html",
			skin: "skin01"
        });
	});

	//投诉指派状态1
	$(".assign-one").on("click",function(){
		layer.open({
			type: 2,
			title: false,
			shadeClose: false,
			closeBtn: false,
			shade: 0.4,
			area: ["825px","100%"],
			offset: "rb",
			content: "_assign_one.html"
		}); 
	});
	//投诉指派状态2
	$(".assign-two").on("click",function(){
		layer.open({
			type: 2,
			title: false,
			shadeClose: false,
			closeBtn: false,
			shade: 0.4,
			area: ["825px","100%"],
			offset: "rb",
			content: "_assign_two.html"
		}); 
	});
	//投诉指派状态3
	$(".assign-three").on("click",function(){
		layer.open({
			type: 2,
			title: false,
			shadeClose: false,
			closeBtn: false,
			shade: 0.4,
			area: ["825px","100%"],
			offset: "rb",
			content: "_assign_three.html"
		}); 
	});

})