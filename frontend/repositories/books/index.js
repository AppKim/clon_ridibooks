export const BooksRepository = ($axios) => ({
  get: {
    selections: () => $axios.$get('/selections'),
    best: () => $axios.$get('/best'),
  },
  show: {
    selection: (id) => $axios.$get(`/selection/${id}`),
  },
})
