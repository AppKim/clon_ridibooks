<template>
  <div class="book-thumbnail-link-grid">
    <BookThumbnailLink
      v-for="(book, i) in bookList"
      :key="i"
      size="medium"
<<<<<<< HEAD
      src="https://placeimg.com/150/200/any"
      :alt="book.alt && book.title && book.title.main"
      :to="book.link"
      :title="book.title && book.title.main"
=======
      :src="book.src"
      :alt="book.alt || book.title"
      :to="book.link"
      :title="book.title"
>>>>>>> 33ee0d6 (set)
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
<<<<<<< HEAD
  setup(props) {
    console.log(props.bookList)
  },
=======
  setup() {},
>>>>>>> 33ee0d6 (set)
})
</script>

<style lang="scss" scoped>
.book-thumbnail-link-grid {
<<<<<<< HEAD
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
=======
  overflow: auto;
  display: grid;
>>>>>>> 33ee0d6 (set)
}
</style>
