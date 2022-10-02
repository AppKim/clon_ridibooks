<template>
  <div>
    <page-title :title="title"></page-title>
    <chart-thumbnail :books="books"></chart-thumbnail>
  </div>
</template>

<script>
import { defineComponent, useContext, ref, useFetch } from '@nuxtjs/composition-api'
import ChartThumbnail from '../components/charts/ChartThumbnail.vue'
import PageTitle from '../components/PageTitle.vue'
export default defineComponent({
  components: { ChartThumbnail, PageTitle },
  setup() {
    const books = ref([])
    const title = '인기도서'
    const { $repositories } = useContext()
    useFetch(async () => {
      const res = await $repositories('charts').get.books()
      books.value = res.books
    })
    return {
      title,
      books,
    }
  },
})
</script>

<style lang="scss" scoped></style>
