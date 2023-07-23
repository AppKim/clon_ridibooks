<template>
  <div class="grid-booklist-container">
    <ul class="grid-booklist">
      <li v-for="(book, index) in books" :key="index" class="grid-booklist__item">
        <div class="grid-booklist__rank">{{ index + 1 }}</div>
        <div>
          <BookThumbnail size="medium" :src="book.thumbnail.large" alt="sample image"> </BookThumbnail>
          <BookThumbnailTitle :title="book.title.main"></BookThumbnailTitle>
          <BookReview
            :rate="parseInt(book.review_summary.buyer_rating_average)"
            :count="parseInt(book.review_summary.buyer_rating_count)"
          ></BookReview>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
import { defineComponent } from '@vue/composition-api'
import BookThumbnail from '../BookThumbnail.vue'
import BookThumbnailTitle from '../BookThumbnailTitle.vue'
import BookReview from '../BookReview.vue'
export default defineComponent({
  components: { BookThumbnail, BookReview, BookThumbnailTitle },
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
  max-width: 800px;
  margin: 0px auto;
  .grid-booklist {
    display: flex;
    flex-wrap: wrap;
    padding: 16px 0;
    .grid-booklist__item {
      width: 120px;
      margin: 0 0px 50px 10px;
      .grid-booklist__rank {
        text-align: center;
        margin-bottom: 15px;
      }
    }
  }
}
</style>
