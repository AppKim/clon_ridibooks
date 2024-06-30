<template>
  <div class="bookthumnail__title">{{ title }}</div>
</template>

<script>
import { defineComponent } from '@nuxtjs/composition-api'

export default defineComponent({
  components: {},
  props: {
    title: {
      type: String,
      default: '',
    },
  },
  setup: {},
})
</script>

<style lang="scss" scoped>
.bookthumnail__title {
  font-size: 13px;
  margin: 10px 0 0;
}
</style>
