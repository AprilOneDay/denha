+function(){
    var timer=null,time=3000,duration=200,index=0;
    function active(){
        $("[data-type=img]").animate({
            left:-index*10+"rem"
        },duration,function(){
            index++;
            $("[data-type=circle]>span:nth-child("+index+")").addClass("hover").siblings().removeClass("hover");
            if(index===4){
                $("[data-type=img]").css("left",0);
                index=1;
                $("[data-type=circle]>span:nth-child("+index+")").addClass("hover").siblings().removeClass("hover");
            }
        });
    }
    active();
    timer=setInterval(active,time);
    $("[data-type=circle]>span").on("click",function(){
        clearInterval(timer);
        var $index=$(this).index();
        $(this).addClass("hover").siblings().removeClass("hover");
        index=$index;
        active();
        timer=setInterval(active,time);
    })
}();