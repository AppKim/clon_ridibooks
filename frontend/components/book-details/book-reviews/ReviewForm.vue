<template>
  <div class="review-form">
    <p v-if="!!hoveredScore" class="review-form__tooltip">
      {{ reviewTooltipCommentList[hoveredScore - 1] }}
    </p>
    <p v-else-if="!!selectedScore" class="review-form__selected-score">
      <span> 내가 남긴 별점 </span>
      <span class="review-form__selected-score__score"> {{ selectedScore.toFixed(1) }} </span>
      <span class="review-form__selected-score__cancel" @click="handleCancelSelectedScore"> 취소 </span>
    </p>
    <p v-else class="review-form__title">이 책을 평가해주세요!</p>
    <div class="review-form__stars">
      <fa-icon
        v-for="i in 5"
        :key="i"
        class="icon"
        :class="{ active: hoveredScore ? i <= hoveredScore : i <= selectedScore }"
        :icon="['fas', 'star']"
        @click="handleStarClick(i)"
        @mouseover="handleStarMouseover(i)"
        @mouseleave="handleStarMouseover(0)"
      />
    </div>
    <ReviewTextarea class="review-form__textarea" />
    <div class="review-form__footer">
      <CTAButton> 리뷰 남기기 </CTAButton>
    </div>
  </div>
</template>
<script>
import { defineComponent, ref } from '@nuxtjs/composition-api'
import CTAButton from '../../CTAButton.vue'
import ReviewTextarea from './ReviewTextarea.vue'
const reviewTooltipCommentList = ['별로에요', '그저 그래요', '보통이에요', '좋아요', '최고에요']

export default defineComponent({
  components: { ReviewTextarea, CTAButton },
  setup() {
    const hoveredScore = ref(0)
    const handleStarMouseover = (num) => {
      hoveredScore.value = num
    }
    const selectedScore = ref(0)
    const handleStarClick = (num) => {
      selectedScore.value = num
    }
    const handleCancelSelectedScore = () => {
      selectedScore.value = 0
    }
    return {
      hoveredScore,
      selectedScore,
      handleStarMouseover,
      handleStarClick,
      handleCancelSelectedScore,
      reviewTooltipCommentList,
    }
  },
})
</script>

<style lang="scss" scoped>
.review-form {
  &__tooltip {
    text-align: center;
    font-size: 16px;
    border-radius: 3px;
    padding: 4px 24px;
    margin: auto;
    width: fit-content;
    background: #0077d9;
    color: #fff;
  }
  &__selected-score {
    display: flex;
    align-items: center;
    justify-content: center;
    column-gap: 8px;
    &__score {
      color: #f96b1f;
      font-size: 32px;
      font-weight: bold;
      line-height: 1em;
      font-family: Roboto, sans-serif;
    }
    &__cancel {
      font-size: 14px;
      color: #9ea7ad;
      cursor: pointer;
    }
  }
  &__title {
    text-align: center;
    font-size: 18px;
    line-height: 1.8;
    font-weight: 700;
    color: #9ea7ad;
  }
  &__stars {
    display: flex;
    align-items: center;
    justify-content: center;
    margin-top: 16px;
    .icon {
      font-size: 40px;
      color: #9ea7ad;
      padding: 0 8px;
      border-right: 1px solid #f2f7fa;
      &.active {
        color: #f96b1f;
      }
    }
  }
  &__textarea {
    margin-top: 24px;
  }
  &__footer {
    margin-top: 16px;
  }
}
</style>
