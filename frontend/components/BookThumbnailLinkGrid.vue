<template>
  <div class="book-thumbnail-link-grid">
    <BookThumbnailLink
      v-for="(book, i) in bookList"
      :key="i"
      size="medium"
      :src="book.thumbnail.large"
      :alt="book.alt && book.title && book.title.main"
      :to="book.link"
      :title="book.title && book.title.main"
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
  setup(props) {},
})
</script>

<style lang="scss" scoped>
.book-thumbnail-link-grid {
  display: grid;
  grid-template-columns: repeat(6, 1fr);
  row-gap: 32px;
  margin-bottom: 32px;
  @include sp_view {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    gap: 8px;
    flex-flow: row wrap;
  }
}
</style>
