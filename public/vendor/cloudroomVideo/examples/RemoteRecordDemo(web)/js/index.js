/*login 代码开始*/
$(function(){
	// 登录服务器的点击事件
	$("#login_server_img").click(function(){
		if($("#login_server_pull").css("display") =="block"){
			$("#login_server_pull").css("display","none");
		}else{
			$("#login_server_pull").css("display","block");
		}
	});
	// 登录服务器 的下拉菜单
	$("#login_server_pull li").mouseover(function(){
		$(this).addClass("onhover");
	}).mouseout(function(){
		$(this).removeClass("onhover");
	}).mouseup(function(){
		$("#login_server_box").val($(this).text());
		$("#login_server_pull").css("display","none");
	});
	// inut 聚焦事件
	$("#login_server_box").focus(function(){
		$("#login_server_pull").css("display","none");
	});

	// 选择服务：的点击事件
	$("#login_name_img").click(function(){
		if($("#login_name_pull").css("display") =="block"){
			$("#login_name_pull").css("display","none");
		}else{
			$("#login_name_pull").css("display","block");
		}
	});
	// 登录昵称： 的下拉菜单
	$("#login_name_pull li").mouseover(function(){
		$(this).addClass("onhover");
	}).mouseout(function(){
		$(this).removeClass("onhover");
	}).mouseup(function(){
		$("#login_server_name").val($(this).text());
		$("#login_name_pull").css("display","none");
	});
	// 登录昵称：聚焦事件
	$("#login_name_name").focus(function(){
		$("#login_name_pull").css("display","none");
	});

	// 账号：的点击事件
	// $("#login_style_img").click(function(){
	// 	$("#login_style_pull").css("display","block");
	// });
	// // 坐席：： 的下拉菜单
	// $("#login_style_pull li").mouseover(function(){
	// 	$(this).addClass("onhover");
	// }).mouseout(function(){
	// 	$(this).removeClass("onhover");
	// }).mouseup(function(){
	// 	$("#login_style_name").val($(this).text());
	// 	$("#login_style_pull").css("display","none");
	// });
	// // 坐席：聚焦事件
	// $("#login_style_name").focus(function(){
	// 	$("#login_style_pull").css("display","none");
	// });

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
			closeBtn: 0,
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
			closeBtn: 0,
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


/**
 * 会话js代码开始
 **/
 // 身份证正反面切换
function switchSfz(){
	if($(".detail_left_sfzpng img").attr("src") == "image/1.png"){
		$(".detail_left_sfzpng img").attr("src","image/2.png");
	}else{
		$(".detail_left_sfzpng img").attr("src", "image/1.png");
	}
}
// 设置录制的信息
var  videoOperateBtn = 	"关闭";
var  micOperateBtn = "关闭";
var g_type_size_mask = '<option value="8" selected="true">640*360</option>' 
				+ '<option value="10">848*480</option>' 
				+ '<option value="12">1280*720</option>'
				+ '<option value="13">1920*1080</option>';			
function openSetVideoPanel(){
	if(g_meeting)
	{
		$(".meeting_containt").css("display","none")
	}
	var str1 =  '<div class="full_page_msg3">'
					+'<span class="msg_label3">分辨率：</span>'
					+ '<select id="recordWH">'
			  			+'<option value ="1" selected="true">360P(640*360)</option>'
			  			+'<option value ="2">480P(848*480)</option>'
			  			+'<option value="3">720P(1280*720)</option>'
			  			+'<option value="4">1080P(1920*1080)</option>'
			  			+'<option value ="5">480P(640*480)</option>'
					+'</select>'
				+'</div>'
				+'<div class="full_page_msg4">'
					+'<span class="msg_label4">码率(kbps)：</span>'
					+'<input id="bitRate" type="text" name="malv" value="350">'
				+'</div>'	
				+'<div class="full_page_msg5">'
					+'<span class="msg_label5">录制内容类型：</span>'
					+'<input type="radio" onclick="choseDataType(\'0\')" name="recDataType" class="recDataType" value="7" checked="checked"/><label>音频+视频</label>'
					+'<input type="radio" onclick="choseDataType(\'1\')" name="recDataType" class="recDataType" value="3"/><label>纯音频</label>'
				+'</div>'
				+'<div class="full_page_msg6">'
					+'<span class="msg_label6">上传限制(KB/s)：</span>'
					+'<input id="fuRate" type="text" name="malv" value="100">'
				+'</div>'
				+'<div class="full_page_msg7">'
					+'<span class="msg_label7">帧率(取值6~20)：</span>'
					+'<input id="frameRate" type="text" name="frameRate" value="15">'
				+'</div>'
				+'<div class="full_page_msg8">'
					+'<span class="msg_label8">录制上传方式：</span>'
					+'<input type="radio" onclick="choseUpType(\'0\')" name="recUpType" class="recUpType" value="0" checked="checked" /><label>手动上传</label>'
					+'<input type="radio" onclick="choseUpType(\'1\')" name="recUpType" class="recUpType" value="1"  /><label>边录边传</label>'
				+'</div>'
				// +'<div class="full_page_button" style="display: block;">'
				// 	+'<button class="full_page_submit2" onclick="setSubmit()">确定</button>'
				// 	+'<button class="full_page_cancle2" onclick="setCancle()">取消</button>'
				// +'</div>';
	var str2 = '<div id="meet_reset_camera" class="meet_video_reset" style="margin-top: 12px;">'
					+'<label class="meet_label">摄像头</label>'
					+'<select id="video_select">'
						// +'<option>摄像头</option>'
					+'</select>'
					+'<button id="video_operate_btn">'+ videoOperateBtn +'</button>'
				+'</div>'
				+'<div id="meet_reset_speaker" class="meet_video_reset">'
					+'<label class="meet_label">扬声器</label>'
					+'<select id="spker_select">'
						// +'<option>扬声器</option>'
					+'</select>'
				+'</div>'
				+'<div id="meet_reset_micraphone" class="meet_video_reset">'
					+'<label class="meet_label">麦克风</label>'
					+'<select id="mic_select">'
						// +'<option>麦克风</option>'
					+'</select>'
					+'<button id="mic_operate_btn">'+ micOperateBtn +'</button>'
				+'</div>'
				+'<div id="meet_reset_video_yx" class="meet_video_reset">'
					+'<p class="radio_contain">'
					+'<input type="radio" onclick="choseSizeType(\'0\')" name="videoSizeType" class="radio_label" value="0" checked="checked" />'
					+'<span class="fs14_col48_verm_disib">16:9</span>'
					+'<input type="radio" onclick="choseSizeType(\'1\')" name="videoSizeType" class="radio_label" value="1"  />'
					+'<span class="fs14_col48_verm_disib">4:3</span>'
					+'</p>'
				+'</div>'
				+'<div id="meet_reset_video_size" class="meet_video_reset">'
					+'<label class="meet_label">视频尺寸</label>'
					+'<select id="size_select">'+ g_type_size_mask +'</select>'
				+'</div>'
				+'<div id="meet_reset_video_zl" class="meet_video_reset">'
					+'<label class="meet_label">视频帧率</label>'
					+'<input id="frame_input" type="text" name="meet_reset_video_zl" value="20">'
				+'</div>'
				+'<div id="meet_reset_video_yx" class="meet_video_reset">'
					+'<p class="radio_contain">'
						+'<input onclick="choseMeetYx(\'0\')" class="radio_label" type="radio" name="meet_yx" checked="checked" value="0"/>'
						+'<span class="fs14_col48_verm_disib">视频质量优先</span>'
						+'<input onclick="choseMeetYx(\'1\')" class="radio_label" type="radio" name="meet_yx" value="1"/>'
						+'<span class="fs14_col48_verm_disib">视频流畅优先</span>'
					+'</p>'
				+'</div>'
	layui.use('layer', function(){ 
		var layer = layui.layer;
		layer.tab({
			// closeBtn: 0,
			shadeClose: true,
			// skin: '#',
			closeBtn: 0,
			area: ['520px', '520px'],
			tab: [{
				    title: '录制设置', 
				    content: str1,
				 }, {
				   title: '视频设置', 
				   content: str2,
				 }],
			end:function()
			  {
				if(g_meeting)
				{
					$(".meeting_containt").css("display","block");
					if(!g_third_id){
						if(g_call_video !== undefined && g_me_video !== undefined)
						{
							g_call_video.setVideo(g_call_user_id);
							g_me_video.setVideo(g_seat_id);
						}
					}else{
						if(g_callObj !== undefined && g_seat_video !== undefined && g_third_video !== undefined)
						{
							g_callObj.setVideo(g_call_user_id);
							g_seat_video.setVideo(g_seat_id);
							g_third_video.setVideo(g_third_id);
						}
					}
				}

			  },
			btn: ['确定', '取消'],
			yes: function(index){
					g_FURate = parseInt($("#fuRate").val())*1024;
					g_bitRate = parseInt($("#bitRate").val()) * 1000;
					g_frameRate = parseInt($("#frameRate").val());
					g_recDataType = $("input[name='recDataType']:checked").val();
					g_isUploadOnRecording = $("input[name='recUpType']:checked").val();
					$("#recordWH").val(g_video_recordwh);
					var recordWH = $("#recordWH").val();
					if(recordWH == 1)
					{
						g_recordWidth = 640;
						g_recordHeight = 360;
					}else if(recordWH == 2)
					{
						g_recordWidth = 848;
						g_recordHeight = 480;
					}else if(recordWH == 3)
					{
						g_recordWidth = 1280;
						g_recordHeight = 720;
					}else if(recordWH == 4)
					{
						g_recordWidth = 1920;
						g_recordHeight = 1080;
					}else if(recordWH == 5)
					{
						g_recordWidth = 640;
						g_recordHeight = 480;
					}
					CRVideo_SetFileUploadRate(g_FURate);
					g_video_size_type = $("#size_select").val();
					g_video_fps =  $("#frame_input").val();
					g_video_qp = $("input[name='meet_yx']:checked").val();
					g_wh_rate = $("input[name='videoSizeType']:checked").val();
					updateVideoCfg(parseInt(g_video_size_type),parseInt(g_video_fps),parseInt(g_video_qp),parseInt(g_wh_rate));
					layer.close(index);
				},
			btnAlign: 'c'		
		});
		$("#recordWH").change(function () {  
	        var ss = $(this).children('option:selected').val();  
	        if (ss == "1") {  
	        	$("#bitRate").val("350");
	        	g_video_recordwh = "1";
	        	g_recordWidth = 640;
				g_recordHeight = 360;
	        }else if (ss == "2") {  
	        	$("#bitRate").val("500");
	        	g_video_recordwh = "2";
	        	g_recordWidth = 848;
				g_recordHeight = 480;

	        }else if (ss == "3") {
	        	$("#bitRate").val("1000");
	        	g_video_recordwh = "3";
	        	g_recordWidth = 1280;
				g_recordHeight = 720;

	        }else if (ss == "4") { 
	        	$("#bitRate").val("2000");
	        	g_video_recordwh = "4";
	        	g_recordWidth = 1920;
				g_recordHeight = 1080;

	        }else if (ss == "5") { 
	        	$("#bitRate").val("500");
	        	g_video_recordwh = "5";
	        	g_recordWidth = 640;
				g_recordHeight = 480;
	        }
	        $("#recordWH").val(g_video_recordwh);
	    });
	     $("#frameRate").on("blur",function(){
		    var v = parseInt($(this).val());
		    if(v > 20){
		        $(this).val(20);
		    }else if(v < 6){
		    	 $(this).val(6);
		    }
		}); 
	    $("#frame_input").on("blur",function(){
		    var v = parseInt($(this).val());
		    if(v > 20){
		        $(this).val(20);
		    }else if(v < 6){
		    	 $(this).val(6);
		    }
		});
		if(g_recordWidth == 640 && g_recordHeight == 360)
		{
			
			$("#recordWH").val("1");
			g_video_recordwh = "1"
			// }else if(g_recordHeight == 480)
			// {
			// 	$("#recordWH").val("5");
			// 	g_video_recordwh = "5"
			// }
		}else if(g_recordWidth == 640 && g_recordHeight == 480){
			$("#recordWH").val("5");
			g_video_recordwh = "5"
		}else if(g_recordWidth == 848 && g_recordHeight == 480)
		{
			$("#recordWH").val("2");
			g_video_recordwh = "2"
		}else if(g_recordWidth == 1280 && g_recordHeight == 720)
		{
			$("#recordWH").val("3");
			g_video_recordwh = "3"
		}else if(g_recordWidth == 1920 && g_recordHeight == 1080)
		{
			$("#recordWH").val("4");
			g_video_recordwh = "4"
		}
		$("#recordWH").val(g_video_recordwh);
		$("#fuRate").val(g_FURate/1024)
		$("#bitRate").val(g_bitRate/1000)
		$("#frameRate").val(g_frameRate)
		$("input[name='recDataType'][value="+ g_recDataType+"]").attr("checked",true);
		$("input[name='recUpType'][value="+ g_isUploadOnRecording+"]").attr("checked",true);
		$("input[name='meet_yx'][value="+ g_video_qp+"]").attr("checked",true);
		$("input[name='videoSizeType'][value="+ g_wh_rate+"]").attr("checked",true);
		$("#size_select").val(g_video_size_type)
		$("#frame_input").val(g_video_fps)
		
		
		var audioCfg = CRVideo_GetAudioCfg();
		var micArr = CRVideo_GetAudioMicNames();
		var micArrOptionsStr = "";
		for(var i = 0;i<micArr.length;i++)
		{
			if(audioCfg.micName == micArr[i])
			{
				micArrOptionsStr += "<option value=\""+micArr[i]+"\" selected=\"true\">"+micArr[i]+"</option>"
			}else
			{
				micArrOptionsStr += "<option value=\""+micArr[i]+"\" >"+micArr[i]+"</option>"
			}
			
			
		}
		micArrOptionsStr = "<option value=\"\" >默认设备</option>" + micArrOptionsStr
		$(micArrOptionsStr).appendTo("#mic_select")
		
		var spkerArr =CRVideo_GetAudioSpkNames();
		var spkerArrOptionsStr = "";
		for(var i = 0;i<spkerArr.length;i++)
		{
			if(audioCfg.speakerName == spkerArr[i])
			{
				spkerArrOptionsStr += "<option value=\""+spkerArr[i]+"\" selected=\"true\">"+spkerArr[i]+"</option>"
			}else
			{
				spkerArrOptionsStr += "<option value=\""+spkerArr[i]+"\" >"+spkerArr[i]+"</option>"
			}
		}
		spkerArrOptionsStr = "<option value=\"\" >默认设备</option>" + spkerArrOptionsStr
		$(spkerArrOptionsStr).appendTo("#spker_select")
		
		var videoID = CRVideo_GetDefaultVideo(g_user_id)
		var videoList = CRVideo_GetAllVideoInfo(g_user_id);
		var videoListOptionsStr = "";
		for(var i = 0;i < videoList.length;i++)
		{
			var item = videoList[i];
			if(videoID == item.videoID)
			{
				videoListOptionsStr += "<option value=\""+item.videoID+"\" selected=\"true\">"+item.videoName+"</option>"
			}else
			{
				videoListOptionsStr += "<option value=\""+item.videoID+"\" >"+item.videoName+"</option>"
			}
		}
		videoListOptionsStr = "<option value=\"-1\" >默认设备</option>" + videoListOptionsStr
		$(videoListOptionsStr).appendTo("#video_select")
		
		$("#video_operate_btn").click(function()
		{
			var vStatus = CRVideo_GetVideoStatus(g_user_id);
			if(vStatus == 0)
			{
				this.popup("没有可打开的视频设备")

			}
			else if(vStatus ==  2)
			{
				CRVideo_OpenVideo(g_user_id);
				$("#video_operate_btn").text("关闭");
				videoOperateBtn = 	"关闭";
			}
			else 
			{
				CRVideo_CloseVideo(g_user_id);
				$("#video_operate_btn").text("打开");
				videoOperateBtn = 	"打开";

			}
		})

		$("#mic_operate_btn").click(function()
		{
			var aStatus = CRVideo_GetAudioStatus(g_user_id);
			if(aStatus == 0)
			{
				this.popup("没有可打开的音频设备")


			}
			else if(aStatus ==  2)
			{
				CRVideo_OpenMic(g_user_id);
				$("#mic_operate_btn").text("关闭");
				micOperateBtn = "关闭";	
			}
			else 
			{
				CRVideo_CloseMic(g_user_id);
				$("#mic_operate_btn").text("打开");
				micOperateBtn = "打开";

			}
		})
		$("#video_select").change(function()
		{
			CRVideo_SetDefaultVideo(g_user_id,$("#video_select").val());
		});
		$("#spker_select").change(function()
		{
			var cfg = {};
			cfg.micName = $("#mic_select").val();
			cfg.speakerName = $("#spker_select").val();
			cfg.privAgc = 0;
			cfg.privEC = 0;
			CRVideo_SetAudioCfg(cfg);
		});
		$("#mic_select").change(function()
		{
			var cfg = {};
			cfg.micName = $("#mic_select").val();
			cfg.speakerName = $("#spker_select").val();
			cfg.privAgc = 0;
			cfg.privEC = 0;
			CRVideo_SetAudioCfg(cfg);
		});
	});
};
// 选择视频效果
function choseMeetYx(num){
	if(num == "0"){
		$("input[name='meet_yx']").eq(1).attr("checked",false);
		$("input[name='meet_yx']").eq(0).attr("checked",true);
	}else if(num == "1"){
		$("input[name='meet_yx']").eq(0).attr("checked",false);
		$("input[name='meet_yx']").eq(1).attr("checked",true);
	}
	//alert($("input[name='meet_yx']:checked").val())
}
function choseUpType(num){
	if(num == "0"){
		$("input[name='recUpType']").eq(1).attr("checked",false);
		$("input[name='recUpType']").eq(0).attr("checked",true);
	}else if(num == "1"){
		$("input[name='recUpType']").eq(0).attr("checked",false);
		$("input[name='recUpType']").eq(1).attr("checked",true);
	}
	//alert($("input[name='recUpType']:checked").val())
}
function choseDataType(num){
	// radio 在选择时的变化
	if(num == "0"){
		$("input[name='recDataType']").eq(1).attr("checked",false);
		$("input[name='recDataType']").eq(0).attr("checked",true);
	}else if(num == "1"){
		$("input[name='recDataType']").eq(0).attr("checked",false);
		$("input[name='recDataType']").eq(1).attr("checked",true);
	}
}
function choseSizeType(num){
	// radio 在选择时的变化  0的时候是16:9
	if(num == "0"){
		g_wh_rate = 0;
		$("input[name='videoSizeType']").eq(1).attr("checked",false);
		$("input[name='videoSizeType']").eq(0).attr("checked",true);
		$("#size_select option").remove();
		g_type_size_mask = '<option value="8" selected="true">640*360</option>' 
				+ '<option value="10">848*480</option>' 
				+ '<option value="12">1280*720</option>'
				+ '<option value="13">1920*1080</option>';
		$("#size_select").append(g_type_size_mask);
	}else if(num == "1"){
		g_wh_rate = 1;
		$("input[name='videoSizeType']").eq(0).attr("checked",false);
		$("input[name='videoSizeType']").eq(1).attr("checked",true);
		$("#size_select option").remove();
		g_type_size_mask = '<option value="8" selected="true">640*480</option>' 
		$("#size_select").append(g_type_size_mask);
	}
}
// 上传视频
function upload(fileName){
	if(fileName == null)
	{
		popupTipLayer("还没录制");
		return
	}
	g_uploading = true;
	if(g_meeting)
	{
		$(".meeting_containt").css("display","none")
	}
	var str = '<div class="full_page_msg">'
				+'<span class="msg_label">文件名称：</span>'
				+'<span class="name_label_detail" id="file_name">'+ fileName +'</span>'
			+'</div>'
			+'<div class="full_page_msg">'
				+'<span class="msg_label">上传进度：</span>'
				+'<span class="name_label_detail" id="upload_num_percert">----</span>'
			+'</div>'
			+'<div class="full_page_msg" id="percent_container">'
				+'<div class="percent_box" id="percent_box">'
					+'<span class="percent_item" id="percent_item"></span>'
				+'</div>'
			+'</div>'
			+'<div class="full_page_msg">'
				+'<span class="msg_label">上传状态：</span>'
				+'<span class="name_label_detail"  id="upload_status">准备上传</span>'
			+'</div>'
			// +'<div class="full_page_button">'
			// 	+'<button class="full_page_cancle" onclick="cancle_upload(g_record)">取消</button>'
			// 	+'<a class="full_page_submit" style="display: none;" id="catSerRecBtn" target="_blank">查看服务端录像</a>'
			// +'</div>';
	var g_server_name = $("#login_server_box").val()
	layui.use('layer', function(){ 
		var layer = layui.layer;
		layer.open({
			shadeClose: true,
			area: ['520px', '440px'],
			title: ['上传录像','font-size:14px'],
			content: str,
			closeBtn: 0,
			btn: ['确定', '取消','查看服务端录像'],
			yes: function(index){
				layer.close(index);
			},
			btn2: function(index, layero){
    			layer.close(index);
 			},btn3: function(index, layero){
 				window.open("http://"+g_server_name+"/default.action?webtype=conf#recordinfo");
    			layer.close(index);
 			},
			btnAlign: 'c',
			end:function()
			  {
				if(g_meeting && g_file_layout == -1)
				{
					$(".meeting_containt").css("display","block");
					if(!g_third_id){
						if(g_call_video !== undefined && g_me_video !== undefined)
						{
							g_call_video.setVideo(g_call_user_id);
							g_me_video.setVideo(g_seat_id);
						}
					}else{
						if(g_callObj !== undefined && g_seat_video !== undefined && g_third_video !== undefined)
						{
							g_callObj.setVideo(g_call_user_id);
							g_seat_video.setVideo(g_seat_id);
							g_third_video.setVideo(g_third_id);
						}
					}
				}

			  }
		});
		CRVideo_UploadRecordFile(fileName)
	});
}
function cancle_upload(fileName)
{
	var fileNameDetail = fileName;
	$(".full_page").css('display','none');
	$(".full_page_div").css('display','none');
	if($(".list_container").css("display") == "block"){
		g_getAll_videfile_list = CRVideo_GetAllRecordFiles();
		getAllVideoList(g_getAll_videfile_list)
	}else{
		$(".detail_right_video").css('display','block');
		updateVideo();
	}
	if(g_uploading)
	{
		CRVideo_CancelUploadRecordFile(fileName)
		g_uploading = false;
	}
}
CRVideo_NotifyRecordFileStateChanged.callback = function(filename,state)
{

	$("#file_name").text(filename);
	if(state == 2)
	{
		$('#upload_status').text("上传完成");
		$("#percent_item").css("width","100%");
		$("#upload_num_percert").text("100%");
		$('.full_page_cancle').text("确定");
		$(".full_page_submit").css("display","inline-block");
		
		g_uploading = false;
	}else if(state == 1)
	{
		$(".full_page_submit").css("display","none");
		$('#upload_status').text("上传中...")
		$('.full_page_cancle').text("取消上传")
	}else if(state == 0 && g_uploading)
	{
		$(".full_page_submit").css("display","none");
		$('#upload_status').text("准备上传...")
		$('.full_page_cancle').text("取消上传")
		$("#percent_item").css("width","0")
	}
	//console.log("CRVideo_NotifyRecordFileStateChanged(filename:"+filename+" state:"+state+")");
}
CRVideo_NotifyRecordFileUploadProgress.callback = function(filename,percent)
{
	//console.log("CRVideo_NotifyRecordFileUploadProgress(filename:"+filename+" percent:"+percent+")");
	$(".full_page_submit").css("display","none");
	$("#percent_item").css("width",percent+"%");
	$("#upload_num_percert").text(percent + "%");
}
CRVideo_UploadRecordFileErr.callback = function(fileName,err)
{
	$('#upload_status').text("上传失败")
	$('.full_page_cancle').text("确定")
	
		g_uploading = false;
}
// 展示所有的文件列表
// 点击显示列表
var g_file_layout = -1;
function showAllList(){
	if(g_meeting)
	{
		$(".meeting_containt").css("display","none")
	}
	//console.log(g_getAll_videfile_list);
	g_getAll_videfile_list = CRVideo_GetAllRecordFiles();
	var str = '<div class="list_container" id="list_container">'
				+'<div class="table_list">'
					+'<table width="100%" border="0" cellspacing="0" cellpadding="0" id="table_list_container">'
						+'<tr>'
							+'<td width="25%"><div class="tabel_list_head">文件名</div></td>'
							+'<td width="18%"><div class="tabel_list_head">文件大小</div></td>'
							+'<td width="14%"><div class="tabel_list_head">文件时长</div></td>'
							+'<td width="10%"><div class="tabel_list_head">上传状态</div></td>'
							+'<td width="33%">操作</td>'
						+'</tr>'
					+'</table>'
				+'</div>'
			+'</div>';
	layui.use('layer', function(){ 
		var layer = layui.layer;
		g_file_layout = layer.open({
			type: 1,
  			skin: 'layui-layer-rim', //加上边框
			shadeClose: true,
			closeBtn: 0,
			area: ['640px', '460px'],
			title: ['录制文件管理','font-size:14px'],
			content: str,
			btn: ['确定'],
			yes: function(index){
					layer.close(index);
				},
			btnAlign: 'c',
			end:function()
				  {
					g_file_layout = -1;
					if(g_meeting)
					{
						$(".meeting_containt").css("display","block");
						if(!g_third_id){ 
							// !g_third_id  判断的是目前是否有第三方用户在，如果是==1则是判断当前用户是seat还是third
							if(g_call_video !== undefined && g_me_video !== undefined)
							{
								g_call_video.setVideo(g_call_user_id);
								g_me_video.setVideo(g_seat_id);
							}
						}else{
							if(g_callObj !== undefined && g_seat_video !== undefined && g_third_video !== undefined)
							{
								g_callObj.setVideo(g_call_user_id);
								g_seat_video.setVideo(g_seat_id);
								g_third_video.setVideo(g_third_id);
							}
						}
					}

				  }
		});
	});
	getAllVideoList(g_getAll_videfile_list);
}
function getAllVideoList(list){
	$(".list_all_items").remove();
	if(list && list != "" && list != null){
		var listLength = list.length;
		var str = "",str1="";
		for(var i=0;i< listLength; i++){
			var listState = "";
			var listName = list[i].fileName;
			var duration = list[i].duration;
			if(list[i].state == 0){
				listState = "未上传";
				//str1 = "<span class=\"table_up_del_rec\" onclick=\"uploadFile("+ i +")\">上传</span>"
			}else if(list[i].state == 1){
				listState = "上传中";
				//str1 = "";
			}else if(list[i].state == 2){
				listState = "已上传";
			}
			var fileSize = decimal((parseInt(list[i].size) / 1024 / 1024),1);
			if(parseInt(fileSize) > 0 ){
				fileSize = decimal((parseInt(list[i].size) / 1024 / 1024),1) + "M";
			}else{
				fileSize = decimal((parseInt(list[i].size) / 1024),1)  + "K";
			}
			str += "<tr id=\"list_item"+i+"\" class=\"list_all_items\">"
					+  "<td width=\"25%\"><div id=\"fileName"+ i +"\">"+ listName+ "</div></td>"
					+  "<td width='18%'><div class=\"list_item_size\">"+ fileSize + "</div></td>"
					+  "<td width='14%'><div class=\"list_item_size\">"+ duration + "秒</div></td>"
					+  "<td width=\"10%\"><div class=\"list_item_state\">"+ listState + "</div></td>"
					//+  "<td width='40%'><div class='table_done'><span class='table_up_del_rec' onclick='upload("+list[i].fileName+")'>上传</span><span class='table_up_del_rec' onclick='playbackList("+ list[i].fileName +")'>回放</span><div class='table_up_perc'></div></div></td>"
					+  "<td width=\"33%\">"
						+ "<div class=\"table_done\">"
							//+ str1
							+ "<span class=\"table_up_del_rec\" onclick=\"uploadFile("+ i +")\">上传</span>"
							+ "<span class=\"table_up_del_rec\" onclick=\"deleteFile("+ i  +")\">本地删除</span>"
							+ "<span class=\"table_up_del_rec\" onclick=\"playbackList("+ i +")\">回放</span>"
							//+ "<div class='table_up_perc'></div>"
						+"</div>"
					+"</td>"
				+ "</tr>"
		}
		str += "<div style='height:0;clear:both;'></div>"
		$("#table_list_container").append(str);

	}

}
// 四舍五入获取文件大小值方法
function decimal(num,v){
	var vv = Math.pow(10,v);
	var hello = Math.round(num*vv)/vv;
	return hello
}
// 点击屏幕共享后的弹层页面
function showScreenShareSet(){

	if(g_third_id){
		popupTipLayer("三方通话状态无法使用屏幕共享功能");
		return
	}
    if(g_isStartScreenShare)
    {
        popupTipLayer("已经在屏幕共享");
		return
    }
    if(g_playbacking)
	{
		CRVideo_StopPlayMedia()
	}
    if(g_nowTime_play_num != -1)
    {
         video_stop(g_nowTime_play_num);
    }

    if(g_meeting)
	{
		$(".meeting_containt").css("display","none")
	}
	var str = '<div id="shareScreenSet" class="share_screen_set">'
			    + '<div id="shareScreenSetType" class="share_screen_set_type">'
					+'<span class="share_screen_set_type1">'
						+ '<input type="radio" onclick="choseShareTY(\'0\')"  name="chooseScreenType"  class="choose_screen_type" value="0" checked="checked"/>'
					    + '<label>屏幕共享</label>'
					+'</span>'
					+'<span class="share_screen_set_type1">'
						+'<input type="radio"  onclick="choseShareTY(\'1\')"  name="chooseScreenType" class="choose_screen_type" value="1"/>'
						+'<label>区域共享</label>'
					+'</span>'
				+'</div>'
				+'<div id="shareScreenSetFirst" class="share_screen_set_first">'
					+'<span class="share_screen_set_type1">'
						+'<input type="radio"  onclick="choseShareFR(\'0\')"  name="chooseScreenFirst"  class="choose_screen_first" value="0" checked="checked"/>'
						+'<label>画质优先</label>'
				    +'</span>'
				    +'<span class="share_screen_set_type1">'
						+'<input type="radio" onclick="choseShareFR(\'1\')" name="chooseScreenFirst" class="choose_screen_first" value="1"/>'
						+'<label>速度优先</label>'
					+'</span>'
				+'</div>'
			+'</div>'	
	layui.use('layer', function(){ 
		var layer = layui.layer;
		g_file_layout = layer.open({
			type: 1,
  			skin: 'layui-layer-rim', //加上边框
			shadeClose: true,
			closeBtn: 0,
			area: ['400px', '200px'],
			title: false,
			content: str,
			btn: ['开始共享'],
			yes: function(index){
				 	var obj = {}
	                var encodeType = $("input[name='chooseScreenFirst']:checked").val();
	                var catchRect =  $("input[name='chooseScreenType']:checked").val();
	                obj.encodeType = encodeType;
	                if(catchRect == "1")
	                {
	                    obj.catchRect = {"left":100,"top":100,"width":500,"height":400}
	                }else
                    {
                        g_screenShareX = 0;
                        g_screenShareY = 0;
                    }
	                CRVideo_SetScreenShareCfg(obj);
	                CRVideo_StartScreenShare();
					layer.close(index);
				},
			end:function(){
				if(g_meeting)
				{
					g_file_layout = -1;
					$(".meeting_containt").css("display","block");
					if(!g_third_id){
						if(g_call_video !== undefined && g_me_video !== undefined)
						{
							g_call_video.setVideo(g_call_user_id);
							g_me_video.setVideo(g_seat_id);
						}
					}else{
						if(g_callObj !== undefined && g_seat_video !== undefined && g_third_video !== undefined)
						{
							g_callObj.setVideo(g_call_user_id);
							g_seat_video.setVideo(g_seat_id);
							g_third_video.setVideo(g_third_id);
						}
					}
					

				}
			},
			btnAlign: 'c'
		});

	});
}
var g_isStartScreenShare = false
var g_screenShareX = 0;
var g_screenShareY = 0;
var g_screenShareWidth = 0;
var g_screenShareHeight = 0;
CRVideo_StartScreenShareRslt.callback = function(sdkErr)
{
   
    if(sdkErr == 0)
    {
         g_isStartScreenShare = true
         //$("#startRecordCon").hide();
    }else{
    	
    }
}
CRVideo_NotifyScreenShareStarted.callback = function()
{
   
   g_isStartScreenShare = true
}

CRVideo_StopScreenShareRslt.callback = function(sdkErr)
{
   
    if(sdkErr == 0)
    {
         g_isStartScreenShare = false
         //$("#startRecordCon").show();
    }
}
CRVideo_NotifyScreenShareStopped.callback = function()
{
   
   g_isStartScreenShare = false
}

CRVideo_NotifyShareRectChanged.callback = function(x,y,w,h)
{
    g_screenShareX = x
    g_screenShareY = y
    g_screenShareWidth = w;
    g_screenShareHeight = h;
    updateRecord();
}
function choseShareTY(num){
	// radio 在选择时的变化
	if(num == "0"){
		$("input[name='chooseScreenType']").eq(1).attr("checked",false);
		$("input[name='chooseScreenType']").eq(0).attr("checked",true);
	}else if(num == "1"){
		$("input[name='chooseScreenType']").eq(0).attr("checked",false);
		$("input[name='chooseScreenType']").eq(1).attr("checked",true);
	}
}
function choseShareFR(num){
	// radio 在选择时的变化
	if(num == "0"){
		$("input[name='chooseScreenFirst']").eq(1).attr("checked",false);
		$("input[name='chooseScreenFirst']").eq(0).attr("checked",true);
	}else if(num == "1"){
		$("input[name='chooseScreenFirst']").eq(0).attr("checked",false);
		$("input[name='chooseScreenFirst']").eq(1).attr("checked",true);
	}
}
function chosePcmTY(num){
	if(num == "0"){
		$("input[name='chosePcmType']").eq(1).attr("checked",false);
		$("input[name='chosePcmType']").eq(0).attr("checked",true);
	}else if(num == "1"){
		$("input[name='chosePcmType']").eq(0).attr("checked",false);
		$("input[name='chosePcmType']").eq(1).attr("checked",true);
	}
}
// 点击录制pcm文件后的弹窗
function startRecordPcm(){

	if(g_playbacking)
	{
		popupTipLayer("回放时不能录制pcm文件");
		return;
	}
	if(g_recording){
		popupTipLayer("录制视频时不能录制纯音频");
		return;
	}
	if(g_nowTime_play_num != -1)
	{
	     video_stop(g_nowTime_play_num);
	}

    if(g_meeting)
	{
		$(".meeting_containt").css("display","none")
	}
	var str = '<div id="startRecordPcmType" class="start_record_pcm_type">'
					+'<span class="start_record_pcm_type1">'
						+'<input type="radio" onclick="chosePcmTY(\'0\')"  name="chosePcmType"  class="choose_screen_type" value="0" checked="checked"/>'
					    +'<label>麦克风</label>'
					+'</span>'
					+'<span class="start_record_pcm_type1">'
						+'<input type="radio"  onclick="chosePcmTY(\'1\')"  name="chosePcmType" class="choose_screen_type" value="1"/>'
						+'<label>扬声器</label>'
					+'</span>'
				+'</div>'
	layui.use('layer', function(){ 
		var layer = layui.layer;
		g_file_layout = layer.open({
			type: 1,
  			skin: 'layui-layer-rim', //加上边框
			shadeClose: true,
			closeBtn: 0,
			area: ['300px', '150px'],
			title: false,
			content: str,
			btn: ['开始录制'],
			yes: function(index){
				g_chose_pcm_type = $("input[name='chosePcmType']:checked").val();
               	var date = new Date();
				var year = date.getFullYear();
				var month = date.getMonth()+1;
				var day = date.getDate();
				var hour = date.getHours();
				var minute = date.getMinutes();
				var second = date.getSeconds();
				g_recordPcm = year + "-" + month + "-" + day + "-" + hour+'-' + minute + '-' + second+".pcm"; 
				var StartPcmStatus =  CRVideo_StartPcmRecord(parseInt(g_chose_pcm_type),g_location_dir+g_recordPcm);
				g_recordpcming = true;
				$("#startRecordCon").css("display","none");
				$("#stopRecordPcm").css("display","block");
				layer.close(index);
			},
			end:function(){
				g_file_layout = -1;
				if(g_meeting)
				{
					$(".meeting_containt").css("display","block");
					if(!g_third_id){
						if(g_call_video !== undefined && g_me_video !== undefined)
						{
							g_call_video.setVideo(g_call_user_id);
							g_me_video.setVideo(g_seat_id);
						}
					}else{
						if(g_callObj !== undefined && g_seat_video !== undefined && g_third_video !== undefined)
						{
							g_callObj.setVideo(g_call_user_id);
							g_seat_video.setVideo(g_seat_id);
							g_third_video.setVideo(g_third_id);
						}
					}
				}
			},

			btnAlign: 'c'
		});
	});
};
// 停止纯音频录制
function stopRecordPcm(){
	CRVideo_StopPcmRecord(g_chose_pcm_type);
	$("#startRecordCon").css("display","block");
	$("#stopRecordPcm").css("display","none");
	g_recordpcming = false;
}
// 开始聊天
function openChatsBox(){
	if(g_third_id){
		popupTipLayer("三方通话状态无法使用聊天功能");
		return
	}
	$("#detailChatsBox").css("display","block");
}
// 关闭聊天的方法
function closeChatsPage(){
	$("#sendChats").text("");
	$("#detailChatsBox").css("display","none");
}
// 发送聊天信息
function detailSendIm(){
	var imMsg = $("#sendChats").text();
	if($.trim(imMsg.replace(/&nbsp;/g, '').replace(/<br>/g, '').replace(/<br\/>/g, '').replace(/<p>/g, '').replace(/<\/p>/g, ''))==''){
		$("#attentionMsg").text("发送信息不能为空");
		$("#attentionMsg").show();
		setTimeout(function(){
			$("#attentionMsg").hide();
		},3000);
		return;
	}
	chat_im_id = CRVideo_SendIMmsg(imMsg,"","");
}
// 监听发送消息的结果
CRVideo_SendIMmsgRlst.callback = function(taskID,sdkErr,cookie){
	if(sdkErr == 0 && taskID == chat_im_id){
		//发送成功
		function p(s) {
			return s < 10 ? '0' + s: s;
		}
	 	var myDate = new Date();
		var h = myDate.getHours();       //获取当前小时数(0-23)
		var m = myDate.getMinutes();     //获取当前分钟数(0-59)
		var s = myDate.getSeconds();  
		var now = p(h)+':'+p(m)+":"+p(s);
		var str = "";
		str = '<div class="detail_chats_item2">'
				+'<div class="detail_chats_item2_name">'+g_nick_name+'['+ now +']</div>'
				+'<p class="detail_chats_item2_msg">'+ $("#sendChats").text() +'</p>'
			+'</div>';
		$("#sendChats").text("");
		$("#chatsList").append(str);
	}else{
		$("#attentionMsg").text("发送失败，请重新发送");
		$("#attentionMsg").show();
		setTimeout(function(){
			$("#attentionMsg").hide();
		},3000);
	}
}
// 监听收到的IM信息,自身的也是该方法
 CRVideo_NotifyIMmsg.callback = function(fromUserID,text){
 	function p(s) {
		return s < 10 ? '0' + s: s;
	}
 	var myDate = new Date();
	var h = myDate.getHours();       //获取当前小时数(0-23)
	var m = myDate.getMinutes();     //获取当前分钟数(0-59)
	var s = myDate.getSeconds();  
	var now = p(h)+':'+p(m)+":"+p(s);
	var str = "";
	if(fromUserID == g_call_user_id){
		str = '<div class="detail_chats_item1">'
				+'<div class="detail_chats_item1_name">'+fromUserID+'['+ now +']</div>'
				+'<p class="detail_chats_item1_msg">'+ text +'</p>'
			+'</div>';
		$("#chatsList").append(str);
	}
}