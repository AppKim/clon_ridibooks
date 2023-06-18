<template>
  <div>
    <button type="button" class="category__btn">
      {{ categoryBtnName }}
      <svg viewBox="0 0 12 11">
        <path d="M10.728 2.428L6 7.156 1.272 2.428 0 3.7l6 6 6-6-1.272-1.272z" />
      </svg>
    </button>
  </div>
</template>

<script>
export default {
  components: {},
  props: {
    categoryBtnName: {
      type: String,
      required: true,
    },
  },
  setup(props) {
    return {}
  },
}
</script>

<style lang="scss" scoped>
.category__btn {
  font-size: 25px;
  font-weight: 700;
  background: none;
  box-shadow: none;
  border: 0px;
  cursor: pointer;
  color: rgb(48, 53, 56);
  line-height: 30px;
  position: relative;

  svg {
    width: 12px;
    height: 9px;
    fill: rgb(158, 167, 173);
    left: 100%;
    top: 30%;
    cursor: pointer;
    position: absolute;
  }
}
</style>
