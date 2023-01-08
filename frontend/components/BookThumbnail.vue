<template>
  <div class="book-thumbnail" :class="[size, alignItems]">
    <div class="book-thumbnail__contents-wrapper">
      <img :src="src" :alt="alt" :loading="loading" :decoding="decoding" />
      <span v-show="onShadow" class="shadow"></span>
    </div>
  </div>
</template>
<script>
import { defineComponent } from '@vue/composition-api'

export default defineComponent({
  props: {
    size: {
      type: String,
      default: 'medium',
    },
    src: {
      type: String,
      required: true,
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
    alignItems: {
      type: String,
      default: 'flex-end',
    },
  },
  setup() {},
})
</script>

<style lang="scss" scoped>
.book-thumbnail {
  display: flex;
  align-items: flex-end;
  &.xLarge {
    width: 200px;
    height: 290px;
    max-height: 290px;
    @include sp_view {
      width: 150px;
      height: 218px;
      max-height: 218px;
    }
  }
  &.large {
    width: 140px;
    height: 216px;
    max-height: 216px;
  }
  &.medium {
    width: 120px;
    height: 184px;
    max-height: 184px;
    @include sp_view {
      width: 110px;
      height: 167px;
      max-height: 167px;
    }
  }
  &.small {
    width: 50px;
    height: 70px;
    max-height: 70px;
  }
  &.flexStart {
    align-items: flex-start;
  }
  &.center {
    align-items: center;
  }
  &.flexEnd {
    align-items: flex-end;
  }
  &__contents-wrapper {
    position: relative;
    display: inline-block;
    width: inherit;
  }
  img {
    display: block;
    width: inherit;
    // height는 되도록 설정안한다.책 이미지는 그대로 전부 보여지게 하는걸 우선시
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
    background: linear-gradient(90deg, rgba(0, 0, 0, 0.2) 0, transparent 5%, transparent 95%, rgba(0, 0, 0, 0.2));
  }
}
</style>
