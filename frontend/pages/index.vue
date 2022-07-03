<template>
  <div class="top">
    <div class="top__banner">
      <TopBannerCarousel></TopBannerCarousel>
    </div>
    <BestBookList :books="bestBooks" />
    <div class="top__main">
      <div v-for="(selection, i) in selections" :key="selection.id" class="top__selection">
        <div v-if="i === 2"></div>
        <SelectionPreview :selection="selection" />
      </div>
    </div>
  </div>
</template>

<script>
import { defineComponent, useContext, useAsync } from '@nuxtjs/composition-api'
import TopBannerCarousel from '~/components/top/TopBannerCarousel'
import SelectionPreview from '~/components/top/SelectionPreview'
import BestBookList from '~/components/top/BestBookList'

export default defineComponent({
  components: {
    SelectionPreview,
    TopBannerCarousel,
    BestBookList,
  },
  setup() {
    const { $repositories } = useContext()
    // const selections = ref([])
    // useFetch(async () => {
    //   const result = await $repositories('selections').get()
    //   console.log(result[0])
    //   selections.value = result
    // })
    const selections = useAsync(() => $repositories('books').get.selections())
    const bestBooks = useAsync(() => $repositories('books').get.best())

    return {
      selections,
      bestBooks,
    }
  },
})
</script>

<style lang="scss" scoped>
.top {
  &__banner {
    width: 1296px;
    margin: 0 auto;
  }
  &__main {
    width: 800px;
    margin: 0 auto;
  }
  &__selection {
    padding: 60px 0 0;
  }
  @include sp_view {
    &__banner {
      width: 100%;
    }
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
