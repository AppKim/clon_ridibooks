<template>
  <div class="review-rating-summary">
    <p>구매자 별점</p>
    <div>4.7</div>
    <ReviewStars star-size="medium" />
  </div>
</template>
<script>
import { defineComponent } from '@nuxtjs/composition-api'
import ReviewStars from '~/components/ReviewStars.vue'

export default defineComponent({
  components: { ReviewStars },
  setup() {},
})
</script>

<style lang="scss" scoped></style>
