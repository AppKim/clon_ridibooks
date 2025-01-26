<template>
  <div class="best-book-list">
    <div class="best-book-list__wrap">
      <h2 class="best-book-list__title">
        한 주간 별점 베스트
        <img class="best-book-list__icon" src="@/assets/images/best.svg" />
      </h2>
      <div v-if="$device.isDesktopOrTablet" class="best-book-list__swiper">
        <div slot="pagination" class="best-book-pagination"></div>
        <Swiper class="swiper" :options="swiperOption">
          <SwiperSlide v-for="(book, i) in books" :key="i" class="book-thumbnail-link-list__item">
            <BookThumbnailLink
              :src="book.thumnail"
              :alt="book.title"
              :title="book.title"
              :author="book.authors['author']"
              :loading="'lazy'"
              :to="`/book/${book.id}`"
            ></BookThumbnailLink>
          </SwiperSlide>
        </Swiper>
        <div slot="button-prev" class="swiper-button-prev"></div>
        <div slot="button-next" class="swiper-button-next"></div>
      </div>
      <BookThumbnailLink v-else class="best-book-list__book-list" :book-list="books" size="large" />
    </div>
  </div>
</template>

<script>
import { Swiper, SwiperSlide } from 'vue-awesome-swiper'
import { defineComponent } from '@nuxtjs/composition-api'
import 'swiper/css/swiper.css'
import BookThumbnailLink from '../BookThumbnailLink.vue'

export default defineComponent({
  components: {
    BookThumbnailLink,
    Swiper,
    SwiperSlide,
  },
  props: {
    books: {
      type: Array,
      required: true,
    },
  },
  setup() {
    const swiperOption = {
      spaceBetween: 20,
      slidesPerView: 5,
      slidesPerGroup: 5,
      loop: true,
      pagination: {
        el: '.best-book-pagination',
        clickable: true,
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
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
  background-color: rgba(242, 244, 245, 0.5);
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
    width: 800px;
    margin: auto;
    @include sp_view {
      width: 100%;
      padding: 32px 0px 0px 0px;
    }
  }
  &__swiper {
    position: relative;
    width: 810px;
    margin: auto;
    padding: 45px 10px 0px 10px;
    .swiper {
      width: 800px;
      position: relative;
      @include sp_view {
        width: 100%;
      }
    }
    .swiper-button-next {
      width: 40px;
      height: 40px;
      right: -30px;
      border-radius: 20px;
      background-color: white;
      box-shadow: rgba(0, 0, 0, 0.15) 0px 1px 3px 0px, rgba(0, 0, 0, 0.1) 0px 1px 5px 0px;
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
    }
    .swiper-button-prev {
      width: 40px;
      height: 40px;
      left: -50px;
      border-radius: 20px;
      background-color: white;
      box-shadow: rgba(0, 0, 0, 0.15) 0px 1px 3px 0px, rgba(0, 0, 0, 0.1) 0px 1px 5px 0px;
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
    }
    .best-book-pagination {
      position: absolute;
      margin: 0px;
      padding: 0px;
      white-space: nowrap;
      top: -22px;
      right: 11px;
      ::v-deep .swiper-pagination-bullet {
        width: 10px;
        height: 3px;
        margin: 0 2px;
        background: rgb(184, 191, 196);
        border-radius: 0%;
      }
    }
  }
  &__icon {
    margin-left: 8px;
    width: 40px;
  }
  &__book-list {
    width: 100%;
    margin: 24px 68px 0px 68px;
    @include sp_view {
      width: 100%;
      margin: 24px 0px 0px 0px;
    }
  }
}
</style>
