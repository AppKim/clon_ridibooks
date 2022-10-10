<template>
  <div class="book" :style="bgColor">
    <div class="book__header"></div>
    <div class="book__main"></div>
  </div>
</template>
<script>
import { computed, defineComponent, onBeforeMount, onMounted, useRoute, useStore } from '@nuxtjs/composition-api'
import { useVibrant } from '../../composables/useVibrant'

export default defineComponent({
  setup() {
    const route = useRoute()
    const store = useStore()
    const bgColor = computed(() => {
      const bgColor = store.getters['commonUI/getBookImgThemeColorList'][route.value.params.id]

      return bgColor
        ? { backgroundColor: store.getters['commonUI/getBookImgThemeColorList'][route.value.params.id] }
        : undefined
    })
    const { getPaletteData } = useVibrant()
    onMounted(async () => {
      if (bgColor.value === undefined) {
        const sampleImgPath = require('@/assets/images/large-sample1.webp')
        const result = await getPaletteData(sampleImgPath)
        store.commit('commonUI/SET_THEME_COLOR', {
          bookId: '734001113', // route.value.params.id,
          bgColor: `rgb(${result.Vibrant._rgb.join(',')})`,
        })
      }
      store.commit('commonUI/SET_IS_USED_THEME_COLOR', true)
    })
    onBeforeMount(() => {
      store.commit('commonUI/SET_IS_USED_THEME_COLOR', false)
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
