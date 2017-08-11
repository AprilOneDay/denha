const actions = {
  showLeftMenu ({ commit }, status) {
    commit('showLeftMenu', status)
  },
  showLoading ({ commit }, status) {
    commit('showLoading', status)
  },
  setMenus({ commit }, menus) {
    commit('setMenus', menus)
  },
  setRules({ commit }, rules) {
    commit('setRules', rules)
  },
  setUsers({ commit }, users) {
    //console.log(users);return ;
    commit('setUsers', users)
    //console.log(users);
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
