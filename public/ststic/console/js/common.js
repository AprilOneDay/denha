$(function(){
    $('.')

    $('select').each(function(){
        var data = $(this).attr('data-selected');
        if(data){
            $(this).val(data);
        }
    });

    //详情
    $('.btn-console-detail').click(function(){
    	var href = $(this).attr('data-href');
    	//iframe层
		layer.open({
		  type: 2,
		  title: '详情',
		  shadeClose: true,
		  shade: 0.8,
		  area: ['700px', '70%'],
		  content: [href] //iframe的url
		});
    })
})