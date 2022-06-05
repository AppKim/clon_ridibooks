<template>
  <div class="container">
    <CategoryButton :category-btn-name="categoryBtnName" @click.native="openModal" />
    <CategoryModal v-if="isModalBtn" :categories="categories" @close="closeModal" />
  </div>
</template>

<script>
import { ref } from '@vue/composition-api'
import axios from 'axios'
import { computed, useRoute } from '@nuxtjs/composition-api'
import CategoryButton from '../../components/category/CategoryButton.vue'
import CategoryModal from '../../components/category/CategoryModal.vue'
export default {
  components: { CategoryButton, CategoryModal },
  setup() {
    const categoryBtnName = ref('')
    const isModalBtn = ref(false)
    const route = useRoute()
    const categories = ref([])

    // category id
    const id = computed(() => route.value.params.id)

    // get categories
    const getCategories = async () => {
      try {
        const res = await axios.get(`http://localhost:4000/categories`)
        categories.value = res.data
      } catch (error) {
        error.value = 'Failed to get data'
      }
    }
    getCategories()

    // get category name
    const getCategoryName = async () => {
      try {
        const res = await axios.get(`http://localhost:4000/categories/${id.value}`)
        categoryBtnName.value = res.data.categoryName
      } catch (error) {
        error.value = 'Failed to get data'
      }
    }
    getCategoryName()

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
      categoryBtnName,
      isModalBtn,
      openModal,
      closeModal,
    }
  },
}
</script>

<style></style>
