<template>
  <chart-thumbnail :books="books"></chart-thumbnail>
</template>

<script>
import { defineComponent, useContext, ref, useFetch } from '@nuxtjs/composition-api'
import ChartThumbnail from '../components/charts/ChartThumbnail.vue'

export default defineComponent({
  components: { ChartThumbnail },
  setup() {
    const books = ref([])
    const { $repositories } = useContext()

    useFetch(async () => {
      const res = await $repositories('charts').get.books()
<<<<<<< HEAD
      books.value = res.books
=======
      console.log(res)
>>>>>>> cfb16b6 (add charts repository)
    })

    return {
      books,
    }
  },
})
</script>

<style lang="scss" scoped></style>
