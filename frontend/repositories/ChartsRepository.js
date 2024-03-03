const resource = '/books'

export const ChartsRepository = ($axios) => ({
  get: {
    books: () => $axios.$get(`${resource}`),
  },
})
