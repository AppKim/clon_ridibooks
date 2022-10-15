<template>
  <div class="book" :style="bgColor">
    <div class="book__header"></div>
    <div class="book__main"></div>
  </div>
</template>
<script>
import {
  computed,
  defineComponent,
  onBeforeMount,
  onBeforeUnmount,
  onMounted,
  useRoute,
  useStore,
} from '@nuxtjs/composition-api'
import { useVibrant } from '../../composables/useVibrant'

export default defineComponent({
  setup() {
    const route = useRoute()
    const store = useStore()
    const bgColor = computed(() => {
      if (store.getters['commonUI/getBookImgThemeColorList'][route.value.params.id]) {
        return { backgroundColor: store.getters['commonUI/getBookImgThemeColorList'][route.value.params.id] }
      }
      return {}
    })
    const { getPaletteData } = useVibrant()
    onMounted(async () => {
      console.log(Object.keys(bgColor.value))
      if (Object.keys(bgColor.value).length === 0) {
        const sampleImgPath = require('@/assets/images/large-sample1.webp')
        const result = await getPaletteData(sampleImgPath)
        store.commit('commonUI/SET_THEME_COLOR', {
          bookId: '734001113', // route.value.params.id,
          bgColor: `rgb(${result.Vibrant._rgb.join(',')})`,
        })
      }
    })
    onBeforeMount(() => {
      store.commit('commonUI/SET_IS_USED_THEME_COLOR', true)
      store.commit('commonUI/SET_IS_SHOW_MENU', false)
    })
    onBeforeUnmount(() => {
      store.commit('commonUI/SET_IS_USED_THEME_COLOR', false)
      store.commit('commonUI/SET_IS_SHOW_MENU', true)
    })
    return {
      bgColor,
    }
  },
})
</script>

<style lang="scss" scoped>
.book {
  min-height: 100vh;
  &__header {
  }
  &__main {
  }
}
</style>
