<template>
  <div class="review-item">
    <div class="review-item__left">
      <ReviewStars />
      <div class="review-item__profile">
        <span class="review-item__profile__id"> iml**** </span>
        <span class="review-item__profile__roles"> 구매자 </span>
      </div>
      <div class="review-item__date">2023.02.19</div>
    </div>
    <div class="review-item__right">
      <div class="review-item__comments">현대 노동에 대해 들여다 볼 수 있는 소설이네요.</div>
      <div class="review-item__buttons">
        <button class="review-item__buttons__like" @click="handleClickLikeButton">
          <fa-icon :icon="['fas', 'thumbs-up']" /> 0
        </button>
      </div>
    </div>
  </div>
</template>
<script>
import { defineComponent } from '@nuxtjs/composition-api'
import ReviewStars from '../../ReviewStars.vue'

export default defineComponent({
  components: {
    ReviewStars,
  },
  setup() {
    const handleClickLikeButton = () => {
      console.log('like')
    }

    return {
      handleClickLikeButton,
    }
  },
})
</script>

<style lang="scss" scoped>
.review-item {
  display: flex;
  padding: 12px 2px;
  border-top: 1px solid #d1d5d9;
  &__left {
    display: flex;
    flex-direction: column;
    row-gap: 8px;
    margin-right: 16px;
  }
  &__profile {
    display: flex;
    font-size: 11px;
    align-items: center;
    &__id {
      margin-right: 6px;
      color: #212529;
      font-weight: 700;
    }
    &__roles {
      display: inline-block;
      color: #fff;
      padding: 2px 3px;
      border-radius: 3px;
      background: #72808b;
    }
  }
  &__date {
    color: #808991;
    font-size: 11px;
    line-height: 1;
  }
  &__right {
    position: relative;
  }
  &__comments {
    padding: 0 0 10px;
    color: #212529;
    font-size: 13px;
    line-height: 1.7em;
  }
  &__buttons {
    &__like {
      color: #646c73;
      background: #fff;
      padding: 2px 8px;
      border: 1px solid #646c73;
      border-radius: 3px;
    }
  }
}
</style>
