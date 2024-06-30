<template>
  <div class="review-list">
    <div class="review-list__header">
      <ul class="review-list__tabs">
        <li class="active">
          구매자
          <span>19</span>
        </li>
        <li>
          전체
          <span>21</span>
        </li>
      </ul>
      <ul class="review-list__sortable-list">
        <li>최신순</li>
        <li>공감순</li>
        <li>별점 높은순</li>
        <li>별점 낮은순</li>
      </ul>
    </div>
    <ReviewItem v-for="i in 5" :key="i" />
  </div>
</template>
<script>
import { defineComponent } from '@nuxtjs/composition-api'
import ReviewItem from './ReviewItem.vue'

export default defineComponent({
  components: { ReviewItem },
  setup() {},
})
</script>

<style lang="scss" scoped>
.review-list {
  &__header {
    display: flex;
    justify-content: space-between;
    box-shadow: inset 0 -2px 0 0 #d1d5d9;
  }
  &__tabs {
    display: flex;
    font-size: 13px;
    color: #808991;
    column-gap: 8px;
    li {
      cursor: pointer;
      padding: 12px 4px;
      &.active {
        border-bottom: 2px solid #40474d;
        color: #40474d;
        font-weight: 600;
      }
    }
  }
  &__sortable-list {
    display: flex;
    font-size: 12px;
    color: #808991;
    li {
      cursor: pointer;
      padding: 0px 8px;
      margin: 12px 0 8px 0;
      height: fit-content;
      &:not(:last-child) {
        border-right: 1px solid #ccc;
      }
    }
  }
}
</style>
