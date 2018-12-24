class DenHa {
    constructor(options) {
        this.$options = options;
        this._data = options.data;
        this.$el = document.querySelector('body');
        Object.keys(options.data).forEach(key => this._proxy(key))
        Observer(options.data)
        watch(this, this._render.bind(this), this._update.bind(this))
    }

    _proxy(key) {
        const self = this
        Object.defineProperty(self, key, {
            configurable: true,
            enumerable: true,
            get: function proxyGetter() {
                return self._data[key]
            },
            set: function proxySetter(val) {
                self._data[key] = val
            }
        })
    }

    _update() {
        console.log("我需要更新");
        this._render.call(this)
    }

    _render() {
        this._bindText();
        this._bindList();
    }

    _bindText() {
        var textDOMs = this.$el.querySelectorAll('[dh-build]'),
            bindText;
        for (var i = 0; i < textDOMs.length; i++) {
            bindText = textDOMs[i].getAttribute('dh-build');
            let data = this._data[bindText];
            if (data) {
                textDOMs[i].innerHTML = data;
            }
        }
    }

    _bindList(){
        var textDOMs = this.$el.querySelectorAll('[dh-build]'),
    }
}


function Observer(data) {
    this.data = data;
    this.walk(data);
}

var p = Observer.prototype;
var arrayProto = Array.prototype
var arrayMethods = Object.create(arrayProto);
['push', 'pop', 'shift', 'unshift', 'splice', 'sort', 'reverse'].forEach(function(item) {
    Object.defineProperty(arrayMethods, item, {
        value: function mutator() {
            //缓存原生方法，之后调用
            console.log('array被访问');
            var original = arrayProto[item]
            var args = Array.from(arguments)
            original.apply(this, args)
            console.log(this);
        },
    })
})

p.walk = function(obj) {
    var value;
    for (var key in obj) {
        // 通过 hasOwnProperty 过滤掉一个对象本身拥有的属性 
        if (obj.hasOwnProperty(key)) {
            value = obj[key];
            // 递归调用 循环所有对象出来
            if (typeof value === 'object') {
                if (Array.isArray(value)) {
                    var augment = value.__proto__ ? protoAugment : copyAugment
                    augment(value, arrayMethods, key)
                    observeArray(value)
                }
                new Observer(value);
            }
            this.convert(key, value);
        }
    }
};

p.convert = function(key, value) {
    Object.defineProperty(this.data, key, {
        enumerable: true,
        configurable: true,
        get: function() {
            console.log(key + '被访问');
            return value;
        },
        set: function(newVal) {
            console.log(key + '被修改，新' + key + '=' + newVal);
            if (newVal === value) return;
            value = newVal;
        }
    })
};


function observeArray(items) {
    for (var i = 0, l = items.length; i < l; i++) {
        observe(items[i])
    }
}

// 数据重复Observer
function observe(value) {
    if (typeof(value) != 'object') return;
    var ob = new Observer(value)
    return ob;
}

// 辅助方法
function def(obj, key, val) {
    Object.defineProperty(obj, key, {
        value: val,
        enumerable: true,
        writable: true,
        configurable: true
    })
}

// 兼容不支持__proto__的方法
// 重新赋值Array的__proto__属性
function protoAugment(target, src) {
    target.__proto__ = src
}

//不支持__proto__的直接修改相关属性方法
function copyAugment(target, src, keys) {
    for (var i = 0, l = keys.length; i < l; i++) {
        var key = keys[i]
        def(target, key, src[key])
    }
}


var data = {};
var app = new Observer(data);
