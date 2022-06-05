<template>
  <div>{{ title }}</div>
</template>

<script>
export default {
  props: {
    title: {
      type: String,
      defalut: '',
      required: true,
    },
  },
}
</script>

<style></style>
