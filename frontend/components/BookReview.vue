<template>
  <div class="review">
    <div class="review__star">
      <span class="star5_rating" :data-rate="rate" />
      <span class="review__count">{{ score }}</span>
    </div>
  </div>
</template>

<script>
import { defineComponent } from '@vue/composition-api'

export default defineComponent({
  props: {
    rate: {
      type: Number,
      defalut: 0,
      required: true,
    },
    score: {
      type: Number,
      defalut: 0,
      required: true,
    },
  },
  setup() {},
})
</script>

<style lang="scss" scoped>
.star5_rating {
  position: relative;
  z-index: 0;
  display: inline-block;
  white-space: nowrap;
  color: #cccccc;
  width: 100%;
  font-size: 12px;
  &:before {
    content: '★★★★★';
  }
  &:after {
    content: '★★★★★';
    position: absolute;
    z-index: 1;
    top: 0;
    left: 0;
    overflow: hidden;
    white-space: nowrap;
    color: #ffcf32;
  }
  &[data-rate='5']:after {
    width: 100%;
  }
  &[data-rate='4.5']:after {
    widows: 90%;
  }
  &[data-rate='4']:after {
    width: 80%;
  }
  &[data-rate='3.5']:after {
    width: 70%;
  }
  &[data-rate='3']:after {
    width: 60%;
  }
  &[data-rate='2.5']:after {
    width: 50%;
  }
  &[data-rate='2']:after {
    width: 40%;
  }
  &[data-rate='1.5']:after {
    width: 30%;
  }
  &[data-rate='1']:after {
    width: 20%;
  }
  &[data-rate='0.5']:after {
    width: 10%;
  }
  &[data-rate='0']:after {
    width: 0%;
  }
}
.review__count {
  font-size: 12px;
}
</style>
