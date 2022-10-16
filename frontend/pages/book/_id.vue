<template>
  <div class="book">
    <div class="book__header" :style="bgColor">
      <BookSummary />
    </div>
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
import BookSummary from '../../components/book-details/BookSummary.vue'
import { useVibrant } from '../../composables/useVibrant'

export default defineComponent({
  components: { BookSummary },
  setup() {
    const route = useRoute()
    const store = useStore()
    const bgColor = computed(() => {
      if (store.getters['commonUI/getBookImgThemeColorList'][route.value.params.id]) {
        // FIXME: '734001113' -> route.value.params.id
        return { backgroundColor: store.getters['commonUI/getBookImgThemeColorList']['1046000135'] }
      }
      return {}
    })
    const { getPaletteData } = useVibrant()
    onMounted(async () => {
      if (Object.keys(bgColor.value).length === 0) {
        const sampleImgPath = require('@/assets/images/1046000135.webp')
        const result = await getPaletteData(sampleImgPath)
        store.commit('commonUI/SET_THEME_COLOR', {
          bookId: '1046000135', // route.value.params.id,
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
