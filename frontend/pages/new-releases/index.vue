<template>
  <div class="new-releases">
    <h1 class="new-releases__title">최신 업데이트</h1>
    <BookThumbnailLinkGrid />
  </div>
</template>
<script>
import { defineComponent } from '@nuxtjs/composition-api'
import BookThumbnailLinkGrid from '~/components/BookThumbnailLinkGrid.vue'

export default defineComponent({
  components: { BookThumbnailLinkGrid },
  setup() {},
})
</script>

<style lang="scss" scoped></style>
