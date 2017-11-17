/*login 代码开始*/
$(function(){
	// 登录服务器的点击事件
	$("#login_server_img").click(function(){
		$("#login_server_pull").css("display","block");
	});
	// 登录服务器 的下拉菜单
	$("#login_server_pull li").mouseover(function(){
		$(this).addClass("onhover");
	}).mouseout(function(){
		$(this).removeClass("onhover");
	}).mouseup(function(){
		$("#login_server_name").val($(this).text());
		$("#login_server_pull").css("display","none");
	});
	// inut 聚焦事件
	$("#login_server_name").focus(function(){
		$("#login_server_pull").css("display","none");
	});


	// 登录昵称：的点击事件
	$("#login_name_img").click(function(){
		$("#login_name_pull").css("display","block");
	});
	// 登录昵称： 的下拉菜单
	$("#login_name_pull li").mouseover(function(){
		$(this).addClass("onhover");
	}).mouseout(function(){
		$(this).removeClass("onhover");
	}).mouseup(function(){
		$("#login_name_name").val($(this).text());
		$("#login_name_pull").css("display","none");
	});
	// 登录昵称：聚焦事件
	$("#login_name_name").focus(function(){
		$("#login_name_pull").css("display","none");
	});

	// 坐席：的点击事件
	$("#login_style_img").click(function(){
		$("#login_style_pull").css("display","block");
	});
	// 坐席：： 的下拉菜单
	$("#login_style_pull li").mouseover(function(){
		$(this).addClass("onhover");
	}).mouseout(function(){
		$(this).removeClass("onhover");
	}).mouseup(function(){
		$("#login_style_name").val($(this).text());
		$("#login_style_pull").css("display","none");
	});
	// 坐席：聚焦事件
	$("#login_style_name").focus(function(){
		$("#login_style_pull").css("display","none");
	});

})

/*login 代码结束*/

/*startServer 代码开始*/
$(function(){
	$(".start_server_footer_left .checkbox_item .check_label").bind("click", function(){
		if($(this).hasClass("onSelect")){
			$(this).siblings("input").removeAttr("checked");
			$(this).removeClass("onSelect");
			
			//当前成员checkbox
			$("input[name='start_server_disturb']").removeAttr("checked");
			$("#all_member_check_label").removeClass("onSelect");
		}else{
			//$(this).siblings("input").prop("checked","checked");
			$(this).addClass("onSelect");
		}
	});
})
function openServer(){
	layui.use('layer', function(){ 
		var layer = layui.layer;
		layer.open({
			type : 0, 
			area: '400px',
			title : ['用户分配中', 'font-size:14px;'],
			content: '系统为您分配【兔兔】', //注意，如果str是object，那么需要字符拼接。
			btn: ['确定', '取消'],
			yes: function(index, layero){
   					 //按钮【按钮一】的回调
 		 	},
 		 	btn2: function(index, layero){
   				//按钮【按钮二】的回调
   				//return false 开启该代码可禁止点击该按钮关闭
			 },
		});
		layer.config({
		  skin: 'demo-class',

		});	
	});
}
/*startServer 代码结束*/

/*queue 代码开始*/
function openQueueList(){
	layui.use('layer', function(){ 
		var layer = layui.layer;
		layer.open({
			type : 0, 
			area: '500px',
			title : ['开始排队', 'font-size:14px;'],
			content: '【信雅达专用，请勿入】排队中，已等待时间：11秒您已排到最前，请耐心等待...', //注意，如果str是object，那么需要字符拼接。
			btn: ['取消'],
 		 	btn2: function(index, layero){
   				//按钮【按钮二】的回调
   				//return false 开启该代码可禁止点击该按钮关闭
			 },
		});
		layer.config({
		  skin: 'demo-class',

		});	
	});
}
/*queue 代码结束*/

/*meeting 代码开始*/
$(function(){
	$(".meet_show_record_radio .radio_label").click(function(){
		if($(this).hasClass("ongray")){

		}else{
			$(".meet_show_record_radio .radio_label").removeClass("ongray");
			$(".meet_show_record_radio .radio_label").find("input").removeAttr("checked");
			var $input = $(this).siblings("input");
			$input.prop("checked","checked");
			$(this).addClass("ongray");
			if($input.val() == "0") {//当选择时间为 0 天时
				
			} else if($input.val() == "1") {//选择时间为 1 天时
			
			}
		}
	});
	$("#meet_reset_video_yx .radio_label").click(function(){
		if($(this).hasClass("ongray")){

		}else{
			$("#meet_reset_video_yx .radio_label").removeClass("ongray");
			$("#meet_reset_video_yx .radio_label").find("input").removeAttr("checked");
			var $input = $(this).siblings("input");
			$input.prop("checked","checked");
			$(this).addClass("ongray");
			if($input.val() == "0") {//当选择时间为 0 天时
				
			} else if($input.val() == "1") {//选择时间为 1 天时
			
			}
		}
	});
	$("#showSendMsg").mouseover(function(){
		$(".meet_show_send_msg").css("display","block")
	}).mouseout(function(){
		$(".meet_show_send_msg").css("display","none")
	});
	$("#showRecordMsg").mouseover(function(){
		$(".meet_show_record").css("display","block");
	}).mouseout(function(){
		$(".meet_show_record").css("display","none");
	});
	$("#meet_reset_speaker .checkbox_item .check_label").bind("click", function(){
		if($(this).hasClass("onSelect")){
			$(this).siblings("input").removeAttr("checked");
			$(this).removeClass("onSelect");
			
			//当前成员checkbox
			$("input[name='is_no_vioce']").removeAttr("checked");
			$("#is_no_vioce_label").removeClass("onSelect");
		}else{
			//$(this).siblings("input").prop("checked","checked");
			$(this).addClass("onSelect");
		}
	});
})
function meetStartRecord(){
	$(".meet_show_record").css("display","none")
};
function meetSendMsg(){
	$(".meet_show_send_msg").css("display","none")
};

/*meeting 代码结束*/