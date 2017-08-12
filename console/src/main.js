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
	
console.log(filter);

window.config = config;
window.store  = store;

new Vue({
  el: '#app',
  template:'<App/>',
  components:{App},
  filters:filter,
  router
})