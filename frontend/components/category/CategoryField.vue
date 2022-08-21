<template>
  <div>
    <div class="category__field__warp">
      <div>
        <ul v-for="item in categoryFieldItem.children" :key="item.id" class="category__field__items">
          <li
            :class="item.id === activeId ? 'active' : ''"
            class="category__field__item"
            @click="moveToCategory(item.id)"
          >
            {{ item.name }}
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
import { ref, useRouter } from '@nuxtjs/composition-api'
export default {
  props: {
    categoryFieldItem: {
      type: Object,
      required: true,
    },
  },
  setup() {
    const router = useRouter()
    const isActive = ref(false)
    const activeId = ref(0)
    const moveToCategory = (id) => {
      activeId.value = id
      router.push(`/categories/${id}`)
    }
    return {
      isActive,
      activeId,
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
    margin: 0px;
    padding: 0px;
    overflow: auto;
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
    font-size: 15px;
    line-height: 15px;
    position: relative;
    color: rgb(128, 137, 145);
    &.active::after {
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
  /* .active::after {
    content: '';
    display: block;
    width: 100%;
    height: 3px;
    background: rgb(158, 167, 173);
    left: 0px;
    bottom: 3px;
    z-index: 10px;
  } */
}
</style>
