<template>
  <div class="review-stars">
    <div class="review-stars__icon" :class="starSize">
      <div class="review-stars__icon--forward" :style="`width: ${reviewSummary['rating_average'] * 20}%`">
        <fa-icon v-for="i in 5" :key="i" :icon="['fas', 'star']" />
      </div>
      <div class="review-stars__icon--backward">
        <fa-icon v-for="i in 5" :key="i" :icon="['fas', 'star']" />
      </div>
    </div>
    <div class="review-stars__count" v-if="isShowRatingCount">149</div>
    <div class="review-stars__score" v-if="isShowReviewScore">4.5점</div>
    <div class="review-stars__review-count" v-if="isShowReviewCount">(43명)</div>
  </div>
</template>
<script>
import { defineComponent } from '@nuxtjs/composition-api'

const defaultReviewSummary = {
  rating_distribution: [1, 4, 17, 57, 110],
  rating_average: 4.4,
  rating_count: 8,
  review_count: 198,
}

export default defineComponent({
  props: {
    reviewSummary: {
      // 0 ~ 100
      type: () => {},
      default: defaultReviewSummary,
    },
    text: {
      type: String,
      default: '',
    },
    starSize: {
      type: String,
      default: 'medium',
    },
    isShowRatingCount: {
      type: Boolean,
      default: false,
    },
    isShowReviewScore: {
      type: Boolean,
      default: false,
    },
    isShowReviewCount: {
      type: Boolean,
      default: false,
    },
  },
})
</script>

<style lang="scss" scoped>
.review-stars {
  display: flex;
  align-items: center; // #f96b1f
  &__icon {
    position: relative;
    min-height: 12px;
    &.small {
      min-width: 50px;
      font-size: 0.9rem;
    }
    &.medium {
      min-width: 62px;
      font-size: 1.1rem;
    }
    &.big {
      min-width: 74px;
      font-size: 1.4rem;
    }
    &--forward {
      top: 0;
      position: absolute;
      overflow: hidden;
      z-index: 1;
      display: flex;
      color: #f96b1f;
      background: transparent;
    }
    &--backward {
      top: 0;
      position: absolute;
      display: flex;
      color: #998b8272;
    }
  }
  &__count {
    display: inline-block;
    font-size: 1.2rem;
    margin-top: 1px;
    margin-left: 3px;
    color: rgb(158, 167, 173);
    vertical-align: top;
  }
  &__score {
    display: inline-block;
    font-size: 1.3rem;
    margin-top: 4px;
    margin-left: 8px;
    color: #f96b1f;
    font-weight: 600;
  }
  &__review-count {
    color: white;
    font-size: 1.1rem;
    margin-left: 2px;
    margin-top: 2px;
    font-weight: 300;
  }
}
</style>
