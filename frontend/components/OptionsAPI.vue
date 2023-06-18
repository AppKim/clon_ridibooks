<template>
  <div>
    {{ name }}
    <button type="button" @click="changeName">btn</button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      name: 'Options API ',
    }
  },
  computed: {
    fullName() {
      return 'FullName' + this.name
    },
  },
  watch: {
    name(cur, prev) {
      console.log('this is watch', cur, prev)
    },
  },
  mounted() {
    this.doIt()
  },
  methods: {
    doIt() {
      console.log(`Hello ${this.name}`)
    },
    changeName() {
      this.name = this.name + this.name
    },
  },
}
</script>

<style></style>
