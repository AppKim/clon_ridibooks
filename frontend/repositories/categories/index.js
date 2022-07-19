export const CategoriesRepository = ($axios) => ({
  get: {
    categories: () => $axios.$get('/categories'),
  },
})
