const mutations = {
  UPDATE_LIST(state, data) {
    state.UPDATE_LIST = data
  },
  UPDATE_EDIT_ID(state, data) {
    state.UPDATE_EDIT_ID = data
  },
  LOGIN_STATE(state, data) {
    state.LOGIN_STATE = data
  },
  settingMenusList(state,data){
    state.settingMenusList = data;
  },
  settingMenusEditId(state,data){
    state.settingMenusEditId = data;
  },
  settingMenusEditparentId(state,data){
    state.settingMenusEditparentId = data;
  },
  settingAdminList(state, data) {
    state.settingAdminList = data
  },

}
export default mutations
