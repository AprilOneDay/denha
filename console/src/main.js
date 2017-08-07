import Vue from 'vue'
import VueResource from 'vue-resource'
import App from './App'
import router from './router/index'
import Config from './assets/js/Config.js'

import './assets/css/common.css'
import './assets/css/css.css'

import './assets/js/common.js'

Vue.use(VueResource)

window.Config = Config;

new Vue({
  el: '#app',
  template:'<App/>',
  components:{App},
  router
})