//搜索


$(".rw_search").click(function(){
	
	var vals = $(this).attr('data-val');
	
	$("#fids").val(vals);
	
	$("#form_adv_search").submit();
	
});

