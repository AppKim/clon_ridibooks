<template>
  <div class="container">
    <!-- category select button -->
    <CategoryButton :category-btn-name="categoryBtnName" @open="openModal" />
    <!-- category buttons  -->
    <CategoryField
      :category-field-item="categoryFieldItem"
      :category-btn-name="categoryBtnName"
      :category-children-id="categoryChildrenId"
      @categoryChildrenId="setCategoryChildrenId"
    />
    <!-- Modal when category button is clicked -->
    <CategoryModal v-if="isModalBtn" :categories="categories" @close="closeModal" />
    <!-- popular recent button -->
    <SelectButton @changeBtnItem="changePopularRecent" />
    <div class="grid-booklist-wrapper">
      <nuxt-link to="">
        <ul class="book-wrapper">
          <li v-for="i in 24" :key="i" class="book-list-item">
            <BookThumbnail size="medium" src="https://placeimg.com/150/200/any" alt="sample image" />
            <BookThumbnailTitle class="book-title" :title="bookTitle"></BookThumbnailTitle>
          </li>
        </ul>
      </nuxt-link>
    </div>
    <div class="pagination--wrapper">
      <Pager></Pager>
    </div>
  </div>
</template>

<script>
import { ref, useRoute, useFetch, useStore, computed, useRouter, watch } from '@nuxtjs/composition-api'
import CategoryButton from '../../components/category/CategoryButton.vue'
import CategoryModal from '../../components/category/CategoryModal.vue'
import CategoryField from '../../components/category/CategoryField.vue'
import SelectButton from '../../components/category/SelectButton.vue'
import BookThumbnail from '../../components/BookThumbnail.vue'
import BookThumbnailTitle from '../../components/BookThumbnailTitle.vue'
import Pager from '../../components/Pager.vue'
export default {
  components: { CategoryButton, CategoryModal, CategoryField, SelectButton, BookThumbnail, BookThumbnailTitle, Pager },
  setup() {
    const store = useStore()
    const route = useRoute()
    const router = useRouter()
    const id = computed(() => route.value.params.id)
    const isModalBtn = ref(false)
    const bookTitle = '부자의 그릇'
    // computed
    const categories = computed(() => store.getters['categories/categories'])
    const categoryBtnName = computed(() => store.getters['categories/selectCategory'].name)
    // vuex state category
    const categoryFieldItem = computed(() => store.getters['categories/selectCategory'])
    const categoryChildrenId = computed(() => store.getters['categories/selectCategoryChildrenId'])

    // store category가 null인지 판정하는 함수
    const isEmptyObject = (param) => {
      return Object.keys(param).length === 0 && param.constructor === Object
    }

    // 인기순 최신순 버튼 change 이벤트 발생시 router 실행
    const changePopularRecent = (params) => {
      router.push(`/categories/${route.value.params.id}?sort=${params}&page=1`)
    }

    // route를 감지하여 백엔드에 쿼리 요청
    watch(route, (newValue) => {
      store.dispatch('categories/getSelectBtnItem', { sort: newValue })
    })

    // 서버에서 카테고리 전체를 불러와서 vuex state에 저장
    useFetch(async () => {
      // 카테고리에서 선택한 탭을 기억하여 다시 불러오기
      if (sessionStorage.length > 0) {
        id.value = sessionStorage.getItem(id)
      }

      // store categories가 null이면 actions 실행
      if (store.getters['categories/categories'].length === 0) {
        await store.dispatch('categories/getCategories')
        store.commit('categories/ADD_CATEGORY', Number(id.value))
        // store categories가 not null
      } else {
        if (isEmptyObject(store.getters['categories/selectCategory'])) {
          store.commit('categories/ADD_CATEGORY', Number(id.value))
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

    const setCategoryChildrenId = (id) => {
      store.commit('categories/ADD_CATEGORY_CHILDREN_ID', id)
    }

    return {
      categories,
      categoryFieldItem,
      categoryBtnName,
      isModalBtn,
      bookTitle,
      categoryChildrenId,
      openModal,
      closeModal,
      setCategoryChildrenId,
      changePopularRecent,
    }
  },
}
</script>

<style lang="scss" scoped>
.container {
  display: block;
  width: 810px;
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
}

.book-list-item {
  margin-left: 16px;
}

.book-title {
  margin-top: 10px;
  font-size: 13px;
  font-weight: 400px;
}

.pagination--wrapper {
  padding-top: 40px;
}
</style>
