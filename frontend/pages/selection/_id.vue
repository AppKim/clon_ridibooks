<template>
  <div>
    <page-title :title="title"></page-title>
    <selection-thumbnail :books="books"></selection-thumbnail>
    <pager :currentPage="pageParam" :totalPage="totalPage" @onChangePage="changePageHandler"></pager>
  </div>
</template>

<script>
import { computed, defineComponent, ref, useContext, useFetch, useRoute, useRouter } from '@nuxtjs/composition-api'
import PageTitle from '../../components/PageTitle.vue'
import SelectionThumbnail from '../../components/selection/SelectionThumbnail.vue'
export default defineComponent({
  components: { SelectionThumbnail, PageTitle },
  setup() {
    const books = ref([])
    const title = ref()
    const totalPage = ref()
    const route = useRoute()
    const router = useRouter()
    const { $repositories, params } = useContext()
    const id = params.value.id || 2026
    useFetch(async () => {
      const res = await $repositories('selections').get.books(id)
      totalPage.value = res.total_page
      books.value = res.books
      title.value = res.title
    })
    const pageParam = computed(() => {
      return Number(route.value.query.page) || 1
    })
    const changePageHandler = (pageNum) => {
      router.push(`/selection/${id}?page=${pageNum}`)
    }
    return {
      books,
      title,
      pageParam,
      totalPage,
      changePageHandler,
    }
  },
})
</script>

<style></style>
