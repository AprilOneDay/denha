$(document).ready(function(){
	initDropList('accusertown','accusercommunity');
	initDropList('site_main_class','site_sub_class');
	//changeSubClass('1', 'typesremark');
	//chktypes('1');
	//changecomplaintno(1,arrComplaintCount);
	$("#selectways").change(function(){
									 
									  if ($(this).val() == "5"){
										  
										  $("#complaintno-1").removeAttr("readonly");
										  $("#complaintno-2").removeAttr("readonly");
										  $("#complaintno-1").removeAttr("disabled");
										  $("#complaintno-2").removeAttr("disabled");
										  }
									  else{
										  $("#complaintno-1").attr("readonly","readonly");
										  $("#complaintno-2").attr("readonly","readonly");
										 }
									  })
	$("#txtappellee").keyup(function(){
									  if ($(this).val() != ""){ postdata();}
									  });
	$("#complaintno_3").change(function(){
										if (/^\d+$/.test(txt))   
										{   
										   alert("格式不对！");
										   $(this).focus();
										}
										var txt = parseInt($(this).val(),10);
										if(txt != ""){
											if(txt<10){
												$(this).val('0'+txt)
											}
										}
										})
	$("#site_main_class").change(function(){postdata();});
	$("#typesremark").change(function(){postdata();});
	$("#selecttypes").change(function(){postdata();chktypes($(this).val());changecomplaintno($("#complaintno-2").val(),arrComplaintCount);});
	$("#selectappelleetypes").change(function(){postdata();changeSubClass($(this).val(), 'typesremark');});
})

function chktypes(values){
	var types
	switch (values){
		case '26':
		case '27':
		case '28':
			types = '01';
			break;
		case '9':
		case '10':
		case '11':
		case '12':
			types = '02';
			break;
		case '13':
		case '14':
		case '15':
		case '16':
		case '24':
			types = '03';
			break;
		case '17':
		case '18':
			types = '04';
			break;
		case '19':
		case '20':
		case '25':
			types = '05';
			break;
		case '21':
		case '22':
		case '23':
			types = '06';
			break;
		default:
			types = '0'+ values;
		}
	$("#complaintno-2").val(types);
	
}

function postdata(){
	var selectways = $("#selectways").val();
	var selecttypes = $("#selecttypes").val();
	var selectappelleetypes = $("#selectappelleetypes").val();
	var site_main_class = escape($("#site_main_class").val());
	var site_sub_class = escape($("#site_sub_class").val());
	var txtaddressdetail = escape($("#txtaddressdetail").val());
	var txtappellee = escape($("#txtappellee").val());
	var typesremark = escape($("#typesremark").val());
	var url = "ComplaintIsExist.asp?q=q&way="+ selectways +"&type="+ selecttypes +"&appelleetype="+ selectappelleetypes +"&town="+ site_main_class +"&community="+ site_sub_class +"&detail="+ txtaddressdetail +"&appellee="+ txtappellee +"&typesremark="+ typesremark
	$("#querycomplaintisexist").attr("src",url)
}

function changecomplaintno(types,numbers)
{
	var i = parseInt(types,10);
	$("#complaintno_3").val(numbers[i]);
}

function chkform(e){
	if(e.txtaccuser.value == ""){
		alert("请填写投诉人！");
		e.txtaccuser.focus();
		return false;
	}
	if(e.txttel.value == "" && e.txtmobiletel.value == ""){
		alert("请填写联系电话！");
		e.txttel.focus();
		return false;
	}
	else 
	{
		if (e.txttel.value != ""){
			if(!(e.txttel.value.isMobile()||e.txttel.value.isTel())){  
				alert("请输入正确的手机号码或电话号码！"); 
				e.txttel.focus();
				return false;        
			}
		}
		if (e.txtmobiletel.value != ""){
			if(!(e.txtmobiletel.value.isMobile()||e.txtmobiletel.value.isTel())){  
				alert("请输入正确的手机号码或电话号码！"); 
				e.txttel.focus();
				return false;        
			}
		}
	} 
	if(e.complaintdatetime.value ==0){
		alert("请选择投诉时间！");
		e.complaintdatetime.focus();
		return false;
	}
	if(e.selecttypes.value ==0){
		alert("请选择投诉类型！");
		e.selecttypes.focus();
		return false;
	}
	if(e.selectappelleetypes.value == 0){
		alert("请选择单位类型！");
		e.selectappelleetypes.focus();
		return false;
	}	
	if(e.txtappellee.value == ""){
		alert("请填写被投诉单位！");
		e.txtappellee.focus();
		return false;
	}
	if(e.site_main_class.value == ""){
		alert("请选择所在街道/镇！");
		e.site_main_class.focus();
		return false;
	}
	//if(e.txtaddressdetail.value == ""){
	//	alert("请填写详细地址！");
	//	e.txtaddressdetail.focus();
	//	return false;
	//}
	if(e.txtcomplaitcontent.value == ""){
		alert("请填写投诉内容！");
		e.txtcomplaitcontent.focus();
		return false;
	}
	
	if(e.complaintno_3.value == ""){
		alert("请填写投诉编号！");
		e.complaintno_3.focus();
		return false;
	}
	if(e.selecttypes.value == ""){
		alert("请选择备注！");
		e.selecttypes.focus();
		return false;
	}
	
	return confirm("您确定填写完整并提交该投诉信息！");
}

String.prototype.Trim = function() {  
  var m = this.match(/^\s*(\S+(\s+\S+)*)\s*$/);  
  return (m == null) ? "" : m[1];  
}

String.prototype.isMobile = function() {  
  return (/^(?:13\d|15\d|18\d)-?\d{5}(\d{3}|\*{3})$/.test(this.Trim()));  
} 

String.prototype.isTel = function()
{
    //"兼容格式: 国家代码(2到3位)-区号(2到3位)-电话号码(7到8位)-分机号(3位)"
    //return (/^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/.test(this.Trim()));
    return (/^(\d{7,8})(-(\d{3,}))?$/.test(this.Trim()));
}

function openwindow(url,width,height)
{
	var left = screen.availWidth/2 - width/2;
	var top = screen.availHeight/2 - height/2;
	window.open(url, "", "width="+width+"px,height="+height+",left="+left+",top="+top+",resizable=no,scrollbars=yes,status=no");
}