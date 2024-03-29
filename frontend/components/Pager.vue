<template>
  <nav class="paginations">
    <ul class="nav-links">
      <li class="previous-button" @click="$emit('previousPage')" />
      <li
        v-for="pageNum in showPageNumArr"
        :key="pageNum"
        :class="{ active: pageNum === currentPage }"
        class="link-list"
        @click="onClick(pageNum)"
      >
        <span>{{ pageNum }}</span>
      </li>
      <li class="next-button" @click="$emit('nextPage')" />
    </ul>
  </nav>
</template>

<script>
import { defineComponent, computed } from '@nuxtjs/composition-api'

export default defineComponent({
  props: {
    currentPage: {
      type: Number,
      default: 1,
    },
    totalPage: {
      type: Number,
      required: true,
    },
    showPageCount: {
      type: Number,
      default: 10,
    },
  },
  setup(props, { emit }) {
    const showPageNumArr = computed(() => {
      // 현재 페이지가 1~10일때 offset은 1 / 11~20 일때 offset은 2
      const offset = Math.ceil(props.currentPage / props.showPageCount)
      // offset과 showPageCount가 있으면 표시할 페이지의 번호들을 알아낼 수 있다
      // offset이 2이면 11~20 까지 표시
      const startPageNum = (offset - 1) * props.showPageCount + 1
      let lastPageNum = offset * props.showPageCount
      if (lastPageNum > props.totalPage) {
        lastPageNum = props.totalPage
      }
      return new Array(lastPageNum - startPageNum + 1).fill().map((_, i) => i + startPageNum)
    })

    const onClick = (pageNum) => {
      emit('onChangePage', pageNum)
    }

    return {
      showPageNumArr,
      onClick,
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
