import Vue from 'vue'
import VueResource from 'vue-resource'
import App from './App'
import router from './router/index'

Vue.use(VueResource)
new Vue({
  el: '#app',
  template:'<App/>',
  components:{App},
  router
})