<template>
  <div class="book-summary">
    <BookThumbnail
      class="book-summary__thumbnail"
      size="xLarge"
      src="https://img.ridicdn.net/cover/1046000135/xxlarge#1"
    />
    <BookMeta />
  </div>
</template>
<script>
import { defineComponent } from '@nuxtjs/composition-api'
import BookThumbnail from '../BookThumbnail.vue'
import BookMeta from './BookMeta.vue'

export default defineComponent({
  components: { BookThumbnail, BookMeta },
})
</script>

<style lang="scss" scoped>
.book-summary {
  display: flex;
  width: 800px;
  margin: auto;
  padding: 50px 0;
  line-height: 1;
  &__thumbnail {
    cursor: zoom-in;
    margin-right: 56px;
  }
}
</style>
