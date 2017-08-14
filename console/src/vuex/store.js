import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)

import mutations from './mutations'
import actions from './actions'
import getters from './getters'



const state = {
  UPDATE_LIST:false,
  UPDATE_EDIT_ID:'',
  LOGIN_STATE:false, //登录状态
  settingAdminList:false,
  settingMenusList:false,
  settingMenusEditId:'',
  settingMenusEditparentId:'',
}

export default new Vuex.Store({
  state,
  actions,
  mutations,
  getters
})
