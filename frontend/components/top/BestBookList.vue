<template>
  <div class="best-book-list">
    <div class="best-book-list__wrap">
      <h2 class="best-book-list__title">
        한 주간 별점 베스트
        <img class="best-book-list__icon" src="@/assets/images/best.svg" />
      </h2>
      <swiper class="swiper" :options="swiperOption" v-if="$window.width > 860">
        <swiper-slide v-for="index in 3" :key="index">
          <BookThumbnailLinkList
            class="best-book-list__book-list"
            :book-list="books.slice((index - 1) * 5, (index - 1) * 5 + 5)"
            size="large"
          />
        </swiper-slide>
        <div slot="button-prev" class="swiper-button-prev"></div>
        <div slot="button-next" class="swiper-button-next"></div>
      </swiper>
      <BookThumbnailLinkList v-else class="best-book-list__book-list" :book-list="books" size="large" />
    </div>
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
  setup(props) {
    const swiperOption = {
      slidesPerView: 1,
      spaceBetween: 0,
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
.best-book-list {
  background: url('@/assets/images/top_bestbook_background.png') center center / auto 100% no-repeat;
  height: 420px;
  width: 100%;
  @include sp_view {
    width: 100%;
    padding: 0 16px;
    box-sizing: border-box;
  }
  &__title {
    font-weight: 400;
    padding: 45px 0px 0px 10px;
    font-size: 24px;
    line-height: 21px;
    letter-spacing: -0.3px;
    color: black;
    display: flex;
    align-items: center;
    width: 825px;
    margin: auto;
    @include sp_view {
      width: 100%;
      padding: 32px 0px 0px 0px;
    }
  }
  &__icon {
    margin-left: 8px;
    width: 40px;
  }
  &__book-list {
    width: 825px;
    margin: 48px 48px 0px 48px;
    @include sp_view {
      width: 100%;
      margin: 48px 0px 0px 0px;
    }
  }
  .swiper {
    width: 860px;
    margin: auto;
    position: relative;
    .swiper-button-prev {
      position: absolute;
      cursor: pointer;
      width: 40px;
      height: 40px;
      left: 0;
      border-radius: 40px;
      border: 1px solid rgba(0, 0, 0, 0.07);
      background-color: white;
      transition: background-color 0.2s ease 0s;
      box-shadow: rgb(0 0 0 / 15%) 0px 1px 3px 0px, rgb(0 0 0 / 10%) 0px 1px 5px 0px;
      &::after {
        position: relative;
        left: 2px;
        border-right: 2px solid #444;
        border-top: 2px solid #444;
        content: '';
        height: 8px;
        transform: rotate(225deg);
        width: 8px;
      }
      @include sp_view {
        display: none;
      }
    }
    @include sp_view {
      width: 100%;
    }
    .swiper-button-next {
      cursor: pointer;
      width: 40px;
      height: 40px;
      right: 0;
      border-radius: 40px;
      border: 1px solid rgba(0, 0, 0, 0.07);
      background-color: white;
      transition: background-color 0.2s ease 0s;
      box-shadow: rgb(0 0 0 / 15%) 0px 1px 3px 0px, rgb(0 0 0 / 10%) 0px 1px 5px 0px;
      &::after {
        position: relative;
        right: 2px;
        border-right: 2px solid #444;
        border-top: 2px solid #444;
        content: '';
        height: 8px;
        transform: rotate(45deg);
        width: 8px;
      }
      @include sp_view {
        display: none;
      }
    }
  }
}
</style>
