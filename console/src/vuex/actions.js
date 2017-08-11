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
  settingMenusEdit({ commit }, data){
    commit('settingMenusEdit', data)
  },
  setUserGroups({ commit }, userGroups) {
    commit('setUserGroups', userGroups)
  },
  setOrganizes({ commit }, organizes) {
    commit('setOrganizes', organizes)
  }
}

export default actions
