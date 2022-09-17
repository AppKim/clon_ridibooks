import { RepositoryFactory } from '@/repositories'

export default (context, inject) => {
  const repositories = (name) => {
    return RepositoryFactory.get(name)(context.$axios)
  }

  inject('repositories', repositories)
}