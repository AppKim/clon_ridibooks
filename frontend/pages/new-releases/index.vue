<template>
  <div class="new-releases">
    <PageTitle class="new-releases__title" title="최신 업데이트" />
    <BookThumbnailLinkGrid :bookList="recentReleaseBooks" />
    <Pager />
  </div>
</template>
<script>
import { defineComponent, ref, useContext, useFetch } from '@nuxtjs/composition-api'
import BookThumbnailLinkGrid from '~/components/BookThumbnailLinkGrid.vue'
import PageTitle from '~/components/PageTitle.vue'
import Pager from '~/components/Pager.vue'

export default defineComponent({
  components: { BookThumbnailLinkGrid, PageTitle, Pager },
  setup() {
    const { $repositories } = useContext()
    const recentReleaseBooks = ref([])

    useFetch(async () => {
      // TODO: store에 넣어서 관라?
      const { books } = await $repositories('collections').get.recent()
      recentReleaseBooks.value = books
    })
    return {
      recentReleaseBooks,
    }
  },
})
</script>

<style lang="scss" scoped>
.new-releases {
  width: 800px;
  margin: 0 auto;
  @include sp_view {
    width: 100%;
    margin: 0 auto;
    &__title {
      display: none;
    }
  }
}
</style>
