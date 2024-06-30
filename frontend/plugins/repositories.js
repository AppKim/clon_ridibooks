import { RepositoryFactory } from '@/repositories'

export default (context, inject) => {
  const repositories = (repositoryName, isMock = true) => {
    let baseURL
    if (isMock) {
      baseURL = 'http://localhost:7070'
    } else {
      baseURL = 'http://localhost:3000/v1'
    }
    const axiosInstance = context.$axios
    axiosInstance.setBaseURL(baseURL)
    return RepositoryFactory.get(repositoryName)(axiosInstance)
  }

  inject('repositories', repositories)
}
