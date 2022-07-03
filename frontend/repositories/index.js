import { BooksRepository } from './books'

const repositories = {
  books: BooksRepository,
}

export const RepositoryFactory = {
  get: (key) => repositories[key],
}
