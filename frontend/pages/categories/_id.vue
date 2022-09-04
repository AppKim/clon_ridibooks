<template>
  <div class="container">
    <CategoryButton :category-btn-name="categoryBtnName" @open="openModal" />
    <CategoryField :category-field-item="categoryFieldItem" :category-btn-name="categoryBtnName" :category-id="id" />
    <CategoryModal v-if="isModalBtn" :categories="categories" @close="closeModal" />
    <SelectButton />
    <div class="grid-booklist-wrapper">
      <nuxt-link to="">
        <ul class="book-wrapper">
          <li v-for="i in 10" :key="i" class="book-list-item">
            <BookThumbnail size="medium" src="https://placeimg.com/150/200/any" alt="sample image" />
            <BookThumbnailTitle class="book-title" :title="bookTitle"></BookThumbnailTitle>
          </li>
        </ul>
      </nuxt-link>
    </div>
  </div>
</template>

<script>
import { ref, useRoute, useFetch, useStore, computed } from '@nuxtjs/composition-api'
import CategoryButton from '../../components/category/CategoryButton.vue'
import CategoryModal from '../../components/category/CategoryModal.vue'
import CategoryField from '../../components/category/CategoryField.vue'
import SelectButton from '../../components/category/SelectButton.vue'
import BookThumbnail from '../../components/BookThumbnail.vue'
import BookThumbnailTitle from '../../components/BookThumbnailTitle.vue'
export default {
  components: { CategoryButton, CategoryModal, CategoryField, SelectButton, BookThumbnail, BookThumbnailTitle },
  setup() {
    const store = useStore()
    const route = useRoute()
    const id = computed(() => route.value.params.id)
    const isModalBtn = ref(false)
    const bookTitle = '불편한 편의점'
    // computed
    const categories = computed(() => store.getters.categories)
    const categoryBtnName = computed(() => store.getters.selectCategory.name)
    // vuex state category
    const categoryFieldItem = computed(() => store.getters.selectCategory)

    // store category가 null인지 판정하는 함수
    const isEmptyObject = (param) => {
      return Object.keys(param).length === 0 && param.constructor === Object
    }

    useFetch(async () => {
      await store.dispatch('getNovels')
    })

    // 서버에서 카테고리 전체를 불러와서 vuex state에 저장
    useFetch(async () => {
      // store categories가 null이면 actions 실행
      if (store.state.categories.length === 0) {
        await store.dispatch('getCategories')
        store.commit('ADD_CATEGORY', Number(id.value))
        // store categories가 not null
      } else {
        if (isEmptyObject(store.getters.selectCategory)) {
          store.commit('ADD_CATEGORY', Number(id.value))
        }
      }
    })

    // open modal dialog
    const openModal = () => {
      isModalBtn.value = true
    }

    // close modal dialog
    const closeModal = () => {
      isModalBtn.value = false
    }

    return {
      categories,
      categoryFieldItem,
      categoryBtnName,
      isModalBtn,
      bookTitle,
      openModal,
      closeModal,
    }
  },
}
</script>

<style lang="scss" scoped>
.container {
  display: block;
  width: 880px;
  margin: 0 auto;
  padding: 40px 0px 0px 0px;
}

.grid-booklist-wrapper {
  max-width: 880px;
  min-width: 320px;
}

.book-wrapper {
  display: flex;
  flex-wrap: wrap;
  padding-top: 16px;
}

.book-list-item {
  margin-left: 16px;
}

.book-title {
  margin-top: 10px;
  font-size: 13px;
  font-weight: 400px;
}
</style>
