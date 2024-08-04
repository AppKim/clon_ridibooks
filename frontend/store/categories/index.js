// state
export const state = () => {
  return {
    categories: [],
    category: {},
    categoryChildrenId: 0,
    selectedCategoryId: 1,
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
  ADD_SELECTED_CATEGORY_ID(state, id) {
    state.selectedCategoryId = id
  },
}

export const actions = {
  async getCategories({ commit }) {
    const res = await this.$repositories('categories').get.categories()
    commit('ADD_CATEGORIES', res)
  },
  async getSelectBtnItem(params) {
    const query = params.sort.query
    await this.$repositories('categories').get.categories(query)
  },
}

export const getters = {
  categories(state) {
    return [...state.categories]
  },
  category(state) {
    return state.category
  },
  categoryModalItems(state) {
    return state.categories.filter((category) => category.children && category.children.length > 0)
  },
  selectCategoryChildrenId(state) {
    return state.categoryChildrenId
  },
  getSelectedCategoryId(state) {
    return state.selectedCategoryId
  },
}
