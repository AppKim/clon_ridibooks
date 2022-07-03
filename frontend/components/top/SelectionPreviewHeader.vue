<template>
  <div class="selection-preview-header">
    <h2 class="selection-preview-header__title">
      {{ title }}
    </h2>
    <nuxt-link class="selection-preview-header__button" :to="`selection/${selectionId}`">
      전체 보기
      <fa-icon class="icon" icon="angle-right" />
    </nuxt-link>
  </div>
</template>

<script>
import { defineComponent } from '@nuxtjs/composition-api'

export default defineComponent({
  props: {
    title: {
      type: String,
      required: true,
    },
    selectionId: {
      type: Number,
      required: true,
    },
  },
})
</script>

<style scoped lang="scss">
.selection-preview-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 16px;
  &__title {
    font-size: 1.8rem;
  }
  &__button {
    font-size: 1.4rem;
    color: #444;
    opacity: 0.7;
    text-decoration: none;
    .icon {
      font-size: 1.3rem;
    }
    &:hover {
      opacity: 1;
    }
  }
  @include sp_view {
    &__title {
      font-size: 1.6rem;
    }
  }
}
</style>
