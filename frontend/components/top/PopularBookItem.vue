<template>
  <div class="popular-book-item">
    <div class="popular-book-item__ranking">{{ rankNum }}</div>
    <BookThumbnail src="https://img.ridicdn.net/cover/1242001114/xlarge?dpi=xxhdpi" size="small" alt="book.title" />
    <div class="popular-book-item__book-info">
      <div>사상 최강의 철학 입문</div>
      <ReviewStars star-size="medium" :is-show-rating-count="true" />
    </div>
  </div>
</template>
<script>
import { defineComponent } from '@nuxtjs/composition-api'
import BookThumbnail from '../BookThumbnail.vue'
import ReviewStars from '../ReviewStars.vue'

export default defineComponent({
  components: { BookThumbnail, ReviewStars },
  props: {
    rankNum: {
      type: Number,
      required: true,
    },
    book: {
      type: Object,
      required: false,
      default: () => ({}),
    },
  },
  setup() {},
})
</script>

<style lang="scss" scoped>
.popular-book-item {
  display: flex;
  align-items: center;
  min-height: 75px;
  padding: 0 16px;
  &__ranking {
    min-width: 16px;
    margin-right: 10px;
    color: rgb(48, 53, 56);
    font-weight: 500;
    font-size: 1.6rem;
    text-align: center;
  }
  &__book-info {
    width: 130px;
    margin: 10px;
    color: rgb(64, 71, 77);
    font-size: 13px;
  }
}
</style>
