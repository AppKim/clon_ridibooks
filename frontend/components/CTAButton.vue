<template>
  <button class="cta-button" :class="[type, size]" @click="clickHandler">
    <slot />
  </button>
</template>
<script>
import { defineComponent } from '@nuxtjs/composition-api'

export default defineComponent({
  props: {
    type: {
      type: String,
      default: 'primary',
    },
    size: {
      type: String,
      default: 'medium',
    },
    disabled: {
      type: Boolean,
      default: false,
    },
  },
  name: 'CTAButton',
  setup(_, { emit }) {
    const clickHandler = () => {
      emit('click')
    }
    return {
      clickHandler,
    }
  },
})
</script>

<style lang="scss" scoped>
.cta-button {
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: background 0.2s;
  border-radius: 3px;
  &.small {
    height: 40px;
    font-size: 1.4rem;
  }
  &.medium {
    height: 46px;
    font-size: 1.5rem;
  }
  &.big {
    height: 51px;
    font-size: 1.6rem;
  }
  &.primary {
    color: white;
    border: 1px solid #0077d9;
    background: #1f8ce6;
    &:hover {
      background: #0077d9;
    }
  }
  &.secondary {
    color: white;
    // 추가하고 싶은 색깔 추가
  }
}
</style>
