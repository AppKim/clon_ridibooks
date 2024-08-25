<template>
  <div class="top">
    <TopBannerCarousel></TopBannerCarousel>
    <BestBookList :books="bestBooks" />
    <div class="selection-list">
      <div v-for="collection in collections.slice(0, 2)" :key="collection.collection_id" class="selection">
        <SelectionPreview :collection="collection" />
      </div>
      <PopularBookList></PopularBookList>
      <div v-for="collection in collections.slice(3)" :key="collection.collection_id" class="selection">
        <SelectionPreview :collection="collection" />
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
    const collections = ref([])
    const bestBooks = ref()
    const { $repositories } = useContext()

    useFetch(async () => {
      const homeResponse = await $repositories('top', false).get.home()
      collections.value = homeResponse.collections
      const bestBooksResponse = await $repositories('collections', false).get.spotlight()
      bestBooks.value = bestBooksResponse.books
    })

    return {
      collections,
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
