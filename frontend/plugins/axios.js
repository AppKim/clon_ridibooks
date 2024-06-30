const baseURL = 'http://localhost:7070'

const initAxios = ({ $axios }) => {
  $axios.setBaseURL(baseURL)

  $axios.onRequest((config) => {
    console.dir(config)
  })

  $axios.onResponse((config) => {
    console.dir(config)
  })

  $axios.onError((e) => {
    console.error(e.response)
  })
}

export default initAxios
