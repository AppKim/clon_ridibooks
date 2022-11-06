<template>
  <div class="book-meta">
    <CategoryLinkList :categories="categories" />
    <div class="book-meta__book-title">팍스</div>
    <div class="book-meta__book-elements">
      <span>이산화 저 · </span>
      <span>안전가옥 출판 · </span>
      <span>EPUB · </span>
      <span>5.3MB · </span>
      <span>약 13.2만 자</span>
    </div>
    <ReviewStars class="book-meta__review" starSize="big" :isShowReviewScore="true" :isShowReviewCount="true" />
    <CTAButton class="book-meta__add-select-btn"> 마이 셀렉트 추가 </CTAButton>
  </div>
</template>
<script>
import { defineComponent } from '@nuxtjs/composition-api'
import CTAButton from '../CTAButton.vue'
import ReviewStars from '../ReviewStars.vue'
import CategoryLinkList from './CategoryLinkList.vue'

export default defineComponent({
  components: { CategoryLinkList, ReviewStars, CTAButton },
  setup() {
    const categories = [
      {
        id: '12',
        name: '소설',
      },
      {
        id: '14',
        name: '추리소설',
      },
    ]
    return {
      categories,
    }
  },
})
</script>

<style lang="scss" scoped>
.book-meta {
  display: flex;
  flex-direction: column;
  flex: 1;
  justify-content: center;
  &__book-title {
    color: #fff;
    font-size: 30px;
    margin-top: 16px;
  }
  &__book-elements {
    margin-top: 16px;
    font-size: 1.3rem;
    color: #fff;
  }
  &__review {
    margin-top: 8px;
  }
  &__add-select-btn {
    margin-top: 32px;
    width: 170px;
  }
  @include sp_view {
    padding: 20px;
    &__book-title {
      color: #222;
      margin-top: 8px;
    }
    &__book-elements {
      margin-top: 8px;
      color: #646c73;
    }
    &__review {
      margin: 0;
    }
    &__add-select-btn {
      margin-top: 16px;
      width: 100%;
    }
  }
}
</style>
