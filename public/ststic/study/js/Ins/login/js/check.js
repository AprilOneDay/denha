//表单验证

//判断是否为空
function nullCheck(){
	for(var i=0;i<document.check.elements.length-1;i++){
		if(document.check.elements[i].value==""){
			alert("当前表单不能有空项");
			document.check.elements[i].focus();
			return false;
		}
	}
	return true;
}
//登录验证
function loginCheck(){
	if(document.check.username.value==""){
		layer.msg("请填写用户名",{ icon: 5,time: 2000});
		document.check.username.focus();
		return false;
	}
	if(document.check.password.value==""){
		layer.msg("密码不能为空",{ icon: 5,time: 2000});
		document.check.password.focus();
		return false;
	}
	if(document.check.code.value==""){
		layer.msg("验证码不能为空",{ icon: 5,time: 2000});
		document.check.code.focus();
		return false;
	}
}
//投诉录入验证
function complaintCheck() {
	if (document.check.txtaccuser.value == "") {
		layer.msg("请填写投诉人", {icon: 5, time: 2000});
		document.check.txtaccuser.focus();
		return false;
	}
	if (document.check.txttel.value == "") {
		layer.msg("请填写联系电话", {icon: 5, time: 2000});
		document.check.txttel.focus();
		return false;
	} else {
		var isMobile = document.check.txttel.value;
		if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(isMobile))){
			layer.msg("请输入正确的手机号码或电话号码", {icon: 5, time: 2000});
			document.check.txttel.focus();
			return false;
		}
	}
	if (document.check.complaintdatetime.value == "") {
		layer.msg("请选择投诉时间", {icon: 5, time: 2000});
		document.check.complaintdatetime.focus();
		return false;
	}
	if (document.check.selecttypes.value == "") {
		layer.msg("请选择投诉类型", {icon: 5, time: 2000});
		document.check.selecttypes.focus();
		return false;
	}
	if (document.check.selectappelleetypes.value == "") {
		layer.msg("请选择单位类型", {icon: 5, time: 2000});
		document.check.selectappelleetypes.focus();
		return false;
	}
	if (document.check.txtappellee.value == "") {
		layer.msg("请填写被投诉单位", {icon: 5, time: 2000});
		document.check.txtappellee.focus();
		return false;
	}
	if (document.check.site_sub_class.value == "") {
		layer.msg("请选择-社区/村-", {icon: 5, time: 2000});
		document.check.site_sub_class.focus();
		return false;
	}
	if (document.check.txtcomplaitcontent.value == "") {
		layer.msg("请填写投诉内容", {icon: 5, time: 2000});
		document.check.txtcomplaitcontent.focus();
		return false;
	}
}
