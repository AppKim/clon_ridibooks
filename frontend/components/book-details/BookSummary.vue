<template>
  <div class="book-summary">
    <BookThumbnail />
    <div>
      <CategoriesLink />
    </div>
  </div>
</template>
<script>
import { defineComponent } from '@nuxtjs/composition-api'
import BookThumbnail from '../BookThumbnail.vue'

export default defineComponent({
  components: { BookThumbnail },
  setup() {},
})
</script>

<style lang="scss" scoped></style>
