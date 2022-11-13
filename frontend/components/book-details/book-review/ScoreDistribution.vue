<template>
  <ul class="score-distribution">
    <li v-for="i in 5" :key="i" class="score-distribution__star">
      <fa-icon v-for="j in 6 - i" :key="j" :icon="['fas', 'star']" />
    </li>
  </ul>
</template>
<script>
import { defineComponent } from '@nuxtjs/composition-api'

export default defineComponent({
  setup() {},
})
</script>

<style lang="scss" scoped></style>
