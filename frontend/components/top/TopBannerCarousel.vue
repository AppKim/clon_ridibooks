<template>
  <div class="top-banner-carousel">
    <Swiper class="swiper" :options="topBannerSwiperOption">
      <SwiperSlide
        ><img
          width="432"
          height="432"
          src="https://select-img.ridicdn.net/images/4f46058a-2f47-44ea-a265-0629627b10aa?w=450"
      /></SwiperSlide>
      <SwiperSlide
        ><img
          width="432"
          height="432"
          src="https://select-img.ridicdn.net/images/52971b4d-ba46-48fb-95f1-917f0449f448?w=450"
      /></SwiperSlide>
      <SwiperSlide
        ><img
          width="432"
          height="432"
          src="https://select-img.ridicdn.net/images/a6bfec9f-a4dd-44bc-8a49-188ed238a35c?w=450"
      /></SwiperSlide>
      <div slot="button-prev" class="swiper-button-prev"></div>
      <div slot="button-next" class="swiper-button-next"></div>
      <div slot="pagination" class="swiper-pagination"></div>
    </Swiper>
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
    // https://v1.github.surmon.me/vue-awesome-swiper/
    const topBannerSwiperOption = {
      slidesPerView: 1,
      spaceBetween: 0,
      breakpoints: {
        432: {
          slidesPerView: 3,
        },
      },
      loop: true,
      pagination: {
        el: '.swiper-pagination',
        type: 'fraction',
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      autoplay: {
        delay: 5000,
      },
    }
    return {
      topBannerSwiperOption,
    }
  },
})
</script>

<style lang="scss" scoped>
.top-banner-carousel {
  width: 1296px;
  margin: 0 auto;
  .swiper {
    .swiper-button-prev {
      left: 380px;
      right: auto;
      cursor: pointer;
      width: 40px;
      height: 40px;
      border-radius: 40px;
      border: 1px solid rgba(0, 0, 0, 0.07);
      background-color: rgba(0, 0, 0, 0.2);
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
      background-color: rgba(0, 0, 0, 0.2);
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
    ::v-deep .swiper-pagination-fraction {
      display: inline-block;
      position: absolute;
      left: 62%;
      width: fit-content;
      padding: 3px 10px;
      border-radius: 16px;
      font-size: 1.2rem;
      background: rgba(0, 0, 0, 0.6);
      color: white;
      border: 1px solid #444;
      @include sp_view {
        left: 85%;
      }
    }
  }
  @include sp_view {
    width: 100%;
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
