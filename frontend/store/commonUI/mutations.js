const mutations = {
  SET_HEADER_COLOR(state, payload) {
    const idx = state.bookImgThemeColorList.findIndex((item) => item.bookId === payload.bookId)
  },
}

export default mutations
