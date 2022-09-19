<template>
  <nav class="paginations">
    <ul class="nav-links">
      <li class="previous-button" @click="previousPage" />
      <li
        :class="{ active: pageNum === currentPage }"
        v-for="pageNum in showPageNumArr"
        :key="pageNum"
        class="link-list"
        @click="onChangePageNum(pageNum)"
      >
        <span>{{ pageNum }}</span>
      </li>
      <li class="next-button" @click="nextPage" />
    </ul>
  </nav>
</template>

<script>
import { defineComponent, computed, ref } from '@nuxtjs/composition-api'

export default defineComponent({
  props: {
    currentPage: {
      type: Number,
      default: 1,
    },
    totalPage: {
      type: Number,
      default: 1,
    },
    showPageCount: {
      type: Number,
      default: 10,
    },
  },
  setup(props, { emit }) {
    const offset = computed(() => Math.ceil(props.currentPage / props.showPageCount))

    const showPageNumArr = computed(() => {
      const startPageNum = (offset.value - 1) * props.showPageCount + 1
      let lastPageNum = offset.value * props.showPageCount
      if (lastPageNum > props.totalPage) {
        lastPageNum = props.totalPage
      }
      return new Array(lastPageNum - startPageNum + 1).fill().map((_, i) => i + startPageNum)
    })

    const onChangePageNum = (pageNum) => {
      emit('changePage', pageNum)
    }

    const previousPage = () => {
      emit('changePage', (offset.value - 2) * props.showPageCount + 1)
    }
    const nextPage = () => {
      emit('changePage', offset.value * props.showPageCount + 1)
    }

    return {
      showPageNumArr,
      onChangePageNum,
      previousPage,
      nextPage,
    }
  },
})
</script>

<style lang="scss" scoped>
.nav-links {
  display: flex;
  list-style: none;
  justify-content: center;
  li {
    width: 40px;
    height: 40px;
    display: flex;
    align-items: center;
    justify-content: center;
    border: 1px solid rgb(209, 213, 217);
    border-radius: 5px;
    margin: 5px;
    cursor: pointer;
    span {
      color: rgb(128, 137, 145);
    }
    &.active {
      border-color: rgb(0, 119, 217);
      background: rgb(31, 140, 230);
      span {
        color: white;
      }
    }
  }
  .previous-button {
    margin: auto 0;
    &:before {
      content: '<';
    }
  }
  .next-button {
    margin: auto 0;
    &:before {
      content: '>';
    }
  }
}
</style>
