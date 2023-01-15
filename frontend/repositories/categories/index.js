export const CategoriesRepository = ($axios) => ({
  get: {
    categories: (params) => {
      return $axios.$get('/categories', { params })
    },
  },
})
