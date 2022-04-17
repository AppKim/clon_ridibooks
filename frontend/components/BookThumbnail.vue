<template>
  <div class="book-thumbnail">
    <img
      :class="size"
      :src="src"
      :alt="alt"
      :loading="loading"
      :decoding="decoding"
    />
    <span v-show="onShadow" class="shadow"></span>
  </div>
</template>
<script>
import { defineComponent } from '@vue/composition-api'

export default defineComponent({
  props: {
    src: {
      type: String,
      required: true,
    },
    size: {
      type: String,
      default: 'medium',
    },
    alt: {
      type: String,
      default: '',
    },
    loading: {
      type: String,
      default: 'lazy',
    },
    decoding: {
      type: String,
      default: 'async',
    },
    onShadow: {
      type: Boolean,
      default: true,
    },
  },
  setup() {},
})
</script>

<style lang="scss" scoped>
.book-thumbnail {
  position: relative;
  display: inline-block;
  img {
    display: block;
    height: auto;
    &.xLarge {
      width: 200px;
      @include sp_view {
        width: 150px;
      }
    }
    &.large {
      width: 140px;
    }
    &.medium {
      width: 120px;
      @include sp_view {
        width: 110px;
      }
    }
    &.small {
      width: 50px;
    }
  }
  & .shadow {
    box-sizing: border-box;
    display: block;
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    border: 1px solid rgba(0, 0, 0, 0.1);
    background: linear-gradient(
      90deg,
      rgba(0, 0, 0, 0.2) 0,
      transparent 5%,
      transparent 95%,
      rgba(0, 0, 0, 0.2)
    );
  }
}
</style>
