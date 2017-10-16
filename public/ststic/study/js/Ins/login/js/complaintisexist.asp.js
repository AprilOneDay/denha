$(document).ready(function(){
	$("#btnclose").click(function(){
	 	window.close();
		})
	if($(":checkbox").length > 0){
		
		$(":checkbox").each(function(){
		$(this).click(function(){
		$("#txtappellee",window.parent.document).val($(this).parents("tr").find("td:first-child").text());
		var checkvalue = $(this).attr("checked");
		$(":radio[value='1']",window.parent.document).attr("checked",true);
		$(":checkbox").attr("checked",false);
		if(checkvalue) $(this).attr("checked",true);
		})
	 })
	}
})

function view(action,id){
	var url = "ViewComplaint.asp";
	if(action == "" || id ==""){
		alert("参数值不能为空！");
	}
	else if(action !="view" && action !="assign" && action !="transact" && action !="archive"){
		alert("参数值越界！");
	}
	else{
		url = url +"?action="+ action +"&id="+ id
		openwindow(url,600,560);
	}
}

function openwindow(url,width,height)
{
	var left = screen.availWidth/2 - width/2;
	var top = screen.availHeight/2 - height/2;
	window.open(url, "", "width="+width+"px,height="+height+",left="+left+",top="+top+",resizable=no,scrollbars=yes,status=no");
}