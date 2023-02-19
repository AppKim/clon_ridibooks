<template>
  <div class="review-rating-summary">
    <p class="review-rating-summary__title">구매자 별점</p>
    <div class="review-rating-summary__score">4.1</div>
    <ReviewStars class="review-rating-summary__stars" star-size="large" />
    <ScoreDistribution class="review-rating-summary__score-distribution" />
  </div>
</template>
<script>
import { defineComponent } from '@nuxtjs/composition-api'
import ScoreDistribution from './ScoreDistribution.vue'
import ReviewStars from '~/components/ReviewStars.vue'

// "review_summary": {
//   "buyer_rating_distribution": [0, 0, 1, 0, 2],
//   "buyer_rating_average": 4.3,
//   "buyer_rating_count": 3,
//   "buyer_review_count": 1,
//   "total_rating_count": 12,
//   "total_review_count": 1
// }
export default defineComponent({
  components: { ReviewStars, ScoreDistribution },
  props: {
    reviewSummary: {
      type: Object,
      default: () => ({}),
    },
  },
  setup() {},
})
</script>

<style lang="scss" scoped>
.review-rating-summary {
  display: flex;
  flex-direction: column;
  align-items: center;
  &__title {
    color: #808991;
    font-size: 13px;
  }
  &__score {
    color: #212529;
    font-size: 32px;
    font-weight: bold;
    line-height: 1em;
    font-family: Roboto, sans-serif;
    margin-top: 14px;
  }
  &__stars {
    margin-top: 12px;
  }
  &__score-distribution {
    margin-top: 16px;
  }
}
</style>
