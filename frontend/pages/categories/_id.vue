<template>
  <div class="container">
    <CategoryButton :category-btn-name="categoryBtnName" @open="openModal" />
    <CategoryField :category-field-item="categoryFieldItem" />
    <CategoryModal v-if="isModalBtn" :categories="categories" @close="closeModal" />
    <SelectButton />
  </div>
</template>

<script>
import { ref, useContext, useFetch, useStore, computed } from '@nuxtjs/composition-api'
import CategoryButton from '../../components/category/CategoryButton.vue'
import CategoryModal from '../../components/category/CategoryModal.vue'
import CategoryField from '../../components/category/CategoryField.vue'
import SelectButton from '../../components/category/SelectButton.vue'
export default {
  components: { CategoryButton, CategoryModal, CategoryField, SelectButton },
  setup() {
    const { $repositories } = useContext()
    const store = useStore()
    // const route = useRoute()
    // const id = computed(() => route.value.params.id)

    // 서버에서 불러온 카테고리를 저장할 변수
    const categories = ref([])
    const categoryBtnName = ref('')
    const isModalBtn = ref(false)
    const categoryFieldItem = ref([])

    /*
    TODO:  서버에서 카테고리 전체를 불러와서 vuex state에 저장한 후
           url 파라미터로 들어온 id값에 해당하는 카테고리를 불러와서 화면에 표시
    */

    // 서버에서 카테고리 전체를 불러와서 vuex state에 저장
    useFetch(async () => {
      categories.value = await $repositories('categories').get.categories()
      store.commit('add', categories.value)
      // store.state.categories = categories.value
    })

    // vuex state categories
    const storeCategories = computed(() => store.state.categories)
    console.log(storeCategories.value)

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
