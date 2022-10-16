<template>
  <div class="book-summary">
    <BookThumbnail
      class="book-summary__thumbnail"
      size="xLarge"
      src="https://img.ridicdn.net/cover/1046000135/xxlarge#1"
    />
    <div class="book-summary__contents">
      <CategoryLinkList />
    </div>
  </div>
</template>
<script>
import { defineComponent } from '@nuxtjs/composition-api'
import BookThumbnail from '../BookThumbnail.vue'
import CategoryLinkList from './CategoryLinkList.vue'

export default defineComponent({
  components: { BookThumbnail, CategoryLinkList },
  setup() {},
})
</script>

<style lang="scss" scoped>
.book-summary {
  width: 800px;
  margin: auto;
  padding: 50px 0;
  &__thumbnail {
    cursor: zoom-in;
  }
}
</style>
