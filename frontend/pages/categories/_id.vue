<template>
  <div class="container">
    <!-- category select button -->
    <CategoryButton :category-btn-name="categoryBtnName" @open="openModal" />
    <CategoryField
      :category-field-item="categoryFieldItem"
      :category-btn-name="categoryBtnName"
      :category-btn-id="categoryBtnId"
      :category-children-id="categoryChildrenId"
      @categoryChildrenId="setCategoryChildrenId"
    />
    <!-- Modal when category button is clicked -->
    <CategoryModal v-if="isModalBtn" :categories="categoryModalItems" @close="closeModal" />
    <!-- popular recent button -->
    <SelectButton @changeBtnItem="changePopularRecent" />
    <div class="grid-booklist-wrapper">
      <nuxt-link to="">
        <ul class="book-wrapper">
          <li v-for="i in 24" :key="i" class="book-list-item">
            <BookThumbnail
              size="medium"
              src="https://img.ridicdn.net/cover/1242001114/xlarge?dpi=xxhdpi"
              alt="sample image"
            />
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
import { ref, useRoute, useStore, computed, useRouter, watch, onMounted } from '@nuxtjs/composition-api'
import CategoryButton from '../../components/category/CategoryButton.vue'
import CategoryModal from '../../components/category/CategoryModal.vue'
import CategoryField from '../../components/category/CategoryField.vue'
import SelectButton from '../../components/category/SelectButton.vue'
import BookThumbnail from '../../components/BookThumbnail.vue'
import BookThumbnailTitle from '../../components/BookThumbnailTitle.vue'
import Pager from '../../components/Pager.vue'
export default {
  components: { CategoryButton, CategoryModal, SelectButton, BookThumbnail, BookThumbnailTitle, Pager, CategoryField },
  setup() {
    // 서버에서 카테고리 전체를 불러와서 vuex state에 저장
    onMounted(async () => {
      if (store.getters['categories/categories'].length === 0) {
        try {
          await store.dispatch('categories/getCategories')
        } catch (error) {
          console.error(error)
        }
      }
      const id = parseInt(route.value.params.id, 10)
      const found = categoryModalItems.value.find((item) => item.id === id)
      if (found) {
        categoryBtnName.value = found.name
        categoryBtnId.value = found.id
      }

      const foundCategory = findCategoryById(categories.value, id)
      if (foundCategory) {
        categoryBtnName.value = foundCategory.name
        if (foundCategory.children && foundCategory.children.length > 0) {
          categoryFieldItem.value = foundCategory.children // 자식 요소를 categoryFieldItem에 할당
        }
      }
    })
    const store = useStore()
    const route = useRoute()
    const router = useRouter()
    // const id = computed(() => route.value.params.id)
    const isModalBtn = ref(false)
    const categoryBtnName = ref('소설')
    const categoryBtnId = ref(1)
    const activeId = ref(1)
    const bookTitle = '부자의 그릇'

    // computed
    const categories = computed(() => store.getters['categories/categories'])
    const categoryModalItems = computed(() => store.getters['categories/categoryModalItems'])
    // const category = computed(() => store.getters['categories/category'])
    const categoryChildrenId = computed(() => store.getters['categories/selectCategoryChildrenId'])
    const categoryFieldItem = ref([])

    // 인기순 최신순 버튼 change 이벤트 발생시 router 실행
    const changePopularRecent = (params) => {
      router.push(`/categories/${route.value.params.id}?sort=${params}&page=1`)
    }

    // route를 감지하여 백엔드에 쿼리 요청
    watch(route, (newValue) => {
      store.dispatch('categories/getSelectBtnItem', { sort: newValue })
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

    const findCategoryById = (categories, id) => {
      for (const category of categories) {
        if (category.id === id) {
          // ID가 일치하는 카테고리 찾기
          return category
        }
        if (category.children) {
          // 자식 카테고리에서 ID 검색
          const found = findCategoryById(category.children, id)
          if (found) {
            // 자식 카테고리에서 찾았다면 부모 카테고리의 자식을 반환
            return category
          }
        }
      }
      return null
    }
    return {
      categories,
      categoryBtnName,
      isModalBtn,
      bookTitle,
      categoryChildrenId,
      openModal,
      closeModal,
      setCategoryChildrenId,
      changePopularRecent,
      categoryModalItems,
      categoryFieldItem,
      activeId,
      findCategoryById,
      categoryBtnId,
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
