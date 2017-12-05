$.fn.slideDown = function (speed, callback) {
    //获取元素position
    var position = this.css('position');
    this.show().css({
        position: 'absolute',
        visibility: 'hidden'
    });
    $('html,body').css({
        overflow: 'hidden',
        height: '100%'
    });
    //获取元素高度
    var height = this.height() === 0 ? $(window).height() : this.height();

    //-------通过伸缩元素高度实现动画-------
    return this.css({
       position: position,
       visibility: 'visible',
       overflow: 'auto',
       height: 0
    }).animate({ height: height, top: $(window).scrollTop() }, speed, null, callback);

    //-------通过移动元素相对位置实现动画-------
    // return this.css({
    //     top: -height,
    //     left: 0,
    //     position: position,
    //     visibility: 'visible',
    //     overflow: 'auto'
    // }).animate({ top: $(window).scrollTop() }, speed, null, callback);
};

$.fn.slideUp = function (speed, callback) {
    //获取元素position
    var position = this.css('position');
    this.show().css({
        position: 'absolute',
        visibility: 'auto'
    });
    $('html,body').css({
        overflow: '',
        height: ''
    });
    //获取元素高度
    var height = this.height();
    //-------通过伸缩元素高度实现动画-------
    return this.css({
       position: position,
       visibility: 'visible',
       overflow: 'hidden',
       height: height
    }).animate({ height: 0 }, speed, null, callback);

    //-------通过移动元素相对位置实现动画-------
    // return this.css({
    //     left: 0,
    //     position: position,
    //     visibility: 'visible',
    //     overflow: 'auto'
    // }).animate({ top: -height }, speed, null, callback);
};