import Vue from 'vue'
import VueResource from 'vue-resource'
import App from './App'
import layer from 'vue-layer'

//引入对应的组件
import VueHtml5Editor from 'vue-html5-editor'
import MyDatepicker from 'vue-datepicker-simple/datepicker-2.vue' 
import Page from './components/Page.vue'
import UpImg from './components/UpImg.vue'


import store from './vuex/store'
import router from './router/index'

import config from './assets/js/Config.js'
import filter from './assets/js/filter.js'
import VueHtml5EditorConfig from './assets/js/VueHtml5EditorConfig.js'

import 'font-awesome/css/font-awesome.css'
import './assets/css/common.css'
import './assets/css/css.css'

Vue.use(MyDatepicker)
Vue.use(VueResource)
Vue.use(VueHtml5Editor,VueHtml5EditorConfig)

Vue.prototype.$layer = layer(Vue)

Vue.component('my-datepicker', MyDatepicker)
Vue.component('page', Page)
Vue.component('up-img', UpImg)

Vue.http.options.xhr = { withCredentials: true }
Vue.http.options.emulateJSON = true;
Vue.http.options.emulateHTTP = true;

Vue.http.interceptors.push(function(request, next) {//拦截器
// 跨域携带cookie
 	//Vue.http.options.headers = {'Access-Control-Allow-Origin':'http://localhost:8080'},
	next()
})


window.config = config;
window.store  = store;

new Vue({
  el: '#app',
  template:'<App/>',
  components:{App},
  filters:filter,
  router
})