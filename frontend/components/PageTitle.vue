<template>
  <h1 class="page-title">
    {{ title }}
  </h1>
</template>

<script>
import { defineComponent } from '@nuxtjs/composition-api'

export default defineComponent({
  props: {
    title: {
      type: String,
      default: '',
    },
  },
  setup() {},
})
</script>

<style lang="scss" scoped>
.page-title {
  min-height: 24px;
  margin: 50px auto 17px;
  font-size: 2rem;
  line-height: 1;
}
</style>
