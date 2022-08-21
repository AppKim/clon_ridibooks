import { BooksRepository } from './books'
import { CategoriesRepository } from './categories'
import { TopRepository } from './top'

const repositories = {
  top: TopRepository,
  books: BooksRepository,
  categories: CategoriesRepository,
}

export const RepositoryFactory = {
  get: (key) => repositories[key],
}
