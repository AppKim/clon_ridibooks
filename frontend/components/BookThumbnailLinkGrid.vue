<template>
  <div class="book-thumbnail-link-grid">
    <BookThumbnailLink
      v-for="(book, i) in bookList"
      :key="i"
      size="medium"
      src="https://placeimg.com/150/200/any"
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
  setup(props) {
    console.log(props.bookList)
  },
})
</script>

<style lang="scss" scoped>
.book-thumbnail-link-grid {
  display: grid;
  grid-template-columns: repeat(6, 1fr);
  gap: 0;
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
