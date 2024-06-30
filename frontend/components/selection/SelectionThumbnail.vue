<template>
  <div class="grid-booklist-container">
    <ul class="grid-booklist">
      <li v-for="(book, index) in books" :key="index" class="grid-booklist__item">
        <div>
          <BookThumbnail size="medium" :src="book.thumbnail.large" alt="sample image"></BookThumbnail>
          <BookThumbnailTitle :title="book.title.main"></BookThumbnailTitle>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
import { defineComponent } from '@nuxtjs/composition-api'
import BookThumbnail from '../BookThumbnail.vue'
import BookThumbnailTitle from '../BookThumbnailTitle.vue'
export default defineComponent({
  components: { BookThumbnail, BookThumbnailTitle },
  props: {
    books: {
      type: Array,
      required: true,
    },
  },
})
</script>

<style lang="scss" scoped>
.grid-booklist-container {
  min-width: 320px;
  max-width: 800px;
  margin: 10px auto;
  .grid-booklist {
    display: flex;
    flex-wrap: wrap;
    padding: 16px 0;
    .grid-booklist__item {
      width: 120px;
      margin: 0 10px 50px 10px;
    }
  }
}
</style>
