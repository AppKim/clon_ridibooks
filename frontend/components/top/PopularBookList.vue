<template>
  <div class="popular-book-list">
    <TopContentsHeader title="인기도서" link="/charts" />
    <div class="popular-book-list__contents">
      <PopularBookItem class="popular-book-list__contents__item" v-for="i in 12" :key="i" :rank-num="i" />
    </div>
  </div>
</template>
<script>
import { defineComponent } from '@nuxtjs/composition-api'
import PopularBookItem from './PopularBookItem.vue'

export default defineComponent({
  components: { PopularBookItem },
  setup() {},
})
</script>

<style lang="scss" scoped>
.popular-book-list {
  &__contents {
    overflow: auto;
    display: grid;
    grid-auto-flow: column;
    grid-template-columns: 1fr 1fr 1fr;
    grid-template-rows: 1fr 1fr 1fr 1fr;
    margin: 0 auto 60px auto;
    &__item {
      &:nth-of-type(n + 5) {
        border-left: 1px solid #998b8272;
      }
    }
  }
}
</style>
