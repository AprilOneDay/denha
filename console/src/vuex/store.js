import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)

const state = {
  showLeftMenu: true,
  globalLoading: true,
  menusEdit:false,
  menus: [],
  rules: [],
  users: {},
  userGroups: [],
  organizes: []
}

export default new Vuex.Store({
  state,
})
