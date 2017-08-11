const mutations = {
  settingMenusList(state,data){
    state.settingMenusList = data;
  },
  settingMenusEditId(state,data){
    state.settingMenusEditId = data;
  },
  settingMenusEditparentId(state,data){
    state.settingMenusEditparentId = data;
  },
  setUserGroups(state, userGroups) {
    state.userGroups = userGroups
  },
  setOrganizes(state, organizes) {
    state.organizes = organizes
  }
}
export default mutations
