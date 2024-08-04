export const CategoriesRepository = ($axios) => ({
  get: {
    categories: (params) => {
      return $axios.$get('http://localhost:3000/v1/categories', { params })
    },
  },
})
