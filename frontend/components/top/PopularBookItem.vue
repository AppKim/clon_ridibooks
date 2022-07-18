<template>
  <div class="popular-book-item">
    <div class="popular-book-item__ranking">{{ rankNum }}</div>
    <book-thumbnail src="https://placeimg.com/150/200/any" size="small" alt="book.title" />
    <div class="popular-book-item__book-info">
      <div>사상 최강의 철학 입문</div>
      <div class="popular-book-item__review">
        <div class="popular-book-item__review__stars">
          <div class="popular-book-item__review__stars--forward" style="width: 92%">
            <fa-icon v-for="i in 5" :key="i" :icon="['fas', 'star']" />
          </div>
          <div class="popular-book-item__review__stars--backward">
            <fa-icon v-for="i in 5" :key="i" :icon="['fas', 'star']" />
          </div>
        </div>
        <span class="popular-book-item__review__count"> 149 </span>
      </div>
    </div>
  </div>
</template>
<script>
import { defineComponent } from '@nuxtjs/composition-api'
import BookThumbnail from '../BookThumbnail.vue'

export default defineComponent({
  props: {
    rankNum: {
      type: Number,
      required: true,
    },
    book: {
      type: Object,
      required: true,
    },
  },
  components: { BookThumbnail },
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
  &__review {
    font-size: 1.2rem;
    display: flex;
    align-items: center; // #f96b1f
    &__stars {
      position: relative;
      min-height: 12px;
      min-width: 62px;
      font-size: 1.1rem;
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
      margin-top: 1px;
      margin-left: 3px;
      color: rgb(158, 167, 173);
      vertical-align: top;
    }
  }
}
</style>
