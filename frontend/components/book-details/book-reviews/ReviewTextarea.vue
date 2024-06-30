<template>
  <textarea
    class="review-textarea"
    :value="value"
    :placeholder="placeholder"
    :maxlength="maxlength"
    :rows="rows"
    @input="onInput"
  >
  </textarea>
</template>
<script>
import { defineComponent } from '@nuxtjs/composition-api'

export default defineComponent({
  props: {
    placeholder: {
      type: String,
      default: '',
    },
    value: {
      type: String,
      default: '',
    },
    maxlength: {
      type: String,
      default: '',
    },
    resize: {
      type: Boolean,
      default: true,
    },
    rows: {
      type: Number,
      default: 2,
    },
  },
  setup(_, { emit }) {
    const onInput = (e) => {
      emit('input', e.target.value)
    }

    return {
      onInput,
    }
  },
})
</script>

<style lang="scss" scoped>
.review-textarea {
  appearance: none;
  box-sizing: border-box;
  width: 100%;
  min-height: 7em;
  padding: 8px 12px;
  overflow: hidden;
  border: 2px solid #d1d5d9;
  border-radius: 5px;
  outline: 0;
  background: #fff;
  color: #a7b1bb;
  font-size: 14px;
  font-weight: 400;
  line-height: 1.5em;
  box-shadow: none;
  resize: none;
  vertical-align: middle;
  word-wrap: break-word;

  &:focus {
    border: 2px solid #506a83;
    color: $light-black;
  }
}
</style>
