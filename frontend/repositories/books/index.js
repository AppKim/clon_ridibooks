export const BooksRepository = ($axios) => ({
  get: {
    books: () => $axios.$get('/books'),
    reviews: (bookId) => $axios.$get(`/books/${bookId}/reviews`),
  },
  show: {
    books: (id) => {
      const books = $axios.$get(`/books/${id}`)
      return books.find((book) => book.id === id)
    },
  },
})
