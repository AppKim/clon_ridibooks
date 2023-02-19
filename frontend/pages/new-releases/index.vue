<template>
  <div class="new-releases">
    <PageTitle class="new-releases__title" title="최신 업데이트" />
    <BookThumbnailLinkGrid :book-list="recentReleaseBooks" />
    <Pager :current-page="+$route.query.page || 1" :total-page="100" @onChangePage="handleChangePage" />
  </div>
</template>
<script>
import { defineComponent, ref, useContext, useFetch, watch, useRoute, useRouter } from '@nuxtjs/composition-api'
import BookThumbnailLinkGrid from '~/components/BookThumbnailLinkGrid.vue'
import PageTitle from '~/components/PageTitle.vue'
import Pager from '~/components/Pager.vue'
export default defineComponent({
  components: { BookThumbnailLinkGrid, PageTitle, Pager },
  setup() {
    const { $repositories } = useContext()
    const recentReleaseBooks = ref([])
    const route = useRoute()
    const router = useRouter()

    const fetchRecentBooks = async (params) => {
      const { books } = await $repositories('collections').get.recent(params)
      recentReleaseBooks.value = books
    }
    useFetch(async () => {
      // TODO: store에 넣어서 관라?
      await fetchRecentBooks(route.query)
    })
    const handleChangePage = (pageNum) => {
      router.push(`/new-releases?page=${pageNum}`)
    }
    watch(route, async (currRoute) => {
      await fetchRecentBooks(currRoute.query)
    })
    return {
      recentReleaseBooks,
      handleChangePage,
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
