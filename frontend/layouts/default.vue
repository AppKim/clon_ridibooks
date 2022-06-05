<template>
  <div class="container">
    <Header />
    <Menu />
    <div class="main">
      <Nuxt />
    </div>
    <Footer />
  </div>
</template>

<script>
import { defineComponent } from '@vue/composition-api'
import Menu from '@/components/Menu.vue'
import Footer from '@/components/Footer.vue'
import Header from '@/components/Header.vue'

export default defineComponent({
  components: { Header, Footer, Menu },
  setup() {},
})
</script>

<style lang="scss" scoped>
.container {
  width: 100%;
  height: 100%;
  .main {
    height: calc(100vh - 276px);
  }
}
</style>
