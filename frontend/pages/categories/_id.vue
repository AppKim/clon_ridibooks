<template>
  <div class="container">
    <CategoryButton :category-btn-name="categoryBtnName" @open="openModal" />
    <CategoryField :category-field-item="categoryFieldItem" />
    <CategoryModal v-if="isModalBtn" :categories="categories" @close="closeModal" />
    <SelectButton />
  </div>
</template>

<script>
import { ref, useRoute, useContext, useFetch, useStore, computed } from '@nuxtjs/composition-api'
import CategoryButton from '../../components/category/CategoryButton.vue'
import CategoryModal from '../../components/category/CategoryModal.vue'
import CategoryField from '../../components/category/CategoryField.vue'
import SelectButton from '../../components/category/SelectButton.vue'
export default {
  components: { CategoryButton, CategoryModal, CategoryField, SelectButton },
  setup() {
    const { $repositories } = useContext()
    const store = useStore()
    const route = useRoute()
    const id = computed(() => route.value.params.id)

    const categories = ref([])
    const categoryBtnName = ref('')
    const isModalBtn = ref(false)
    const categoryFieldItem = ref([])
    const tempCategory = ref([])
    const tempCategories = ref([])

    /*
    TODO:  서버에서 카테고리 전체를 불러와서 vuex state에 저장한 후
           url 파라미터로 들어온 id값에 해당하는 카테고리를 불러와서 화면에 표시
    */

    // 서버에서 카테고리 전체를 불러와서 vuex state에 저장
    useFetch(async () => {
      // store categories가 null인지 판정
      // null이면 서버에서 categories 데이터를 가져와서 store에 저장
      if (store.state.categories.length === 0) {
        categories.value = await $repositories('categories').get.categories()
        store.commit('addCategories', categories.value)
        tempCategory.value = categories.value.find((item) => item.id === Number(id.value))
        store.commit('addCategory', tempCategory.value)
        categoryBtnName.value = tempCategory.value.name
      } else {
        tempCategories.value = computed(() => store.getters.selectCategories)
        categories.value = tempCategories.value.value
        // store category가 null인지 판정
        if (store.getters.selectCategory.length === 0) {
          tempCategory.value = categories.value.find((item) => item.id === Number(id.value))
          store.commit('addCategory', tempCategory.value)
          categoryBtnName.value = tempCategory.value.name
        } else {
          tempCategory.value = computed(() => store.getters.selectCategory)
          categoryBtnName.value = tempCategory.value.value.name
        }
      }
    })

    // vuex state category
    categoryFieldItem.value = computed(() => store.getters.selectCategory)

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
