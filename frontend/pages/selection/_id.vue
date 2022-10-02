<template>
  <div>
    <page-title :title="title"></page-title>
    <selection-thumbnail :books="books"></selection-thumbnail>
  </div>
</template>

<script>
import { defineComponent, ref, useContext, useFetch } from '@nuxtjs/composition-api'
import PageTitle from '../../components/PageTitle.vue'
import SelectionThumbnail from '../../components/selection/SelectionThumbnail.vue'
export default defineComponent({
  components: { SelectionThumbnail, PageTitle },
  setup() {
    const books = ref([])
    const title = ref()
    const { $repositories, params } = useContext()
    const id = params.value.id
    useFetch(async () => {
      const res = await $repositories('selections').get.books(id)
      books.value = res.books
      title.value = res.title
    })
    return {
      books,
      title,
    }
  },
})
</script>

<style></style>
