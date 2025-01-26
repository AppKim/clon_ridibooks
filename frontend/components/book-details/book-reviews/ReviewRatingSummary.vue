<template>
  <div class="review-rating-summary">
    <p class="review-rating-summary__title">구매자 별점</p>
    <div class="review-rating-summary__score">{{ reviewSummary.averageScore }}</div>
    <ReviewStars class="review-rating-summary__stars" star-size="large" :review-summary="reviewSummary" />
    <ScoreDistribution
      class="review-rating-summary__score-distribution"
      :distribution="reviewSummary.distribution"
      :total-count="reviewSummary.totalCount"
    />
  </div>
</template>

<script>
import { computed, defineComponent } from '@nuxtjs/composition-api'
import ScoreDistribution from './ScoreDistribution.vue'
import ReviewStars from '~/components/ReviewStars.vue'

export default defineComponent({
  components: { ReviewStars, ScoreDistribution },
  props: {
    reviews: {
      type: Array,
      default: () => [],
    },
  },
  setup(props) {
    const reviewSummary = computed(() => {
      if (!props.reviews.length) {
        return {
          averageScore: 0,
          distribution: [0, 0, 0, 0, 0],
          totalCount: 0,
        }
      }

      // 평균 점수 계산
      const totalScore = props.reviews.reduce((acc, review) => acc + review.score, 0)
      const averageScore = Number((totalScore / props.reviews.length).toFixed(1))

      // 점수 분포 계산 (1점~5점)
      const distribution = Array(5).fill(0)
      props.reviews.forEach((review) => {
        distribution[review.score - 1]++
      })

      return {
        averageScore,
        distribution,
        totalCount: props.reviews.length,
      }
    })

    return {
      reviewSummary,
    }
  },
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
