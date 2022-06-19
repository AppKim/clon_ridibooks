<template>
  <div class="container">
    <CategoryButton :category-btn-name="categoryBtnName" @open="openModal" />
    <CategoryField :category-field-item="categoryFieldItem" />
    <CategoryModal v-if="isModalBtn" :categories="categories" @close="closeModal" />
    <SelectButton />
  </div>
</template>

<script>
import { ref } from '@vue/composition-api'
import axios from 'axios'
import { computed, useRoute } from '@nuxtjs/composition-api'
import CategoryButton from '../../components/category/CategoryButton.vue'
import CategoryModal from '../../components/category/CategoryModal.vue'
import CategoryField from '../../components/category/CategoryField.vue'
import SelectButton from '../../components/category/SelectButton.vue'
export default {
  components: { CategoryButton, CategoryModal, CategoryField, SelectButton },
  setup() {
    const categoryBtnName = ref('')
    const isModalBtn = ref(false)
    const route = useRoute()
    const categories = ref([])
    const temp = ref({})
    const categoryFieldItem = ref([])

    // category id
    const id = computed(() => route.value.params.id)

    // get categories
    const getCategories = async () => {
      try {
        const res = await axios.get(`http://localhost:7070/categories`)
        categories.value = res.data
        temp.value = res.data.find((item) => item.id === Number(id.value))
        categoryBtnName.value = temp.value.categoryName
        categoryFieldItem.value = temp.value.categoryFieldItems
      } catch (error) {
        error.value = 'Failed to get data'
      }
    }
    getCategories()

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
