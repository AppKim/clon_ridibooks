<template>
  <div class="top">
    <TopBannerCarousel></TopBannerCarousel>
    <BestBookList :books="bestBooks" />
    <div class="top__main">
      <div v-for="(selection, i) in selections" :key="selection.id" class="top__selection">
        <PopularBooks v-if="i === 2" />
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
import PopularBooks from '~/components/top/PopularBooks'

export default defineComponent({
  components: {
    SelectionPreview,
    TopBannerCarousel,
    BestBookList,
    PopularBooks,
  },
  setup() {
    const selections = ref([])
    const bestBooks = ref([])
    const { $repositories } = useContext()

    useFetch(async () => {
      selections.value = await $repositories('books').get.selections()
      bestBooks.value = await $repositories('books').get.best()
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
  &__main {
    width: 800px;
    margin: 0 auto;
  }
  &__selection {
    padding: 60px 0 0;
  }
  @include sp_view {
    &__main {
      width: 100%;
      margin: 0 auto;
    }
    &__selection {
      padding: 30px 20px 0px;
    }
  }
}
</style>
