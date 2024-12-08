const baseURL = 'http://localhost:7070'

const initAxios = ({ $axios }) => {
  $axios.setBaseURL(baseURL)
  $axios.onError((e) => {
    console.error(e.response)
  })
}

export default initAxios
