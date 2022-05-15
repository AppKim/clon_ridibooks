<template>
  <ul class="book-thumbnail-link-list">
    <li v-for="(book, i) in bookList" :key="i" class="book-thumbnail-link-list__item">
      <BookThumbnailLink
        :size="size"
        :src="book.src"
        :alt="book.alt"
        :to="book.link"
        :title="book.title"
        :author="book.author"
        :loading="loading"
      ></BookThumbnailLink>
    </li>
  </ul>
</template>

<script>
import { defineComponent } from '@nuxtjs/composition-api'
import BookThumbnailLink from '@/components/BookThumbnailLink.vue'

export default defineComponent({
  components: {
    BookThumbnailLink,
  },
  props: {
    bookList: {
      type: Array,
      default: () => [],
    },
    size: {
      type: String,
      default: 'medium',
    },
    loading: {
      type: String,
      default: 'lazy',
    },
  },
  setup() {},
})
</script>
<style lang="scss" scoped>
.book-thumbnail-link-list {
  display: flex;
  flex-wrap: nowrap;
  overflow: auto;
  &__item {
    &:not(:last-child) {
      margin-right: 12px;
    }
    &:nth-of-type(n + 7) {
      display: none;
    }
    @include sp_view {
      &:nth-of-type(n + 7) {
        display: block;
      }
    }
  }
}
</style>
