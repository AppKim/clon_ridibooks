// state
export const state = {
  categories: [],
  category: [],
}

export const mutations = {
  addCategories(state, payload) {
    state.categories = payload
  },
  addCategory(state, payload) {
    state.category = payload
  },
  deleteCategory(state) {
    state.category = []
  },
}
// Test
export const actions = {
  async get_selections({ commit }) {
    const res = await this.$repositories('selections').get()
    console.log('action', res)
  },
}

export const getters = {
  selectCategories(state) {
    return state.categories
  },
  selectCategory(state) {
    return state.category
  },
}
