<template>
  <div class="grid-booklist-container">
    <ul class="grid-booklist">
      <li class="grid-bookilist__item" v-for="i in 24" :key="i">
        <div class="rank">{{ i }}</div>
        <div>
          <book-thumbnail :size="xLarge" src="https://placeimg.com/150/200/any" alt="sample image"> </book-thumbnail>
          <book-thumbnail-title :title="title"></book-thumbnail-title>
          <book-review :rate="parseInt(rate)" :score="parseInt(score)"></book-review>
        </div>
      </li>
    </ul>
    <pager></pager>
  </div>
</template>

<script>
import { defineComponent, ref } from '@vue/composition-api'
import BookThumbnail from '../BookThumbnail.vue'
import BookThumbnailTitle from '../BookThumbnailTitle.vue'
import BookReview from '../BookReview.vue'
import Pager from '../Pager.vue'

export default defineComponent({
  components: { BookThumbnail, BookReview, BookThumbnailTitle, Pager },
  setup() {
    const rate = ref(3)
    const score = ref(3)
    const title = ''
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
  margin: 0px auto;
  .grid-booklist {
    display: flex;
    flex-wrap: wrap;
    padding: 16px 0;
    li {
      width: 120px;
      margin: 0 10px;
      &:nth-child(n + 6) {
        margin-top: 60px;
      }
      & .rank {
        text-align: center;
        margin-bottom: 15px;
      }
    }
  }
}
</style>
