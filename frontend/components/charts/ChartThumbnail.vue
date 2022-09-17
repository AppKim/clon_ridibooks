<template>
  <div class="grid-booklist-container">
    <ul class="grid-booklist">
      <li v-for="(book, index) in books" :key="index" class="grid-booklist__item">
        <div class="grid-booklist__rank">{{ index + 1 }}</div>
        <div>
          <book-thumbnail size="medium" :src="book.thumbnail.large" alt="sample image"> </book-thumbnail>
          <book-thumbnail-title :title="book.title.main"></book-thumbnail-title>
          <book-review
            :rate="parseInt(book.review_summary.buyer_rating_average)"
            :count="parseInt(book.review_summary.buyer_rating_count)"
          ></book-review>
        </div>
      </li>
    </ul>
    <pager></pager>
  </div>
</template>

<script>
import { defineComponent } from '@vue/composition-api'
import BookThumbnail from '../BookThumbnail.vue'
import BookThumbnailTitle from '../BookThumbnailTitle.vue'
import BookReview from '../BookReview.vue'
import Pager from '../Pager.vue'

export default defineComponent({
  components: { BookThumbnail, BookReview, BookThumbnailTitle, Pager },
  props: {
    books: {
      type: Array,
      required: true,
    },
  },
  setup() {},
})
</script>

<style lang="scss" scoped>
.grid-booklist-container {
  min-width: 320px;
  max-width: 900px;
  margin: 10px auto;
  .grid-booklist {
    display: flex;
    flex-wrap: wrap;
    padding: 16px 0;
    .grid-booklist__item {
      width: 120px;
      margin: 0 10px 50px 10px;
      .grid-booklist__rank {
        text-align: center;
        margin-bottom: 15px;
      }
    }
  }
}
</style>
