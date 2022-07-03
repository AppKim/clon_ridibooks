import { SelectionsRepository } from './selections'

const repositories = {
  selections: SelectionsRepository,
}

export const RepositoryFactory = {
  get: (key) => repositories[key],
}
