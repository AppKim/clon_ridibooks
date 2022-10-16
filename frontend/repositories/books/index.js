export const BooksRepository = ($axios) => ({
  get: {
    books: () => $axios.$get('/books'),
  },
  show: {
    books: (id) => {
      const books = $axios.$get(`/books/${id}`)
      return books.find((book) => book.id === id)
    },
  },
})
