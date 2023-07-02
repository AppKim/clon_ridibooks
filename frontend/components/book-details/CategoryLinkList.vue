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
      type: Array,
      default: () => [],
    },
  },
})
</script>

<style lang="scss" scoped>
.category-link-list {
  color: #fff;
  font-weight: 400;
  font-size: 1.3rem;
  .icon {
    font-size: 0.9rem;
    margin: 0 4px;
  }
  @include sp_view {
    color: rgb(99, 108, 115);
    font-size: 1.2rem;
    .icon {
      font-size: 0.9rem;
      margin: 0 4px;
    }
  }
}
</style>
