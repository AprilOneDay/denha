import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)

import mutations from './mutations'
import actions from './actions'
import getters from './getters'



const state = {
  settingMenusList:false,
  settingMenusEdit:'',
}

export default new Vuex.Store({
  state,
  actions,
  mutations,
  getters
})
