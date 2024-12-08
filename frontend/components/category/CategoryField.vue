<template>
  <div>
    <div class="category__field__warp">
      <div class="category__field__items">
        <span
          class="category__field__item"
          :class="categoryFieldItem.id === activeId ? 'active' : ''"
          @click="moveToCategory(categoryFieldItem.id)"
          >{{ categoryBtnName }} 전체</span
        >
        <ul v-for="item in categoryFieldItem" :key="item.id" class="category__field__items">
          <li
            :class="item.id === activeId ? 'active' : ''"
            class="category__field__item"
            @click="moveToCategory(item.id)"
          >
            {{ item.name }}
          </li>
        </ul>
      </div>
      <button class="category__field__nextBtn">
        <svg viewBox="0 0 30 48" class="category__field__nextBtn__svg">
          <path d="M.9 4.4L5.2 0l23.9 23.9L5.1 48 .8 43.7l20-20z"></path>
        </svg>
      </button>
    </div>
  </div>
</template>

<script>
import { computed, ref, useRouter, useStore } from '@nuxtjs/composition-api'
export default {
  components: {},
  props: {
    categoryFieldItem: {
      type: Array,
      required: true,
    },
    categoryBtnName: {
      type: String,
      required: true,
    },
    categoryBtnId: {
      type: Number,
      required: true,
    },
    categoryChildrenId: {
      type: Number,
      required: true,
    },
  },
  setup(props, context) {
    const router = useRouter()
    const store = useStore()
    const isActive = ref(false)
    const selectedDate = ref('')
    const activeId = computed(() => store.getters['categories/selectCategoryChildrenId'])

    const moveToCategory = (id) => {
      activeId.value = id
      if (id === undefined) {
        router.push(`/categories/${props.categoryBtnId}`)
        sessionStorage.setItem('id', props.categoryBtnId)
        context.emit('categoryChildrenId', props.categoryBtnId)
      } else {
        router.push(`/categories/${id}`)
        sessionStorage.setItem('id', id)
        context.emit('categoryChildrenId', id)
      }
    }

    return {
      isActive,
      activeId,
      selectedDate,
      moveToCategory,
    }
  },
}
</script>

<style lang="scss" scoped>
.category__field {
  // ul style
  &__items::after {
    content: '';
    display: block;
    width: 100%;
    height: 1px;
    background: rgb(209, 213, 217);
    left: 0px;
    bottom: 0px;
  }
  &__warp {
    display: block;
    margin: 12px 0px 0px 4px;
    padding: 0px;
    overflow: auto;
    position: relative;
  }
  &__items {
    display: inline-block;
    margin: 0px;
    padding: 0px;
    list-style: none;
    white-space: nowrap;
    cursor: pointer;
  }
  // li style
  &__item {
    display: inline-block;
    padding: 15px 8px;
    font-size: 20px;
    line-height: 15px;
    position: relative;
    color: rgb(128, 137, 145);
    &.active {
      color: #000000; // 활성화 상태에서 글자색 변경
      font-weight: 700;
      &::after {
        content: '';
        display: block;
        width: 100%;
        height: 3px;
        background: rgb(158, 167, 173);
        position: absolute;
        left: 0px;
        bottom: 0px;
        z-index: 10px;
      }
    }
  }
  &__nextBtn {
    margin: 0px;
    padding: 0px;
    border: 0px;
    appearance: none;
    line-height: 0;
    box-shadow: none;
    cursor: pointer;
    width: 44px;
    height: 44px;
    background: linear-gradient(90deg, rgba(255, 255, 255, 0) 0%, rgba(255, 255, 255, 0.5) 35%, white 70%);
    position: absolute;
    top: 0px;
    z-index: 20;
    transition: opacity 0.3s ease 0s;
    right: 0px;
    opacity: 100;
    pointer-events: auto;

    &__svg {
      width: 10px;
      height: 12px;
      fill: rgb(158, 167, 173);
      position: absolute;
      right: 0px;
      top: 50%;
      transform: translate3d(0px, -50%, 0px);
      transition: fill 0.2s ease 0s;
    }
  }
}
</style>
