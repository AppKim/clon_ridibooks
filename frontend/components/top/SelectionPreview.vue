<template>
  <div class="selection-preview">
    <TopContentsHeader :title="collection.title" :link="`/selection/${collection.collection_id}`" />
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
    collection: {
      type: Object,
      default: () => ({}),
    },
  },
  setup(props) {
    const bookList = computed(() => {
      return props.collection.books.map((book) => ({
        ...book,
        src: book.thumnail || 'https://img.ridicdn.net/cover/1242001114/xlarge?dpi=xxhdpi', // TODO: thumnail.smallから取ってくるようにする
        alt: book.title.main,
        title: book.title.main,
        link: `book/${book.id}`,
        author: book.authors || [],
      }))
    })
    return { bookList }
  },
})
</script>

<style lang="scss" scoped></style>
