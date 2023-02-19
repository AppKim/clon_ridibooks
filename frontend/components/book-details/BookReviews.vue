<template>
  <div class="book-reviews">
    <div class="book-reviews__top">
      <ReviewRatingSummary class="book-reviews__summary" />
      <ReviewForm class="book-reviews__form" />
    </div>
    <div class="book-reviews__bottom">
      <ReviewList />
    </div>
  </div>
</template>
<script>
import { defineComponent } from '@nuxtjs/composition-api'
import ReviewForm from './book-reviews/ReviewForm.vue'
import ReviewList from './book-reviews/ReviewList.vue'
import ReviewRatingSummary from './book-reviews/ReviewRatingSummary.vue'

export default defineComponent({
  components: { ReviewRatingSummary, ReviewForm, ReviewList },
  setup() {},
})
</script>

<style lang="scss" scoped>
.book-reviews {
  &__top {
    display: flex;
  }
  &__summary {
    margin-right: 16px;
  }
  &__form {
    flex: 1;
  }
  &__bottom {
    margin-top: 24px;
  }
}
</style>
