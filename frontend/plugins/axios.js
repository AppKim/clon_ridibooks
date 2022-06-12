const baseURL = 'http://localhost:5000'

const initAxios = ({ $axios }) => {
  $axios.setBaseURL(baseURL)

  $axios.onRequest((config) => {
    console.log(config)
  })

  $axios.onResponse((config) => {
    console.log(config)
  })

  $axios.onError((e) => {
    console.log(e.response)
  })
}

export default initAxios
