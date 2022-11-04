<template>
  <div class="read-more">
    <div ref="readMoreRef" :style="styles">
      <slot></slot>
    </div>
    <div class="read-more__btn">
      <button v-show="isActivatedReadMore && !isShowAllText" @click="toggleAllText">계속읽기</button>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, ref, computed } from '@vue/composition-api'

export default defineComponent({
  props: {
    visibleLine: {
      type: Number,
      default: 3,
    },
    fontSize: {
      type: Number,
      default: 14,
    },
    lineHeight: {
      type: Number,
      default: 1.15, // normalize.cssに合わせてdefaultを1.15にする
    },
  },
  setup(props) {
    const readMoreRef = ref()
    const visibleHeight = computed(() => {
      return props.visibleLine * props.fontSize * props.lineHeight
    })
    const isActivatedReadMore = computed(() => {
      if (readMoreRef.value) {
        return readMoreRef.value.scrollHeight > visibleHeight.value
      }
      return false
    })
    const isShowAllText = ref(false)
    const toggleAllText = () => {
      isShowAllText.value = !isShowAllText.value
    }
    const styles = computed(() => {
      if (!isShowAllText.value) {
        return {
          overflow: 'hidden',
          height: visibleHeight.value + 'px',
          transition: 'all 0.25s ease-in-out',
          display: '-webkit-box',
          textOverflow: 'ellipsis',
          '-webkit-line-clamp': props.visibleLine,
          '-webkit-box-orient': 'vertical',
        }
      } else {
        return {
          height: readMoreRef.value.scrollHeight + 'px',
          transition: 'all 0.25s ease-in-out',
        }
      }
    })
    return {
      readMoreRef,
      isActivatedReadMore,
      isShowAllText,
      toggleAllText,
      styles,
    }
  },
})
</script>

<style scoped lang="scss">
.read-more {
  position: relative;
  color: #545b61;
  &__btn {
    text-align: right;
    margin-top: 8px;
    button {
      padding: 5.5px;
      font-size: 1.2rem;
      font-weight: 600;
      color: #646c73;
      text-decoration: underline;
      cursor: pointer;
      backdrop-filter: blur(30px);
    }
  }
}
</style>
