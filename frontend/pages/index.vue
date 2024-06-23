<template>
  <div class="top">
    <TopBannerCarousel></TopBannerCarousel>
    <BestBookList :books="bestBooks" />
    <div class="selection-list">
      <div v-for="selection in selections.slice(0, 2)" :key="selection.id" class="selection">
        <SelectionPreview :selection="selection" />
      </div>
      <PopularBookList></PopularBookList>
      <div v-for="selection in selections.slice(3)" :key="selection.id" class="selection">
        <SelectionPreview :selection="selection" />
      </div>
    </div>
  </div>
</template>

<script>
import { defineComponent, useContext, useFetch, ref } from '@nuxtjs/composition-api'
import TopBannerCarousel from '~/components/top/TopBannerCarousel'
import SelectionPreview from '~/components/top/SelectionPreview'
import BestBookList from '~/components/top/BestBookList'
import PopularBookList from '~/components/top/PopularBookList'

export default defineComponent({
  components: {
    SelectionPreview,
    TopBannerCarousel,
    BestBookList,
    PopularBookList,
  },
  setup() {
    const selections = ref([])
    const bestBooks = ref()
    const { $repositories } = useContext()

    useFetch(async () => {
      const homeResponse = await $repositories('top', false).get.home()
      selections.value = homeResponse.selections
      const bestBooksResponse = await $repositories('collections', false).get.spotlight()
      bestBooks.value = bestBooksResponse.books
    })

    return {
      selections,
      bestBooks,
    }
  },
})
</script>

<style lang="scss" scoped>
.top {
  .selection-list {
    width: 800px;
    margin: 0 auto;
    .selection {
      padding: 60px 0 0;
    }
  }
  @include sp_view {
    .selection-list {
      width: 100%;
      margin: 0 auto;
      .selection {
        padding: 30px 20px 0px;
      }
    }
  }
}
</style>
