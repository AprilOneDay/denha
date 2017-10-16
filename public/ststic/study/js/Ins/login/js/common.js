//
$(document).ready(function () {

    //登录文本框
    $(".info-left input").focus(function () {
        $(this).addClass("focus");
    }).blur(function () {
        $(this).removeClass("focus");
    });

    //
    var height = $(window).height();
    var header = $(".header").height() + 20;
    var width = $(window).width();
    var left = $(".left").width();
    var title = $(".title").height();
    var poptitle = $(".popup-title").height();
    $(".section").height(height);
    $(".right").width(width - left);
    $(".content").height($(window).height() - title +45);
    $(".popup-content").height(height - poptitle - 20);

    //侧边栏
    $(".bar-icon").on("click", function () {
        if ($(this).is(".hidden")) {
            $(this).removeClass("hidden");
            $(".right").width(width - left);
            $(".bar-box").css({
                "margin-left": "310px"
            });
        } else {
            $(this).addClass("hidden");
            $(".right").width(width - left - 310);
            $(".bar-box").css({
                "margin-left": "0"
            });
        }
    });

    //投诉归档delete
    $(".archive-delete").on("click", function () {
        $(this).parents("tr").remove();
    });

    //投入录入
	//$(".entry-list tr td label input").prop("disabled",true);
    $("select[name='selectways']").change(function(){
		if ($(this).val() == "12369"){
			$("input[name='complaintno-1']").prop("disabled",false);
			$("input[name='complaintno-2']").prop("disabled",false);
			$(".entry-list tr td label input").prop("disabled",false);
		}else{
			$("input[name='complaintno-1']").prop("disabled",true);
			$("input[name='complaintno-2']").prop("disabled",true);
			$(".entry-list tr td label input").prop("disabled",true);
		}
    });
	$(".entry-list tr td label input").on("click",function(){
		$(".entry-list tr td label input").prop("checked",false);
		$(this).prop("checked",true);
		var tdval = $(this).parents("tr").find(".entry-link").text();
		$("input[name='txtappellee']").val(tdval);
	});
});

$(window).resize(function () {
    //
    var height = $(window).height();
    var header = $(".header").height() + 20;
    var width = $(window).width();
    var left = $(".left").width();
    var title = $(".title").height();
    var poptitle = $(".popup-title").height();
    $(".section").height(height);
    $(".right").width(width - left);
    $(".content").height($(window).height() - title+45);
    $(".popup-content").height(height - poptitle - 20);

    //侧边栏
    $(".bar-icon").on("click", function () {
        if ($(this).is(".hidden")) {
            $(this).removeClass("hidden");
            $(".right").width(width - left);
            $(".bar-box").css({
                "margin-left": "310px"
            });
        } else {
            $(this).addClass("hidden");
            $(".right").width(width - left - 310);
            $(".bar-box").css({
                "margin-left": "0"
            });
        }
    });

});