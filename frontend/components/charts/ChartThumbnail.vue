<template>
  <div class="grid-booklist-container">
    <ul class="grid-booklist">
      <li v-for="i in 24" :key="i" class="grid-booklist__item">
        <div class="grid-booklist__rank">{{ i }}</div>
        <div>
          <book-thumbnail size="medium" src="https://placeimg.com/150/200/any" alt="sample image"> </book-thumbnail>
          <book-thumbnail-title :title="title"></book-thumbnail-title>
          <book-review :rate="parseInt(rate)" :score="parseInt(score)"></book-review>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
import { defineComponent, ref } from '@vue/composition-api'
import BookThumbnail from '../BookThumbnail.vue'
import BookThumbnailTitle from '../BookThumbnailTitle.vue'
import BookReview from './BookReview.vue'

export default defineComponent({
  components: { BookThumbnail, BookReview, BookThumbnailTitle },
  setup() {
    const rate = ref(3)
    const score = ref(3)
    const title = 'This is Sample Title'
    return {
      rate,
      score,
      title,
    }
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
      .grid-booklist__rank {
        text-align: center;
        margin-bottom: 15px;
      }
    }
  }
}
</style>
