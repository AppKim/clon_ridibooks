<template>
  <div class="category-select-wrap">
    <select @change="selected">
      <option value="popular">인기순</option>
      <option value="recent">최신순</option>
    </select>
  </div>
</template>

<script>
import {} from '@nuxtjs/composition-api'
export default {
  setup(props, context) {
    // 인기순, 최신순 선택
    const selected = (e) => {
      context.emit('changeBtnItem', e.target.value)
    }
    return {
      selected,
    }
  },
}
</script>

<style lang="scss" scoped>
.category-select-wrap {
  width: 100px;
  height: 30px;
  margin: 15px 0px 0px 12px;
  select {
    -webkit-appearance: none;
    -moz-appearance: none;
    width: 68px;
    height: 17px;
    position: relative;
    box-sizing: content-box;
    line-height: 18px;
    font-size: 12px;
    font-weight: 700;
    background-image: url("data:image/svg+xml;utf8,<svg fill='grey' height='24' viewBox='0 0 24 24' width='24' xmlns='http://www.w3.org/2000/svg'><path d='M7 10l5 5 5-5z'/><path d='M0 0h24v24H0z' fill='none'/></svg>");
    background-repeat: no-repeat;
    background-position-x: 100%;
    background-color: #ffffff;
    color: #525a61;
    border: 1px solid #d1d5d9;
    border-radius: 3px;
    padding: 5px 23px 5px 7px;
  }
}
</style>
