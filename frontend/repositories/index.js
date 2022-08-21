import { BooksRepository } from './books'
import { CategoriesRepository } from './categories'
import { TopRepository } from './top'
import { CollectionsRepository } from './collections'

const repositories = {
  top: TopRepository,
  books: BooksRepository,
  categories: CategoriesRepository,
  collections: CollectionsRepository,
}

export const RepositoryFactory = {
  get: (key) => repositories[key],
}
