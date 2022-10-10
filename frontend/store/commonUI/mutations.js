const mutations = {
  /**
   * @param {*} state
   * @param { { bookId: string, bgColor: string } } payload
   */
  SET_THEME_COLOR(state, payload) {
    state.bookImgThemeColorList = Object.assign(
      { ...state.bookImgThemeColorList },
      { [payload.bookId]: payload.bgColor }
    )
  },
  /**
   * @param {*} state
   * @param {boolean} payload
   */
  SET_IS_USED_THEME_COLOR(state, payload) {
    state.isUsedThemeColor = payload
  },
}

export default mutations
