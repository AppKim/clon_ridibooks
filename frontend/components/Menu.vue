<template>
  <div class="menu">
    <div class="menu__wrapper">
      <nuxt-link class="menu__link" :class="{ active: $route.path === '/' }" to="/">홈</nuxt-link>
      <nuxt-link class="menu__link" :class="{ active: $route.path === '/new-releases' }" to="/new-releases"
        >최신 업데이트</nuxt-link
      >
      <nuxt-link
        class="menu__link"
        :class="{ active: $route.path === '/categories/100' }"
        to="/categories/100"
        @click="getCategoryItem"
        >카테고리</nuxt-link
      >
      <nuxt-link class="menu__link" :class="{ active: $route.path === '/my-select' }" to="/my-select"
        >마이 셀렉트</nuxt-link
      >
    </div>
  </div>
</template>

<script>
import { defineComponent } from '@vue/composition-api'

export default defineComponent({
  setup() {
    const getCategoryItem = () => {
      sessionStorage.getItem('id')
    }
    return {
      getCategoryItem,
    }
  },
})
</script>

<style lang="scss" scoped>
.menu {
  border-bottom: 1px solid #d1d5d9;
  &__wrapper {
    display: flex;
    max-width: 800px;
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
    color: #3d4a5e;
    font-size: 1.5rem;
    font-weight: 400;
    &.active {
      color: black;
      font-weight: 800;
    }
  }
  @include sp_view {
    &__wrapper {
      justify-content: space-around;
    }
    &__link {
      flex: 1;
      justify-content: center;
      padding: 0;
    }
  }
}
</style>
