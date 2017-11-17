// 点击显示列表
function showAllList(){
	//console.log(g_getAll_videfile_list);
	g_getAll_videfile_list = CRVideo_GetAllRecordFiles();
	getAllVideoList(g_getAll_videfile_list);
	$(".full_page").css("display","block");
	$(".list_container").css("display","block");
	$(".detail_right_video").css('display','none');
}
function getAllVideoList(list){
	//$("#table_list_container").remove(".list_all_items")
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
				//str1 = "";
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
					+  "<td width=\"14%\"><div class=\"list_item_state\">"+ duration + "秒</div></td>"
					+  "<td width=\"10%\"><div class=\"list_item_state\">"+ listState + "</div></td>"
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
function closelistPage(){
	$(".full_page").css({"display":"none"});
	$(".list_container").css({"display":"none"});
	if(g_uploading == false)
	{
		
		$(".detail_right_video").css('display','block');
		updateVideo();
	}
}
// 换为单摄像头
 function changeSingle()
 {
	if(g_single_video)
		return
	g_single_video = true
	if(g_layout == 'layoutA')
		layoutA();
	else if(g_layout == 'layoutB')
		layoutB();
	updateVideo();
 }

 // 换为双摄像头
 function changeDouble()
 {
	if(!g_single_video)
		return
	g_single_video = false
	if(g_layout == 'layoutA')
		layoutA();
	else if(g_layout == 'layoutB')
		layoutB();
	updateVideo();
 }
 function decimal(num,v){
	var vv = Math.pow(10,v);
	return Math.round(num*vv)/vv;
}
var  videoOperateBtn = 	"关闭";
var  micOperateBtn = "关闭";
function setVideoAndMedia(){
	$("input[name='meet_yx'][value="+ g_video_qp+"]").attr("checked",true);
	$("#size_select").val(g_video_size_type)
	$("#frame_input").val(g_video_fps)

	var audioCfg = CRVideo_GetAudioCfg();
	var micArr = CRVideo_GetAudioMicNames();
	var micArrOptionsStr = "";
	if(g_first_set_video_and_med){
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
		$(micArrOptionsStr).appendTo("#mic_select");
	}
	
	var spkerArr =CRVideo_GetAudioSpkNames();
	var spkerArrOptionsStr = "";
	if(g_first_set_video_and_med){
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
	}
	var videoID = CRVideo_GetDefaultVideo(g_userID)
	var videoList = CRVideo_GetAllVideoInfo(g_userID);
	var videoListOptionsStr = "";
	if(g_first_set_video_and_med){
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
	}
	$("#video_operate_btn").click(function()
	{
		var vStatus = CRVideo_GetVideoStatus(g_userID);
		if(vStatus == 0)
		{
			this.popup("没有可打开的视频设备")

		}
		else if(vStatus ==  2)
		{
			CRVideo_OpenVideo(g_userID);
			$("#video_operate_btn").text("关闭");
			videoOperateBtn = "关闭";
		}
		else 
		{
			CRVideo_CloseVideo(g_userID);
			$("#video_operate_btn").text("打开");
			videoOperateBtn = "打开";

		}
	})

	$("#mic_operate_btn").click(function()
	{
		var aStatus = CRVideo_GetAudioStatus(g_userID);
		if(aStatus == 0)
		{
			this.popup("没有可打开的音频设备")


		}
		else if(aStatus ==  2)
		{
			CRVideo_OpenMic(g_userID);
			$("#mic_operate_btn").text("关闭");
			micOperateBtn = "关闭";
		}
		else 
		{
			CRVideo_CloseMic(g_userID);
			$("#mic_operate_btn").text("打开");
			micOperateBtn = "打开";

		}
	})
	$("#video_select").change(function()
	{
		CRVideo_SetDefaultVideo(g_userID,$("#video_select").val());
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
	g_first_set_video_and_med = false;
}
