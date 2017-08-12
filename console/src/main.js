import Vue from 'vue'
import VueResource from 'vue-resource'
import App from './App'
import layer from 'vue-layer'


import store from './vuex/store'
import router from './router/index'
import config from './assets/js/Config.js'

import './assets/css/common.css'
import './assets/css/css.css'

Vue.use(VueResource)
Vue.prototype.$layer = layer(Vue);
/*router.beforeEach((to, from, next) => {
  //const hideLeft = to.meta.hideLeft
})*/

window.config = config;
window.store  = store;

new Vue({
  el: '#app',
  template:'<App/>',
  components:{App},
  router
})