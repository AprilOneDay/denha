var baseImgUrl = '/uploadfile'; //图片初始保存路径
var dhKey = 1;
var btnBlock = true;
var uploadUrl = '/admin/common/upload/up_file';
var dhToken = ''; // csrf token验证码
var dhData = {};



// 增加标识符
var addKey = function(event) {

        var key = $(event).attr('dh-key');
        if (!key) {
            $(event).attr('dh-key', dhKey);
        }

        dhKey++;
    }

    //文案常量
    ,
    ERROR_REPEAT_SUBMIT = '请勿重复提交',
    ERROR_AJAX_500 = '程序严重错误请求失败',
    ERROR_URL_IS_NULL = '请求URL不能为空',
    ERROR_IS_NOT_JSON = '返回结果非JSON格式',
    ERRRO_UPLOAD_IMG_MAX_NUM = 1,
    ERRRO_UPLOAD_IMG_MAX_MSG = '最多只能传' + ERRRO_UPLOAD_IMG_MAX_NUM + '张图片',
    ERROR_NOT_PARAM = '请上传参数'

    //判断通道是否堵塞 如果堵塞 返回提示文案 反之则变成堵塞
    ,
    checkBtnBlock = function(msg) {
        msg = !msg ? ERROR_REPEAT_SUBMIT : msg;
        if (!btnBlock) {
            layer.msg(msg);
            return false;
        } else {
            btnBlock = false;
        }

        return true;
    }

    /**
     * 上传插件
     * @date   2018-06-30T22:20:21+0800
     * @author ChenMingjiang
     * @param  {[type]}                 e        [上传资源对象]
     * @param  {[type]}                 data     [上传参数]
     * @param  {Function}               callback [回调函数]
     * @return {[type]}                          [description]
     */
    ,
    dhUpload = function(e, data, callback) {

        //获取资源
        var files = e.target.files || e.dataTransfer.files;
        var path = data.hasOwnProperty('path') ? data.path : ''; // 保存地址
        var type = data.hasOwnProperty('type') ? data.type : ''; // 支持类型
        var max_size = data.hasOwnProperty('max_size') ? data.max_size : ''; // 最大上传大小
        var width = data.hasOwnProperty('width') ? data.width : ''; // 剪切图片宽度
        var height = data.hasOwnProperty('height') ? data.height : ''; // 剪切图片高度

        xhr(uploadUrl, 'POST', {
            'file': files[0],
            'path': path,
            'max_size': max_size,
            'type': type,
            'width': width,
            'height': height
        }, function() {
            try {
                if (typeof(eval(callback)) == "function") {
                    var funs = callback;
                    funs.call(this, this);
                }
            } catch (e) {
                callback.call(this);
            }
        });
    }

    /**
     * ajax提交
     * @date   2018-06-28T11:41:59+0800
     * @author ChenMingjiang
     * @param  {[type]}                 url      [提交地址]
     * @param  {[type]}                 method   [提交类型]
     * @param  {[type]}                 data     [提交数据]
     * @param  {Function}               callback [回调函数]
     * @param  {[type]}                 options  [配置参数]
     * @return {[type]}                          [description]
     */
    ,
    xhr = function(url, method, data, callback, options) {

        var xhr = window.XMLHttpRequest ? new XMLHttpRequest() : //针对IE进行功能性检测
            window.ActiveXObject ? new ActiveXObject("Microsoft.XMLHTTP") : undefined;
        var formData = new FormData();
        var progressHtml = '<div class="progress" style="margin:0px; margin-top:5px;"><div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 1%;">1%</div></div>';

        if (!options) {
            options = {};
        }

        // 是否json数据
        var isJson = options.hasOwnProperty('isJson') ? options.isJson : true;
        // 是否开启进度条
        var isLoad = options.hasOwnProperty('isLoad') ? options.isLoad : true;
        // 是否开启CSRF防御
        var isCSRF = options.hasOwnProperty('isCSRF') ? options.isCSRF : true;


        xhr.open(method, url, true);

        if (isCSRF) {
            xhr.setRequestHeader('CSRF-TOKEN', dhToken);
        }

        xhr.setRequestHeader('X-REQUESTED-WITH', 'XMLHttpRequest');
        xhr.upload.onprogress = progressHandlingFunction; //【上传进度调用方法实现】
        xhr.upload.onloadstart = function() {
            if (isLoad) {
                layer.alert(progressHtml);
            }
        };
        xhr.onload = function() {};
        xhr.onreadystatechange = function() {
            btnBlock = true; //恢复通道
            if (xhr.readyState == 4 && (xhr.status == 200 || xhr.status == 304)) { // 304未修改
                var result = xhr.responseText;
                if (isJson) {
                    try {
                        result = JSON.parse(xhr.responseText);
                    } catch (e) {
                        return layer.alert(ERROR_IS_NOT_JSON + xhr.responseText);
                    }
                }

                callback.call(result);
            } else if (xhr.readyState == 4 && (xhr.status == 500 || xhr.status == 404)) {
                return layer.msg(ERROR_AJAX_500);
            }
        };

        if (data) {

            // 转换数组
            data = arraySort(data);

            for (var key in data) {
                try {
                    if (typeof data[key] === 'object' && data[key].hasOwnProperty('name') && data[key].hasOwnProperty('value')) {
                        formData.append(data[key]['name'], data[key]['value']);
                    } else {
                        formData.append(key, data[key]);
                    }
                } catch (e) {
                    formData.append(key, data[key]);
                }
            };
        }

        //上传进度回调函数：  
        function progressHandlingFunction(e) {
            if (e.lengthComputable) {
                $('progress').attr({
                    value: e.loaded,
                    max: e.total
                }); //更新数据到进度条  
                var percent = parseInt(e.loaded / e.total * 100);
                $('.progress-bar').css('width', percent + '%');
                $('.progress-bar').text(percent + '%');
            }
        }


        xhr.send(formData);
    }


    //ajax封装Html
    ,
    dhAjax = function(event) {
        var config = new Object();
        var tagName = $(event).get(0).tagName; //获取元素类型
        var attr = $(event).context.attributes; //获取执行参数
        var form = $(event).parents('.dh-from'); //执行from范围
        var debug = bool($(event).attr('dh-debug'));
        var data = new Object(),
            inputName, inputType, inputValue;

        config.confim_tips = $(event).attr('dh-confirm'); //预先提示文案
        config.url = $(event).attr('dh-url'); //执行地址
        config.true_reload = $(event).attr('dh-true-reload'); //是否刷新当前页面
        config.true_url = $(event).attr('dh-true-url'); //执行成功跳转地址
        config.false_url = $(event).attr('dh-false-url'); //执行失败跳转地址
        config.is_async = $(event).attr('dh-async'); //是否弹出新窗口 true新窗口执行 false当前页面执行
        config.alert_time = Number($(event).attr('dh-alert-time')); //弹框显示时间
        config.method = $(event).attr('dh-method'); //请求方式 POST GET PUT DEvarE
        config.is_write = $(event).attr('dh-write'); //GET请求伪静态开启 true开启 false关闭 默认开启
        config.is_msg = $(event).attr('dh-msg'); // 是否开启弹出提示信息 true开启 false关闭 默认开启

        // method默认GET
        config.method = !config.method ? 'GET' : config.method.toUpperCase();
        // 默认显示1秒
        config.alert_time = !config.alert_time ? 1000 : config.alert_time;
        // 默认执行成功刷新
        config.true_reload = !config.true_reload ? true : bool(config.true_reload);
        // 默认不弹新窗口
        config.is_write = !config.is_write ? true : bool(config.is_write);
        // 默认开启提示信息
        config.is_msg = !config.is_msg ? true : bool(config.is_msg);


        if (!config.url) {
            return layer.msg(ERROR_URL_IS_NULL);
        }

        function bool(value) {
            if (!value || value == '' || value == 0 || value == '0' || value == 'false' || value == false) {
                return false;
            }

            return true;
        }

        //获取参数
        for (var i = 0; i < attr.length; i++) {
            if (attr[i].localName.indexOf('data') !== -1) {
                var name = attr[i].localName.substr(5, attr[i].localName.length).replace('-', '_');
                data[name] = attr[i].value;
            }
        }

        //获取默认值
        if (tagName == 'INPUT' || tagName == 'SELECT') {
            inputName = $(event).attr('name');
            inputName = inputName.replace('-', '_');
            if (tagName == 'INPUT') {
                inputType = $(event).attr('type');
                if (inputType == 'checkbox') {
                    if ($(event).prop('checked') == true) {
                        data[inputName] = $(event).attr('dh-true-value');
                    } else {
                        data[inputName] = $(event).attr('dh-false-value');
                    }

                } else {
                    inputValue = $(event).val();
                    if (inputName) {
                        data[inputName] = inputValue;
                    }
                }
            }
        }

        if (debug) {
            console.log('-----执行时间-------');
            console.log(new Date());
            console.log('-----获取debug状态-------');
            console.log(debug);
            console.log('-----获取参数信息-------');
            console.log(config);
            console.log('-----DATA信息-------');
            console.log(data);
            console.log('-----END-------');
            return;
        }

        if (config.confim_tips) {
            layer.confirm(config.confim_tips, {
                btn: ['确定', '取消'] //按钮
            }, function() {
                submit();
            }, function() {});
        } else {
            submit();
        }

        function submit() {

            //直接弹出信息窗口
            if (config.is_async != undefined) {
                layer.closeAll();

                //附带参数
                var asyncParam = '';
                for (var key in data) {
                    //开启GET伪静态
                    if (config.is_write) {
                        asyncParam += key + data[key] + '-';
                    } else {
                        asyncParam += key + '=' + data[key] + '&';
                    }
                }

                asyncParam = asyncParam.length > 1 ? asyncParam.substr(0, asyncParam.length - 1) : '';
                if (asyncParam) {
                    //开启GET伪静态
                    if (config.is_write) {
                        var paramUri = config.url.split('.');
                        var param = config.url.split('');
                        var lastParam = param[param.length - 1];
                        var checkArray = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
                        // console.log(checkArray.indexOf(param[param.length - 2]));
                        // console.log(lastParam);
                        // console.log(checkArray.indexOf(lastParam));
                        // return;
                        //最后 是参数/ 结尾
                        if (lastParam == '/' && checkArray.indexOf(param[param.length - 2]) !== -1) {
                            config.url = config.url.substr(0, config.url.length - 1) + '-' + asyncParam + '/';
                        }
                        //最后一位是 /结尾
                        else if (lastParam == '/') {
                            config.url += asyncParam + '/';
                        }
                        //最后一位是非字母 非汉字
                        else if (checkArray.indexOf(lastParam) === -1 && escape(lastParam).indexOf("%u") < 0) {
                            config.url += '/' + asyncParam + '/';
                        }
                        //最后一位是数字的
                        else if (checkArray.indexOf(lastParam) !== -1) {
                            config.url += '-' + asyncParam + '/';
                        }
                        //最后一位是汉字的
                        else if (escape(lastParam).indexOf("%u") > 0) {
                            config.url += '-' + asyncParam + '/';
                        }

                    } else {
                        config.url += config.url.indexOf('?') !== '-1' ? '?' + asyncParam : '&' + asyncParam;
                    }
                }

                if (bool(config.is_async)) {
                    window.open(config.url);
                } else {
                    window.location.href = config.url;
                }

                return;
            }

            //处理通讯堵塞
            if (!checkBtnBlock()) {
                return false;
            }

            //处理checked 未选中不传值的问题
            $(form).find('input[type=checkbox]').each(function() {
                if ($(this).attr('dh-native')) {
                    return true;
                }

                falseValue = typeof($(this).attr('dh-false-value')) != 'undefined' ? $(this).attr('dh-false-value') : 0;
                trueValue = typeof($(this).attr('dh-true-value')) != 'undefined' ? $(this).attr('dh-true-value') : 0;
                if (!$(this).prop('checked')) {
                    $(this).prop('checked', true);
                    $(this).val(falseValue);
                } else {
                    $(this).val(trueValue);
                }
            })

            //ajax提交
            xhr(config.url, config.method, data, function() {
                submitThen(this);
            }, {
                isLoad: false,
            });
        }

        function submitThen(result) {
            if (config.is_msg) {
                layer.msg(result.msg);
            }

            //成功跳转地址
            if (result.status && config.true_url) {
                setTimeout(function() {
                    window.location.href = config.true_url;
                }, config.alert_time);

            } //成功后刷新当前页面
            else if (result.status && config.true_reload) {
                setTimeout(function() {
                    location.reload();
                }, config.alert_time);
            }
            //错误信息跳转地址
            else if (!result.status && config.false_url) {
                setTimeout(function() {
                    window.location.href = config.false_url;
                }, config.alert_time);
            }
        }
    }

    // 上传图片
    ,
    dhUploadImg = function(event) {

        //增加标记
        addKey(event);

        var _this = event;
        var config = {};
        config.name = $(_this).attr('dh-name');
        config.maxNum = Math.max($(_this).attr('dh-max'), 1);
        config.path = $(_this).attr('dh-path');
        config.imgWidth = $(_this).attr('dh-img-width');
        config.imgHeight = $(_this).attr('dh-img-height');
        config.content = '<div class="dh-img-list"><input type="file" style="display:none;" id="' + config.name + '"  multiple="multiple"><div class="img-list" style="margin-top:20px;"><ul></ul></div></div>';
        config.value = $(_this).attr('dh-value');
        config.dhKey = $(_this).attr('dh-key');
        if (config.value != '' && typeof(config.value) != 'undefined') {
            config.value = config.value.split(',');
        }


        config.imgWidth = config.imgWidth ? config.imgWidth : '150';
        config.imgHeight = config.imgHeight ? config.imgHeight : '100';

        //渲染上传组件
        $(_this).parent().find('.dh-img-list').remove();
        $(_this).parent().append(config.content);

        //渲染初始图片
        for (var i = 0; i < config.value.length; i++) {
            config.value[i] = baseImgUrl + '/' + config.path + '/' + config.value[i];
            var imgContent = '<li style="float:left;width:150px;height:100px;margin-left:10px;margin-top:10px;"><img src="' + config.value[i] + '" width="' + config.imgWidth + '" height="' + config.imgHeight + '" style="border:1px solid #ccc;"> <a style="float:right;margin-top:-100px;margin-right:2px;cursor: pointer;" class="btn-del-img"><i class="glyphicon glyphicon-remove"></i></a></li>';
            $(_this).parent().find('.img-list ul').append(imgContent);
        }

        //上传
        $(_this).click(function() {
            $(_this).parent().find('input[id="' + config.name + '"]').wrap('<form>').closest('form').get(0).reset();
            $(_this).parent().find('input[id="' + config.name + '"]').trigger('click');
        })

        //转换图片url
        $(_this).parent().find('input[id="' + config.name + '"]').change(function(e) {
            var imgLength = $(_this).parent().find('.img-list ul img').length;
            var files = e.target.files || e.dataTransfer.files;
            if (config.maxNum && config.maxNum < files.length + imgLength) {
                ERRRO_UPLOAD_IMG_MAX_NUM = config.maxNum;
                return layer.msg(ERRRO_UPLOAD_IMG_MAX_MSG);
            }

            for (var i = 0; i < files.length; i++) {
                xhr(uploadUrl, 'POST', {
                    'file': files[i],
                    'path': config.path,
                    'max_size': 100
                }, function() {
                    if (this.status) {
                        var url = baseImgUrl + '/' + config.path + '/' + this.data.name[0];
                        var content = '<li style="float:left;width:150px;height:100px;margin-left:10px;margin-top:10px;"><img src="' + url + '" width="150" height="100" style="border:1px solid #ccc;"> <a style="float:right;margin-top:-100px;margin-right:2px;cursor: pointer;" class="btn-del-img"><i class="glyphicon glyphicon-remove"></i></a></li>';
                        $(_this).parent().find('.img-list ul').append(content);
                    }
                    bindValue();
                    return layer.msg(this.msg);

                });
            }
        })

        //绑定初始值
        bindValue();

        //删除照片
        $('body').on('click', '.btn-del-img', function() {
            $(this).parent().remove();
            bindValue();
        })

        function bindValue() {
            var data = new Array();
            $(_this).parent().find('.img-list').find('img').each(function() {
                var path = $(this).attr('src');
                path = path.substring(path.lastIndexOf("/") + 1, path.length);
                if (path != 'nd.jpg') {
                    data[data.length] = path.substring(path.lastIndexOf("/") + 1, path.length);
                }
            })

            var content = '<input type="hidden" name="' + config.name + '" value="' + data.join(',') + '" />';
            $(_this).parent().find('input[name="' + config.name + '"]').remove();
            $(_this).parent().append(content);
        }
    }

    // select联动获取信息
    ,
    dhLinkage = function(event, target) {

        var _this = event;

        var value = $(_this).val(); //选择的id
        var valueAttr = $(_this).attr('dh-attr'); //绑定类型 默认绑定 dh-content 中的id值 如果修改
        var url = $(_this).attr('dh-url'); //POST请求地址
        var parentEl = $(_this).attr('dh-parent-el'); //渲染父级别DOM 防止多个样式执行同时渲染
        var el = $(_this).attr('dh-el'); //渲染DOM
        var options = $(_this).attr('dh-content'); //渲染默认信息JSON格式
        var initValue = $(_this).attr('dh-init-value'); //初始默认值
        var initName = $(_this).attr('dh-init-name'); //初始默认文案
        var defaultValue = $(_this).attr('dh-selected'); //初始默认选项
        var content, optionsValue, likeage;

        //绑定类型 默认绑定 dh-content 中的id值 如果修改
        valueAttr = valueAttr ? valueAttr : 'id';

        //ajax请求
        if (url) {
            $.post(url, {
                value: value
            }, function(result) {
                if (!result.status) {
                    return layer.msg(result.msg);
                }
                optionsValue = result.data;
            }, "json");
        }
        //直接渲染
        else {
            options = JSON.parse(options);

            for (var key in options) {
                if (defaultValue) {
                    if (options[key][valueAttr] == value) {
                        optionsValue = options[key]['child'];
                    }
                }

                if (value && target == 'change') {
                    if (options[key][valueAttr] == value) {
                        optionsValue = options[key]['child'];
                        break;
                    }
                }

                if (!value && target == 'change') {
                    optionsValue = new Array();
                }

            }
        }

        if ($(el).css('display') == 'none') {
            $(el).css('display', 'block');
        }

        if (parentEl) {
            likeage = $(_this).parents(parentEl).find(el).find('select');

        } else {
            likeage = $(el).find('select');
        }


        likeage.html('');

        //绑定默认值
        if (initName) {
            likeage.append('<option value="' + initValue + '">' + initName + '</option>');
        }

        for (var key in optionsValue) {
            content = '<option value="' + optionsValue[key][valueAttr] + '">' + optionsValue[key]['name'] + '</option>';
            likeage.append(content);
        }
    }

    //绑定checkBox
    ,
    bulidCheckbox = function(event) {

        var data = $(event).val();
        var dhData = $(event).attr('dh-true-value');
        var checkedArray = $(event).attr('dh-checked');
        var checkedValue = '';

        data = dhData ? dhData : data;

        if (typeof(checkedArray) != 'undefined' && checkedArray != '') {
            checkedValue = checkedArray.split(",");
        }

        if (checkedValue) {
            if (jQuery.inArray(data, checkedValue) >= 0) {
                $(event).attr("checked", "checked");
            }
        }
    },

    // 将 a[b][] a[c][] a[d][] 转换成 a[0][b] a[0][c] a[0][d] 存在多个的时候才转换
    arraySort = function(data) {
        // 处理数组
        var $reg = new RegExp(/(.*?)\[(.*?)\]\[\]/);
        var arrNum = []; // 记录数组排序
        var arrValue = []; // 记录数组出现次数 只有一个值的则正常显示
        var arrData = [];
        var arrKey = [];
        for (var i = 0; i < data.length; i++) {
            var isArr = data[i].name.match($reg);
            if (isArr) {

                var arrDataKey = isArr[1];
                var arrDataValue = isArr[2];
                if (arrData.hasOwnProperty(arrDataKey)) {
                    if (!arrData[arrDataKey].hasOwnProperty(arrDataValue)) {
                        arrData[arrDataKey].push(arrDataValue);
                    }
                } else {
                    arrData[arrDataKey] = [];
                    arrData[arrDataKey].push(arrDataValue);
                }

                arrKey[i] = isArr;
            }
        }

        for (var i in arrKey) {
            var isArr = arrKey[i];
            if (arrNum.hasOwnProperty(isArr[0])) {
                arrNum[isArr[0]] += 1;
            } else {
                arrNum[isArr[0]] = 0;
            }

            if (arrData[arrKey[i][1]].length > 1) {
                data[i].name = isArr[1] + '[' + arrNum[isArr[0]] + '][' + isArr[2] + ']';
            }
        }

        return data;
    }
    //绑定radio值
    ,
    dhRadio = function(el) {
        var _this = el;
        //不进行渲染
        var native = $(_this).attr('dh-native');
        if (native) {
            return true;
        }

        if ($(_this).attr('dh-radio')) {
            data = $(_this).attr('dh-radio');
        }

        $(_this).find('input[type=radio]').each(function() {
            if ($(this).attr('value') == data) {
                $(this).attr("checked", "checked");
            }
        })
    }



/** 待重构代码 */
$(document).ready(function() {


    //如果某个接口返回失败了 或存在BUG哦
    var btnBlock = true; //ajax提交堵塞 ture可提交 false堵塞中不可提交


    //绑定初试信息
    $('select').each(function() {
        var data = $(this).attr('dh-selected');
        if (data) {
            $(this).val(data);
        }
    });

    //渲染默认值
    $('.btn-linkage').each(function() {
        dhLinkage(this);
    });

    //绑定初试信息
    $('select').each(function() {
        var data = $(this).attr('dh-selected');
        if (data) {
            $(this).val(data);
        }
    });

    $(".dh-radio").each(function() {
        dhRadio(this);
    })

    $(".radio").each(function() {
        dhRadio(this);
    })

    //下拉联动
    $('.btn-linkage').change(function() {
        dhLinkage(this, 'change');
    })


    //绑定checkbox
    $('.checkbox').each(function() {
        bulidCheckbox(this);
    })

    $('.dh-checkbox').each(function() {
        bulidCheckbox(this);
    })

    //checkBox单选
    $('.dh-checkbox-radio').each(function() {
        var _this = this;
        var name = $(this).attr('name');
        $(this).click(function() {
            $('input[name="' + name + '"]').prop('checked', false);
            $(this).prop('checked', true);
        })
    });


    //tips提示
    $('[dh-tooltip]').mouseover(function() {
        var msg = $(this).attr('dh-tooltip');
        layer.tips(msg, this, {
            tips: [1, '#3595CC'],
            time: 10000
        });
    })
    $('[dh-tooltip]').mouseout(function() {
        layer.closeAll('tips');
    })



    //打开弹出
    $('.btn-open').click(function() {
        var href = $(this).attr('dh-url');
        var title = $(this).attr('dh-title');
        var width = $(this).attr('dh-width');
        var height = $(this).attr('dh-height');

        if (!title) {
            title = $(this).text();
        }
        if (!width) {
            width = '80%';
        }
        if (!height) {
            height = '80%';
        }
        if (!href) {
            layer.msg('请设置dh-url的值');
            return false;
        }

        //iframe层
        layer.open({
            type: 2,
            title: title,
            shadeClose: false,
            shade: 0.8,
            fixed: true,
            maxmin: true,
            area: [width, height],
            content: [href] //iframe的url
        });
    })

    //提交信息
    $('.btn-comply').click(function() {

        var form = $(this).parents('.form-horizontal');

        if (!form.length) {
            form = $(this).parents('.dh-form');
        }

        var url = form.attr('action');
        var trueUrl = $(this).attr('dh-true-url'); // 执行成功跳转地址
        var falseUrl = $(this).attr('dh-false-url'); // 执行失败跳转地址
        var newUrl = $(this).attr('dh-url'); // 新的提交地址
        var falseValue, trueValue, data, params = [];

        if (newUrl) {
            url = newUrl;
        }

        //checkBox赋值
        checkBoxChecked();

        data = form.serializeArray();

        if (data.length < 1) {
            return layer.msg(ERROR_NOT_PARAM);
        }

        //处理通讯堵塞
        if (!checkBtnBlock()) {
            return false;
        }


        //ajax请求
        xhr(url, 'POST', data, function() {
            submitThen(this);
        }, {
            isLoad: false,
        });

        function submitThen(result) {
            layer.msg(result.msg);

            //恢复checkbox 未选中的样式
            checkBoxChecked();

            if (result.status) {
                setTimeout(function() {
                    var index;
                    try {
                        index = parent.layer.getFrameIndex(window.name); //获取窗口索引
                    } catch (e) {

                    }

                    if (index) {
                        parent.location.reload();
                        parent.layer.close(index);
                    } else {
                        if (trueUrl) {
                            window.location.href = trueUrl;
                        } else {
                            location.reload();
                        }
                    }
                }, 1000);
            } else if (!result.status && falseUrl) {

                setTimeout(function() {
                    window.location.href = falseUrl;
                }, 1000);
            }
        }

        //处理checked 未选中不传值的问题 并恢复未选中样式
        function checkBoxChecked() {
            $(form).find('input[type=checkbox]').each(function() {
                if ($(this).attr('dh-native')) {
                    return true;
                }

                if (typeof($(this).attr('dh-false-value')) == 'undefined' && typeof($(this).attr('dh-true-value')) == 'undefined') {
                    return true;
                }

                falseValue = typeof($(this).attr('dh-false-value')) != 'undefined' ? $(this).attr('dh-false-value') : 0;
                trueValue = typeof($(this).attr('dh-true-value')) != 'undefined' ? $(this).attr('dh-true-value') : 0;

                if (!$(this).prop('checked')) {
                    $(this).prop('checked', true);
                    $(this).val(falseValue);
                } else {
                    $(this).val(trueValue);
                }
            })
        }
    })

    //提交post信息
    $('.btn-del').click(function() {
        //获取选中的ID
        var len = $("[name='ids']:checked").length;
        var ids = '';
        var count = flag = 0;
        if (len < 1) {
            layer.msg('请选择勾选项');
            return;
        }
        $("[name='ids']:checked").each(function(index, element) {
            ids += $(this).val() + ",";
            count++;
            if (count == len) {
                flag = 1;
                ids = ids.substring(0, ids.length - 1);
                $('.btn-del').attr('data-id', ids);
            }

        });
        if (flag == 1) {

            dhAjax(this);
        }

    })

    //提交Ajax信息
    $('.btn-ajax').click(function() {
        dhAjax(this);
    })

    //提交post信息
    $('.change-ajax').change(function() {
        dhAjax(this);
    })

    //提交post信息
    $('.focus-ajax').focus(function() {
        dhAjax(this);
    })

    // 全选
    $('.dh-checkbox-all').click(function() {
        if ($(this).prop('checked') === true) {
            $('.dh-checkbox-items').each(function() {
                $(this).prop('checked', true);
            })
        } else {
            $('.dh-checkbox-items').each(function() {
                $(this).prop('checked', false);
            })
        }
    })

    // 取消子选项则 取消全选
    $('.dh-checkbox-items').click(function() {
        if ($(this).prop('checked') === false) {
            $('.dh-checkbox-all').prop('checked', false);
        }
    })


    //渲染编辑器
    $('.ue-editor').each(function() {
        var id = $(this).attr('id');
        UE.getEditor(id);
    })

    //渲染时间插件
    $('.data-time').each(function() {

        var time = $(this).val(); //int
        var min = $(this).attr('dh-min'); // string int
        var max = $(this).attr('dh-max'); // string int
        var format = $(this).attr('dh-format');
        var type = $(this).attr('dh-type'); //year month date time datetime
        var isNull = $(this).attr('dh-isnull'); //year month date time datetime


        if (!format) {
            format = 'yyyy-MM-dd';
        }
        if (!min) {
            min = '1900-1-1';
        }
        if (!max) {
            max = '2099-12-31';
        }
        if (!type) {
            type = 'date';
        }

        if (time.indexOf('-') === -1) {
            time = time * 1000;
            time = new Date(time)
        } else if (!time) {
            time = new Date();
        }

        if (!isNull) {
            laydate.render({
                elem: this, //指定元素
                value: time,
                format: format,
                type: type,
                min: min,
                max: max,
            });
        } else {
            laydate.render({
                elem: this, //指定元素
                format: format,
                type: type,
                min: min,
                max: max,
            });
        }

    })

    //动态加载更多
    $('.dh-loadmore').on('click', function() {
        var url = $(this).attr('dh-url'); // 渲染链接
        var page = Number($(this).attr('dh-page')); // 翻页页码
        var elem = $(this).attr('dh-elem'); // 渲染对象
        var text = $(this).attr('dh-text'); // 加载完后提示文案
        var thisPage = Number($(this).attr('dh-this-page')); // 动态翻页
        var callback = $(this).attr('dh-callback'); // 回调方法
        var _this = this;

        if (!thisPage) {
            thisPage = page + 1;
        } else {
            thisPage += 1;
        }

        $(this).attr('dh-this-page', thisPage);

        if (!text) {
            text = '没有更多了';
        }

        if (!url) {
            return layer.msg('请绑定需要加载url');
        }

        if (!elem) {
            return layer.msg('请绑定需要渲染对象');
        }

        xhr(url + '?pageNo=' + thisPage, 'GET', {
            pageNo: thisPage
        }, function() {
            if (this.length > 10) {
                $(elem).append(this);
            } else {
                $(_this).html(text);
            }

            if (callback && typeof(eval(callback)) == "function") {
                eval(callback + "();");
            }

        }, {
            isLoad: false,
            isJson: false
        });

    })

    //关闭弹窗
    $('#btn-close').on('click', function() {
        var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
        parent.layer.close(index);
    });

    //渲染图片上传插件
    $('.btn-ablum').each(function() {
        dhUploadImg(this);
    })



    //上传文件

    $('.btn-files').each(function() {
        uploadfiles(this);
    })

})

var filesID = 0;
var uploadfiles = function(el) {

    filesID++;
    var id = filesID;
    var _this = el;

    var name = $(_this).attr('dh-name');
    var path = $(_this).attr('dh-path');
    var type = $(_this).attr('dh-type');
    var value = $(_this).attr('dh-value');
    var maxNum = Number($(_this).attr('dh-max'));
    var content = '<input type="file" style="display:none;" id="files_click_' + id + '"  multiple="multiple"><input type="hidden" id="files_content_' + id + '" name="' + name + '" >';
    var progress = '<div class="progress" style="margin:0px; margin-top:5px;"><div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 1%;">1%</div></div>';


    // DOM渲染文件路径
    var fileHtml = function(value) {
        console.log($('.files_lists_' + id).length);
        if ($('.files_lists_' + id).length >= 1) {
            var html = '<div class="form-inline form-group"><input type="text" value="' + value + '"  class="form-control files_lists_' + id + '" style="margin-left: 10px;margin-right: 10px;"> <a href="javascript:;" class="form-control-static del-files">删除</a></div>';
        } else {
            var html = '<div class="form-inline"><input type="text" value="' + value + '"  class="form-control files_lists_' + id + '" style="margin-left: 10px;margin-right: 10px;"> <a href="javascript:;" class="form-control-static del-files">删除</a></div>';
        }

        return html;
    }


    // DOM渲染上传保存信息 和上传插件
    $(_this).parent().append(content);

    var btnClick = $('#files_click_' + id);
    var fileContent = $('#files_content_' + id);

    //DOM 最终上传input
    var initValue = function() {
        var html = '';
        $(_this).parent().parent().find('.files_lists_' + id).each(function() {
            html += ',' + $(this).val();
        })

        html = html.substring(1, html.length);

        $(fileContent).val(html);
    }

    if (value != '' && value != null) {
        var tmpValue = value.split(',');
        for (var key in tmpValue) {
            $(_this).parent().parent().find('.col-sm-8').append(fileHtml(tmpValue[key]));
            initValue();
        }
    } else {
        value = '';
    }


    //上传
    $(_this).click(function() {

        //判断是否达到最大上传数量
        if ($('.files_lists_' + id).length >= maxNum && maxNum > 0) {
            return layer.msg('只可上传' + maxNum + '个文件');
        }

        $(btnClick).wrap('<form>').closest('form').get(0).reset();
        $(btnClick).trigger('click');
    })

    $(btnClick).change(function(e) {
        //获取资源
        var files = e.target.files || e.dataTransfer.files;
        //资源赋值
        var formData = new FormData();
        formData.append('file', files[0]);
        formData.append('path', path);
        formData.append('type', type);

        //ajax异步上传  
        $.ajax({
            url: uploadUrl,
            type: 'POST',
            data: formData,
            dataType: 'json',
            contentType: false, //必须false才会自动加上正确的Content-Type  
            processData: false, //必须false才会避开jQuery对 formdata 的默认处理  
            xhr: function() { //获取ajaxSettings中的xhr对象，为它的upload属性绑定progress事件的处理函数
                //移除之前的上传进度条
                $(_this).parent().find('.progress').remove();
                //添加现在的进度条
                layer.alert(progress);
                myXhr = $.ajaxSettings.xhr();
                if (myXhr.upload) {
                    //检查upload属性是否存在  
                    //绑定progress事件的回调函数  
                    myXhr.upload.addEventListener('progress', progressHandlingFunction, false);
                }
                return myXhr; //xhr对象返回给jQuery使用  
            },
            success: function(result) {
                if (result.status) {
                    var url = '/uploadfile/' + path + '/' + result.data.name[0];
                    value = value + ',' + url;
                    $(_this).parent().parent().find('.col-sm-8').append(fileHtml(url));
                    initValue();
                }

                return layer.msg(result.msg);
            },
        });

        //上传进度回调函数：  
        function progressHandlingFunction(e) {
            if (e.lengthComputable) {
                $('progress').attr({
                    value: e.loaded,
                    max: e.total
                }); //更新数据到进度条  
                var percent = parseInt(e.loaded / e.total * 100);
                $('.progress-bar').css('width', percent + '%');
                $('.progress-bar').text(percent + '%');
            }
        }
    });


    //删除已上传文件
    $('body').on('click', '.del-files', function() {
        $(this).parent().find(fileContent).val();
        $(this).parent().remove();
        initValue();
    })
}

/** end */