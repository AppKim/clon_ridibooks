<template>
  <ul class="score-distribution">
    <li v-for="i in 5" :key="i" class="score-distribution__row">
      <fa-icon class="score-distribution__star" :icon="['fas', 'star']" />
      <span class="score-distribution__count">{{ 6 - i }}</span>
      <BarGraph class="score-distribution__bar" :percent="getPercentage(5 - i)" />
      <span class="score-distribution__number">{{ distribution[5 - i] }}</span>
    </li>
  </ul>
</template>

<script>
import { defineComponent } from '@nuxtjs/composition-api'
import BarGraph from './BarGraph.vue'

export default defineComponent({
  components: { BarGraph },
  props: {
    distribution: {
      type: Array,
      required: true,
    },
    totalCount: {
      type: Number,
      required: true,
    },
  },

  setup(props) {
    const getPercentage = (index) => {
      if (props.totalCount === 0) return 0
      return Math.round((props.distribution[index] / props.totalCount) * 100)
    }

    return {
      getPercentage,
    }
  },
})
</script>

<style lang="scss" scoped>
.score-distribution {
  display: flex;
  flex-direction: column;
  row-gap: 2px;

  &__row {
    display: flex;
    align-items: center;
    color: #808991;
    font-size: 12px;
    font-weight: 500;
  }
  &__star {
    width: 18px;
    text-align: left;
    font-size: 9px;
  }
  &__count {
    width: 10px;
    text-align: left;
    line-height: 1;
    margin-right: 8px;
  }
  &__number {
    margin-left: 8px;
    min-width: 20px;
  }
}
</style>
