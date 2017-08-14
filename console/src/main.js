import Vue from 'vue'
import VueResource from 'vue-resource'
import App from './App'
import layer from 'vue-layer'


import store from './vuex/store'
import router from './router/index'

import config from './assets/js/Config.js'
import filter from './assets/js/filter.js'

import './assets/css/common.css'
import './assets/css/css.css'

Vue.use(VueResource)
Vue.prototype.$layer = layer(Vue);

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