const mutations = {
  settingMenusList(state,data){
    state.settingMenusList = data;
  },
  settingMenusEdit(state,data){
    state.settingMenusEdit = data;
  },
  setUserGroups(state, userGroups) {
    state.userGroups = userGroups
  },
  setOrganizes(state, organizes) {
    state.organizes = organizes
  }
}
export default mutations
