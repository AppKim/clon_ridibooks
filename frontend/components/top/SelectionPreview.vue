<template>
  <div class="selection-preview">
    <SelectionPreviewHeader :title="selection.title" :selection-id="selection.id" />
    <BookThumbnailLinkList :book-list="bookList" />
  </div>
</template>

<script>
import { computed, defineComponent } from '@nuxtjs/composition-api'
import BookThumbnailLinkList from './BookThumbnailLinkList.vue'
import SelectionPreviewHeader from './SelectionPreviewHeader.vue'

export default defineComponent({
  components: {
    BookThumbnailLinkList,
    SelectionPreviewHeader,
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
        alt: book.title,
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
