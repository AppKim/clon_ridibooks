<template>
  <label>
    <input :id="id" type="checkbox" :checked="checked" @change="selected" />
  </label>
</template>

<script>
import { defineComponent } from '@nuxtjs/composition-api'

export default defineComponent({
  props: {
    checked: {
      type: Boolean,
      default: false,
    },
    id: {
      type: Number,
      default: 0,
    },
  },
  setup(_, { emit }) {
    const selected = (e) => {
      emit('change', e.target.id, e.target.checked)
    }
    return {
      selected,
    }
  },
})
</script>

<style lang="scss" scoped></style>
