export const BooksRepository = ($axios) => ({
  get: {
    book: () => $axios.$get('/book'),
  },
  show: {
    book: (id) => $axios.$get(`/book/${id}`),
  },
})
