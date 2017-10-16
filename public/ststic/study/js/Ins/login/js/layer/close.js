//弹框关闭、子弹框

$(function () {

    $(".fa-close,._search-btn").click(function () {
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    });
    //校对信息
	$(".proof-btn").on("click",function(){
        /*window.parent.layer.open({
        	type: 2,
			title: false,
			shadeClose: false,
			closeBtn: false,
			shade: 0.4,
			area: ["810px","435px"],
			content: "_proof.html",
			skin: "skin01"
        });*/
		var index = parent.layer.getFrameIndex(window.name);
		parent.layer.open({
			type: 2,
			title: false,
			shadeClose: false,
			closeBtn: false,
			shade: 0.4,
			area: ["810px","435px"],
			content: "_proof.html",
			skin: "skin01"
		});
		parent.layer.close(index);
	});
});
