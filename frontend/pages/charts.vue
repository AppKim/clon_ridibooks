<template>
  <div>
    <page-title :title="title"></page-title>
    <chart-thumbnail :books="books"></chart-thumbnail>
    <pager :currentPage="pageParam" :totalPage="totalPage" @onChangePage="changePageHandler"></pager>
  </div>
</template>

<script>
import { defineComponent, useContext, ref, useFetch, useRoute, computed, useRouter } from '@nuxtjs/composition-api'
import ChartThumbnail from '../components/charts/ChartThumbnail.vue'
import PageTitle from '../components/PageTitle.vue'
export default defineComponent({
  components: { ChartThumbnail, PageTitle },
  setup() {
    const books = ref([])
    const title = '인기도서'
    const { $repositories } = useContext()
    const route = useRoute()
    const router = useRouter()
    const totalPage = ref()
    useFetch(async () => {
      const res = await $repositories('charts').get.books(pageParam.value)
      console.log(pageParam.value)
      books.value = res.books
      totalPage.value = res.total_page
    })
    const pageParam = computed(() => {
      return Number(route.value.query.page) || 1
    })
    const changePageHandler = (pageNum) => {
      router.push(`/charts?page=${pageNum}`)
    }
    return {
      title,
      books,
      totalPage,
      pageParam,
      changePageHandler,
    }
  },
})
</script>

<style lang="scss" scoped></style>
