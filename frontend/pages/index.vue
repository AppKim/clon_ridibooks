<template>
  <div>Top Page</div>
</template>

<script>
import { defineComponent, onMounted, useContext } from '@nuxtjs/composition-api'

export default defineComponent({
  setup() {
    const { $repositories } = useContext()
    onMounted(async () => {
      const result = await $repositories('posts').get()
      console.log(result)
    })
  },
})
</script>
