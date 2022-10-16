<template>
  <div class="category-link-list">
    <nuxt-link v-for="(category, idx) in categories" :key="idx" :to="`/categories${category.id}`">
      {{ category.name }}
      <fa-icon v-if="idx !== categories.length - 1" class="icon" icon="angle-right" />
    </nuxt-link>
  </div>
</template>
<script>
import { defineComponent } from '@nuxtjs/composition-api'

export default defineComponent({
  props: {
    categories: {
      type: [],
      default: () => [],
    },
  },
})
</script>

<style lang="scss" scoped></style>
