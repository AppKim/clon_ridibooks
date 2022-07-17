<template>
  <div class="popular-books">
    <TopContentsHeader title="인기도서" link="/charts" />
    <div class="popular-books__contents">
      <PopularBookItem class="popular-books__contents__item" v-for="i in 12" :key="i" :rank-num="i" />
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
.popular-books {
  &__contents {
    display: grid;
    grid-auto-flow: column;
    grid-template-columns: 1fr 1fr 1fr;
    grid-template-rows: 1fr 1fr 1fr 1fr;
    margin: 0 auto 60px auto;
    column-gap: 16px;
    &__item {
      &:nth-of-type(1) {
        display: none;
      }
    }
  }
}
</style>
