import { reactive } from '@nuxtjs/composition-api'

export default ({ app }, inject) => {
  const $window = reactive({
    width: 0,
  })

  if (process.browser) {
    const onResize = () => {
      $window.width = window.innerWidth
      console.log('onResize')
    }
    global.addEventListener('resize', onResize)
    onResize()
  }
  inject('window', $window)
}
