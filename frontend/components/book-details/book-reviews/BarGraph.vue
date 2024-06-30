<template>
  <div class="bar-graph" :style="{ width: width, height: height }">
    <div class="bar-graph__progress" :style="{ width: percent + '%', height: height }" />
  </div>
</template>

<script>
import { defineComponent } from '@nuxtjs/composition-api'

export default defineComponent({
  props: {
    width: {
      type: String,
      default: '72px',
    },
    height: {
      type: String,
      default: '8px',
    },
    percent: {
      type: Number, //
      default: 0,
    },
  },
  setup() {},
})
</script>

<style lang="scss" scoped>
.bar-graph {
  display: inline-block;
  background: #e8edf3;
  box-shadow: inset 0 1px 1px 0 rgb(0 0 0 / 10%);
  &__progress {
    background: linear-gradient(180deg, #9daab5, #718392);
  }
}
</style>
