const actions = {
  UPDATE_LIST ({ commit }, data) {
    commit('UPDATE_LIST', data)
  },
  UPDATE_EDIT_ID ({ commit }, data) {
    commit('UPDATE_EDIT_ID', data)
  },
  setMenus({ commit }, menus) {
    commit('setMenus', menus)
  },
  setRules({ commit }, rules) {
    commit('setRules', rules)
  },
  settingAdminList({ commit }, data) {
    commit('settingAdminList', data)
  },
  settingMenusList({ commit }, data){
    commit('settingMenusList', data)
  },
  settingMenusEditId({ commit }, data){
    commit('settingMenusEditId', data)
  },
  settingMenusEditparentId({ commit }, data){
    commit('settingMenusEditparentId', data)
  },
}

export default actions
