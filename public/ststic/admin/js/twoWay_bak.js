class DenHa {
    constructor(options) {
        this.$el = document.querySelector('body');
        this.$options = options;
        this.data = options.data;
        this.liststpl = {};
        Object.keys(options.data).forEach(key => this._proxy(key));
        new Observer(this.data);
        new Watcher(this, this._update.bind(this), this._render.bind(this));
    }

    _proxy(key) {
        const self = this
        Object.defineProperty(self, key, {
            configurable: true,
            enumerable: true,
            get: function proxyGetter() {
                // console.log(key + '被访问');
                return self.data[key]
            },
            set: function proxySetter(val) {
                // console.log(key + '被修改');
                self.data[key] = val
            }
        })
    }

    _update() {
        this._render.call(this)
    }

    _render() {
        console.log('执行数据渲染')
        this._bindText();
        this._bindList();
    }

    _bindText() {
        var textDOMs = this.$el.querySelectorAll('[dh-bulid]'),
            bindData, type, data;
        for (var i = 0; i < textDOMs.length; i++) {
            bindData = textDOMs[i].getAttribute('dh-bulid');
            type = textDOMs[i].nodeName;
            data = this.data[bindData];
            switch (type) {
                case 'IMG':
                    textDOMs[i].setAttribute('src', data);
                    break;
                case 'INPUT':
                    textDOMs[i].value = data;
                    break;
                default:
                    textDOMs[i].innerHTML = data;
            }
        }
    }

    _bindList() {
        var textDOMs = this.$el.querySelectorAll('[dh-for]'),
            bindData, data, newDisplayHtml, regExp, assignDataValue, assignData, content;
        for (var i = 0; i < textDOMs.length; i++) {
            bindData = textDOMs[i].getAttribute('dh-for');
            data = this.data[bindData].slice();

            if (!this.liststpl[bindData]) {
                var tplData = {};
                regExp = new RegExp(/{{(.*?)}}/g);

                this.liststpl[bindData] = {
                    display: textDOMs[i].parentNode,
                    displayHtml: textDOMs[i].parentNode.innerHTML,
                    keyValue: textDOMs[i].getAttribute('dh-val') || 'v',
                    assignData: textDOMs[i].parentNode.innerHTML.match(regExp),
                }

                assignDataValue = [];
                for (var key in this.liststpl[bindData].assignData) {
                    assignDataValue[key] = this.liststpl[bindData].assignData[key].replace('{{', '');
                    assignDataValue[key] = assignDataValue[key].replace('}}', '');
                    assignDataValue[key] = assignDataValue[key].replace(this.liststpl[bindData].keyValue + '.', '');
                }
                this.liststpl[bindData].assignDataValue = assignDataValue;

            }

            newDisplayHtml = '';
            var tpl = this.liststpl[bindData];
            tpl.display.innerHTML = '';
            if (data) {
                for (var e, i = 0, l = data.length; i < l; i++) {
                    if (data[i]) {
                        content = tpl.displayHtml;
                        for (var kk in tpl.assignData) {
                            content = content.replace(tpl.assignData[kk], data[i][tpl.assignDataValue[kk]]);
                        }
                        newDisplayHtml += content;
                    }
                }

                tpl.display.innerHTML = newDisplayHtml;
            }
        }
    }
}


/*----------------------------------------处理数组------------------------------------*/
const arrayProto = Array.prototype
const arrayMethods = Object.create(arrayProto);
[
    'push',
    'pop',
    'shift',
    'unshift',
    'splice',
    'sort',
    'reverse'
].forEach(item => {
    Object.defineProperty(arrayMethods, item, {
        value: function mutator() {
            //缓存原生方法，之后调用
            const original = arrayProto[item]
            var args = Array.from(arguments)
            original.apply(this, args)
            const ob = this.__ob__
            ob.dep.notify() // 通知更新视图
        },
    })
})

/*----------------------------------------Dep---------------------------------------*/
var depUid = 0

class Dep {
    constructor() {
        this.id = depUid++
            // 存放所有的监听watcher
            this.subs = []
    }

    //添加一个观察者对象
    addSub(Watcher) {
        this.subs.push(Watcher)
    }

    removeSub(Watcher) {
        target.$off(this.subs, Watcher)
            // remove(this.subs, sub)
    }

    //依赖收集
    depend() {
        //Dep.target 作用只有需要的才会收集依赖
        if (Dep.target) {
            Dep.target.addDep(this)
        }
    }

    // 调用依赖收集的Watcher更新
    notify() {
        const subs = this.subs.slice()
        for (var i = 0, l = subs.length; i < l; i++) {
            subs[i].update()
        }
    }
}

// 为Dep.target 赋值
function pushTarget(Watcher) {
    Dep.target = Watcher
}

/* ----------------------------------------Watcher------------------------------------*/
var watcherUid = 0;
class Watcher {
    constructor(vm, expOrFn, cb, options) {
        this.id = ++watcherUid
            // 传进来的对象 例如Vue
        this.vm = vm
            // 在Vue中cb是更新视图的核心，调用diff并更新视图的过程
        this.cb = cb
            // 收集Deps，用于移除监听
        this.deps = []
        this.newDeps = []
        this.depIds = []
        this.newDepIds = []
        this.getter = expOrFn
            // 设置Dep.target的值，依赖收集时的watcher对象
        this.value = this.get()
    }

    get() {
        // 设置Dep.target值，用以依赖收集
        pushTarget(this)
        const vm = this.vm
        var value = this.getter.call(vm, vm)
        return value
    }

    // 添加依赖
    addDep(dep) {
        const id = dep.id;
        // 这里简单处理，即依赖只收集一次，不重复收集依赖
        if (this.depIds.indexOf(id) == -1) {
            this.depIds.push(dep.id)
            this.newDepIds.push(dep.id)
            this.newDeps.push(dep)
            dep.addSub(this)
        }
    }

    // 更新
    update() {
        this.run()
    }

    // 更新视图
    run() {
        //这里只做简单的console.log 处理，在Vue中会调用diff过程从而更新视图
        console.log(`这里会去执行Vue的diff相关方法，进而更新数据`)
        this.cb.call(this.vm)
    }
}

/*----------------------------------------Observer------------------------------------*/
//获得arrayMethods对象上所有属性的数组
const arrayKeys = Object.getOwnPropertyNames(arrayMethods)

class Observer {
    constructor(value) {
        this.value = value
            // 增加dep属性（处理数组时可以直接调用）
        this.dep = new Dep()
            //将Observer实例绑定到data的__ob__属性上面去，后期如果oberve时直接使用，不需要从新Observer,
            //处理数组是也可直接获取Observer对象
        def(value, '__ob__', this)
        if (Array.isArray(value)) {
            //处理数组
            const augment = value.__proto__ ? protoAugment : copyAugment
                //此处的 arrayMethods 就是上面使用Object.defineProperty处理过
            augment(value, arrayMethods, arrayKeys)
                // 循环遍历数组children进行oberve
            this.observeArray(value)
        } else {
            //处理对象
            this.walk(value)
        }
    }

    walk(obj) {
        const keys = Object.keys(obj)
        for (var i = 0; i < keys.length; i++) {
            //此处我做了拦截处理，防止死循环，Vue中在oberve函数中进行的处理
            if (keys[i] == '__ob__') return;
            defineReactive(obj, keys[i], obj[keys[i]])
        }
    }

    observeArray(items) {
        for (var i = 0, l = items.length; i < l; i++) {
            observe(items[i])
        }
    }
}
// 数据重复Observer
function observe(value) {
    if (typeof(value) != 'object') return;
    var ob = new Observer(value)
    return ob;
}
// 把对象属性改为getter/setter，并收集依赖
function defineReactive(obj, key, val) {
    const dep = new Dep()
    // 处理children
    var childOb = observe(val)
    Object.defineProperty(obj, key, {
        enumerable: true,
        configurable: true,
        get: function reactiveGetter() {
            console.log(`调用get获取值，${key} 值为`, val)
            const value = val
            if (Dep.target) {
                dep.depend()
                if (childOb) {
                    childOb.dep.depend()
                }
                // 此处是对Array数据类型的依赖收集
                if (Array.isArray(value)) {
                    dependArray(value)
                }
            }
            return value
        },
        set: function reactiveSetter(newVal) {
            console.log(`调用了set，${key} 值为`, newVal, val)
            // value = val
            // if (newVal === value) return;
            // value = newVal;
            // childOb = observe(newVal)
            // dep.notify();

            const value = val
            val = newVal
                // 对新值进行observe
            childOb = observe(newVal)
            // 通知dep调用,循环调用手机的Watcher依赖，进行视图的更新
            dep.notify()
        }
    })
}

//辅助方法
function def(obj, key, val) {
    Object.defineProperty(obj, key, {
        value: val,
        enumerable: true,
        writable: true,
        configurable: true
    })
}

//重新赋值Array的__proto__属性
function protoAugment(target, src) {
    target.__proto__ = src
}
//不支持__proto__的直接修改相关属性方法
function copyAugment(target, src, keys) {
    for (var i = 0, l = keys.length; i < l; i++) {
        const key = keys[i]
        def(target, key, src[key])
    }
}
//收集数组的依赖
function dependArray(value) {
    for (var e, i = 0, l = value.length; i < l; i++) {
        e = value[i]
        e && e.__ob__ && e.__ob__.dep.depend()
        if (Array.isArray(e)) {
            //循环遍历chindren进行依赖收集
            dependArray(e)
        }
    }
}
