<template>
  <div class="book" :style="bgColor">
    <div class="book__header"></div>
    <div class="book__main"></div>
  </div>
</template>
<script>
import { computed, defineComponent, onMounted, ref } from '@nuxtjs/composition-api'
import { useVibrant } from '../../composables/useVibrant'

export default defineComponent({
  setup() {
    const { getPaletteData } = useVibrant()
    const vibrant = ref({})
    onMounted(async () => {
      const sampleImgPath = require('@/assets/images/large-sample1.webp')
      const result = await getPaletteData(sampleImgPath)
      vibrant.value = result.Vibrant
    })
    const bgColor = computed(() => ({
      background: `rgb(${vibrant.value._rgb.join(',')})`,
    }))
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
