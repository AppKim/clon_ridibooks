<template>
  <div class="best-book-list">
    <h2 class="best-book-list__title">
      한 주간 별점 베스트
      <span> best </span>
    </h2>
    <swiper class="swiper" :options="swiperOption">
      <swiper-slide><img src="https://placeimg.com/432/432/any1/1" /></swiper-slide>
      <swiper-slide><img src="https://placeimg.com/432/432/any2/2" /></swiper-slide>
      <swiper-slide><img src="https://placeimg.com/432/432/any3/3" /></swiper-slide>
      <div slot="button-prev" class="swiper-button-prev"></div>
      <div slot="button-next" class="swiper-button-next"></div>
    </swiper>
    <BookThumbnailLinkList />
  </div>
</template>

<script>
import { Swiper, SwiperSlide } from 'vue-awesome-swiper'
import { defineComponent } from '@nuxtjs/composition-api'
import 'swiper/css/swiper.css'
import BookThumbnailLinkList from './BookThumbnailLinkList.vue'

export default defineComponent({
  props: {
    books: {
      type: Array,
      required: true,
    },
  },
  components: {
    BookThumbnailLinkList,
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

<style></style>
