import { BooksRepository } from './books'
import { CategoriesRepository } from './categories'

const repositories = {
  books: BooksRepository,
  categories: CategoriesRepository,
}

export const RepositoryFactory = {
  get: (key) => repositories[key],
}
