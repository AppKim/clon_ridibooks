import { BooksRepository } from './books'
import { CategoriesRepository } from './categories'
import { TopRepository } from './top'
import { CollectionsRepository } from './collections'
import { ChartsRepository } from './ChartsRepository'
import { SelectionsRepository } from './SelectionsRepository'

const repositories = {
  top: TopRepository,
  books: BooksRepository,
  categories: CategoriesRepository,
  collections: CollectionsRepository,
  charts: ChartsRepository,
  selections: SelectionsRepository,
}

export const RepositoryFactory = {
  get: (key) => repositories[key],
}
