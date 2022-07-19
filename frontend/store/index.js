// state
export const state = {
  categories: [],
}

export const mutations = {
  add(state, text) {
    state.categories.push({
      text,
    })
  },
}
// Test
export const actions = {
  async get_selections({ commit }) {
    const res = await this.$repositories('selections').get()
    console.log('action', res)
  },
}
