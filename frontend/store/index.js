// state
export const state = () => {
  return {
    categories: [],
    category: {},
    categoryChildrenId: 0,
  }
}

export const mutations = {
  ADD_CATEGORIES(state, payload) {
    state.categories = payload
  },
  ADD_CATEGORY(state, payload) {
    const res = state.categories.find((item) => item.id === payload)
    state.category = res
  },
  DELETE_CATEGORY(state) {
    state.category = {}
  },
  ADD_CATEGORY_CHILDREN_ID(state, payload) {
    state.categoryChildrenId = payload
  },
}

export const actions = {
  async getCategories({ commit }) {
    const res = await this.$repositories('categories').get.categories()
    commit('ADD_CATEGORIES', res)
  },
}

export const getters = {
  categories(state) {
    return [...state.categories]
  },
  selectCategory(state) {
    return { ...state.category }
  },
  selectCategoryChildrenId(state) {
    return state.categoryChildrenId
  },
}
