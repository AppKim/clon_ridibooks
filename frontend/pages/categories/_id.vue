<template>
  <div class="container">
    <CategoryButton :category-btn-name="categoryBtnName" @open="openModal" />
    <CategoryField :category-field-item="categoryFieldItem" />
    <CategoryModal v-if="isModalBtn" :categories="categories" @close="closeModal" />
    <SelectButton />
  </div>
</template>

<script>
import { ref, useRoute, useFetch, useStore, computed } from '@nuxtjs/composition-api'
import CategoryButton from '../../components/category/CategoryButton.vue'
import CategoryModal from '../../components/category/CategoryModal.vue'
import CategoryField from '../../components/category/CategoryField.vue'
import SelectButton from '../../components/category/SelectButton.vue'
export default {
  components: { CategoryButton, CategoryModal, CategoryField, SelectButton },
  setup() {
    const store = useStore()
    const route = useRoute()
    const id = computed(() => route.value.params.id)
    const isModalBtn = ref(false)

    // computed
    const categories = computed(() => store.getters.categories)
    const categoryBtnName = computed(() => store.getters.selectCategory.name)
    // vuex state category
    const categoryFieldItem = computed(() => store.getters.selectCategory)

    // store category가 null인지 판정하는 함수
    const isEmptyObject = (param) => {
      return Object.keys(param).length === 0 && param.constructor === Object
    }

    // 서버에서 카테고리 전체를 불러와서 vuex state에 저장
    useFetch(async () => {
      // store categories가 null이면 actions 실행
      if (store.state.categories.length === 0) {
        await store.dispatch('getCategories')
        store.commit('ADD_CATEGORY', Number(id.value))
        // store categories가 not null
      } else if (store.state.categories.length > 0) {
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
      openModal,
      closeModal,
    }
  },
}
</script>

<style lang="scss" scoped>
.container {
  display: block;
  width: 100%;
  margin: 0px 25% 0px 25%;
  padding: 40px 0px 0px;
}
</style>
