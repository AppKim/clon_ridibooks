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

<style lang="scss" scoped>
.category-link-list {
  color: #fff;
  font-weight: 300;
  font-size: 13px;
  .icon {
    font-size: 9px;
    margin: 0 4px;
  }
  @include sp_view {
    .category-link-list {
      color: rgb(158, 167, 173);
      font-size: 12px;
    }
    .icon {
      font-size: 9px;
      margin: 0 4px;
    }
  }
}
</style>
