<template>
  <div class="bookthumnail__title">{{ title }}</div>
</template>

<script>
export default {
  components: {},
  props: {
    title: {
      type: String,
      defalut: '',
      required: true,
    },
  },
}
</script>

<style>
.bookthumnail__title {
  font-size: 13px;
}
</style>
