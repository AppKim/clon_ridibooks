<template>
  <div class="container">
    <Header />
    <Menu v-show="isShowMenu" />
    <div class="main">
      <Nuxt />
    </div>
    <Footer />
  </div>
</template>

<script>
import { useStore, computed, defineComponent } from '@nuxtjs/composition-api'
import Menu from '@/components/Menu.vue'
import Footer from '@/components/Footer.vue'
import Header from '@/components/Header.vue'

export default defineComponent({
  components: { Header, Footer, Menu },
  setup() {
    const store = useStore()
    const isShowMenu = computed(() => store.getters['commonUI/getIsShowMenu'])

    return {
      isShowMenu,
    }
  },
})
</script>

<style lang="scss" scoped>
.container {
  width: 100%;
  height: 100%;
  .main {
    min-height: calc(100vh - 276px);
  }
}
</style>
