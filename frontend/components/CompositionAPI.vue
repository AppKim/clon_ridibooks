<template>
  <div>
    {{ name }}
    <button type="button" @click="changeName">btn</button>
  </div>
</template>

<script>
import { defineComponent, ref, onMounted, computed, watch } from '@vue/composition-api'

export default defineComponent({
  setup() {
    // data
    const name = ref('Composition API ')

    // computed
    const fullName = computed(() => {
      return 'FullName ' + name.value
    })

    // methods
    const doIt = () => console.log(`Hello ${name.value}`)
    const changeName = () => {
      name.value = name.value + name.value
    }

    // watch
    watch(name, (cur, prev) => {
      console.log('this is watch', cur, prev)
    })

    // mounted
    onMounted(() => {
      doIt()
    })

    return { name, fullName, changeName }
  },
})
</script>
