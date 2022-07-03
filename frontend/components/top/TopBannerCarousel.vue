<template>
  <div class="top-banner-carousel">
    <swiper class="swiper" :options="swiperOption">
      <swiper-slide><img src="https://placeimg.com/432/432/any1/1" /></swiper-slide>
      <swiper-slide><img src="https://placeimg.com/432/432/any2/2" /></swiper-slide>
      <swiper-slide><img src="https://placeimg.com/432/432/any3/3" /></swiper-slide>
      <div slot="button-prev" class="swiper-button-prev"></div>
      <div slot="button-next" class="swiper-button-next"></div>
    </swiper>
  </div>
</template>

<script>
import { Swiper, SwiperSlide } from 'vue-awesome-swiper'
import { defineComponent } from '@nuxtjs/composition-api'
import 'swiper/css/swiper.css'

export default defineComponent({
  components: {
    Swiper,
    SwiperSlide,
  },
  setup() {
    const swiperOption = {
      slidesPerView: 1,
      spaceBetween: 0,
      breakpoints: {
        432: {
          slidesPerView: 3,
        },
      },
      loop: true,
      // pagination: {
      //   el: '.swiper-pagination',
      //   clickable: true,
      // },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      // autoplay: {
      //   delay: 3000,
      // },
    }
    return {
      swiperOption,
    }
  },
})
</script>

<style lang="scss" scoped>
.top-banner-carousel {
  .swiper-button-prev {
    left: 380px;
    right: auto;
    cursor: pointer;
    width: 40px;
    height: 40px;
    border-radius: 40px;
    border: 1px solid rgba(0, 0, 0, 0.07);
    background-color: rgba(255, 255, 255, 0.15);
    transition: background-color 0.2s ease 0s;
    &::after {
      position: relative;
      left: 2px;
      border-right: 2px solid #fff;
      border-top: 2px solid #fff;
      content: '';
      height: 8px;
      transform: rotate(225deg);
      width: 8px;
    }
    @include sp_view {
      display: none;
    }
  }
  .swiper-button-next {
    left: auto;
    right: 380px;
    cursor: pointer;
    width: 40px;
    height: 40px;
    border-radius: 40px;
    border: 1px solid rgba(0, 0, 0, 0.07);
    background-color: rgba(255, 255, 255, 0.15);
    transition: background-color 0.2s ease 0s;
    &::after {
      position: relative;
      right: 2px;
      border-right: 2px solid rgba(255, 255, 255, 0.932);
      border-top: 2px solid rgba(255, 255, 255, 0.932);
      content: '';
      height: 8px;
      transform: rotate(45deg);
      width: 8px;
    }
    @include sp_view {
      display: none;
    }
  }
  @include sp_view {
    .swiper {
      width: 100%;
      .swiper-slide {
        img {
          width: 100%;
          object-fit: cover;
        }
      }
    }
  }
}
</style>
