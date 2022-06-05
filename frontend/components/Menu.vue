<template>
  <div class="menu">
    <div class="menu__wrapper">
      <nuxt-link class="menu__link active" to="/">홈</nuxt-link>
      <nuxt-link class="menu__link" to="/new-releases">최신 업데이트</nuxt-link>
      <nuxt-link class="menu__link" to="/category">카테고리</nuxt-link>
      <nuxt-link class="menu__link" to="/my-select">마이 셀렉트</nuxt-link>
    </div>
  </div>
</template>

<script>
import { defineComponent } from '@vue/composition-api'

export default defineComponent({
  setup() {},
})
</script>

<style lang="scss" scoped>
.menu {
  border-bottom: 1px solid #d1d5d9;
  &__wrapper {
    display: flex;
    width: 880px;
    height: 47px;
    margin: auto;
    align-items: center;
  }
  &__link {
    display: flex;
    align-items: center;
    height: 100%;
    padding: 0 8px;
    text-decoration: none;
    color: #212b3b;
    font-size: 1.5rem;
    font-weight: 400;
    &.active {
      font-weight: 600;
      color: black;
    }
  }
}
</style>
