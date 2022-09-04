<template>
  <div class="book-thumbnail-link-grid">
    <BookThumbnailLink
      v-for="(book, i) in bookList"
      :key="i"
      size="medium"
      :src="book.src"
      :alt="book.alt || book.title"
      :to="book.link"
      :title="book.title"
      :author="book.author"
      class="book-thumbnail-link-grid__item"
    />
  </div>
</template>
<script>
import { defineComponent } from '@nuxtjs/composition-api'
import BookThumbnailLink from './BookThumbnailLink.vue'

export default defineComponent({
  components: { BookThumbnailLink },
  props: {
    bookList: {
      type: Array,
      default: () => [],
    },
  },
  setup() {},
})
</script>

<style lang="scss" scoped>
.book-thumbnail-link-grid {
  overflow: auto;
  display: grid;
}
</style>
