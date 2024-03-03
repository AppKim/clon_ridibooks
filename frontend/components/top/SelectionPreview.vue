<template>
  <div class="selection-preview">
    <TopContentsHeader :title="selection.title" :link="`/selection/${selection.id}`" />
    <BookThumbnailLinkList :book-list="bookList" />
  </div>
</template>

<script>
import { computed, defineComponent } from '@nuxtjs/composition-api'
import BookThumbnailLinkList from './BookThumbnailLinkList.vue'
import TopContentsHeader from './TopContentsHeader.vue'

export default defineComponent({
  components: {
    BookThumbnailLinkList,
    TopContentsHeader,
  },
  props: {
    selection: {
      type: Object,
      default: () => ({}),
    },
  },
  setup(props) {
    const bookList = computed(() => {
      return props.selection.books.map((book) => ({
        ...book,
        src: book.thumnail || 'https://img.ridicdn.net/cover/1242001114/xlarge?dpi=xxhdpi', // TODO: thumnail.smallから取ってくるようにする
        alt: book.title.main,
        title: book.title.main,
        link: `book/${book.id}`,
        author: '',
      }))
    })
    return { bookList }
  },
})
</script>

<style lang="scss" scoped>
.selection-preview {
}
</style>
