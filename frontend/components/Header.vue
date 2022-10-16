<template>
  <div class="header" :style="bgColor">
    <div class="header__wrapper">
      <nuxt-link class="header__logo" to="/">
        <img class="header__logo--ridi" src="@/assets/images/logo_ridi.svg" />
        <img class="header__logo--select" src="@/assets/images/logo_select.svg" />
      </nuxt-link>
      <div class="header__buttons">
        <fa-icon class="header__buttons__search" :class="{ white: isUsedThemeColor }" icon="magnifying-glass" />
        <fa-icon class="header__buttons__user" :class="{ white: isUsedThemeColor }" icon="user" />
        <button class="header__buttons__mybooks" :class="{ white: isUsedThemeColor }">내 서재</button>
      </div>
    </div>
  </div>
</template>

<script>
import { computed, defineComponent, useStore, useRoute } from '@nuxtjs/composition-api'

export default defineComponent({
  setup() {
    const store = useStore()
    const route = useRoute()
    const isUsedThemeColor = computed(() => store.getters['commonUI/getIsUsedThemeColor'])
    const bgColor = computed(() => {
      if (isUsedThemeColor.value && store.getters['commonUI/getBookImgThemeColorList'][route.value.params.id]) {
        return { backgroundColor: store.getters['commonUI/getBookImgThemeColorList'][route.value.params.id] }
      }
      return {}
    })
    return {
      isUsedThemeColor,
      bgColor,
    }
  },
})
</script>

<style lang="scss" scoped>
.header {
  border-bottom: 1px solid #d1d5d9;
  &__wrapper {
    display: flex;
    max-width: 800px;
    height: 58px;
    margin: auto;
    align-items: center;
    justify-content: space-between;
  }
  &__logo {
    display: flex;
    @include hover_opacity;

    &--ridi {
      width: 43px;
      height: 16px;
      margin-right: 8px;
    }
    &--select {
      width: 85px;
      height: 16px;
    }
  }
  &__buttons {
    display: flex;
    align-items: center;
    :not(:last-child) {
      margin-right: 24px;
    }
    &__search {
      font-size: 2rem;
      color: #444;
      cursor: pointer;
      @include hover_opacity;
      &.white {
        color: white;
      }
    }
    &__user {
      font-size: 1.8rem;
      color: #444;
      cursor: pointer;
      @include hover_opacity;
      &.white {
        color: white;
      }
    }
    &__mybooks {
      padding: 6px 12px;
      border: 1px solid #d1d5d9;
      border-radius: 3px;
      background-color: transparent;
      color: #808991;
      font-size: 1.3rem;
      font-weight: 700;
      letter-spacing: -0.5px;
      cursor: pointer;
      margin-right: 8px;
      &.white {
        color: white;
      }
    }
  }
  @include sp_view {
    &__wrapper {
      height: 44px;
    }
    &__logo {
      padding: 16px 0 16px 16px;
      &--ridi {
        width: 35px;
        height: 13px;
        margin-right: 8px;
      }
      &--select {
        width: 70px;
        height: 13px;
      }
    }
  }
}
</style>
