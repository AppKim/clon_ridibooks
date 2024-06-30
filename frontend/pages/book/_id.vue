<template>
  <div class="book">
    <div class="book__header" :style="bgColor">
      <div class="book__header__background" :style="innerBackgroundImages" />
      <div class="book__header__mask" :style="bgColor">
        <BookSummary />
      </div>
    </div>
    <div class="book__main">
      <BookMeta v-if="!$device.isDesktopOrTablet" class="book__book-meta" />
      <div class="book__section">
        <h3 class="book__section__title">책소개</h3>
        <ReadMore :visible-line="6" :font-size="16" :line-height="1.5">
          우리가 사랑하는 많은 디저트들은 놀랍고 흥미로운 이야기들을 풍성하게 담고 있다. 다채로운 디저트들의 기원과 진화
          과정을 상세하게 살펴보며, 오븐이나 냉장고 같은 조리도구부터 시대별로 유행을 선도한 디저트 코스에 이르기까지
          디저트를 둘러싼 모든 것들을 담은 책이다.<br /><br />
          디저트가 별개의 코스로 분리되기 전인 달콤한 음식과 짭짤한 요리가 한 상에 같이 올랐던 시절을 시작으로, 격의
          없는 디저트들이 다시 부흥을 맞고 있는 동시에 분자요리사가 연금술사 뺨치는 솜씨로 디저트를 창조하는 현시점에서
          이야기를 마무리 짓는다. 식탁을 화려하게 수놓은 디저트의 흥미진진한 역사를 따라가다 보면, 디저트를 지적으로
          즐길 만한 이야깃거리들을 여럿 발견할 수 있을 것이다.
        </ReadMore>
      </div>
      <div class="book__section">
        <h3 class="book__section__title">책소개</h3>
        <ReadMore :visible-line="6" :font-size="16" :line-height="1.5">
          우리가 사랑하는 많은 디저트들은 놀랍고 흥미로운 이야기들을 풍성하게 담고 있다. 다채로운 디저트들의 기원과 진화
          과정을 상세하게 살펴보며, 오븐이나 냉장고 같은 조리도구부터 시대별로 유행을 선도한 디저트 코스에 이르기까지
          디저트를 둘러싼 모든 것들을 담은 책이다.<br /><br />
          디저트가 별개의 코스로 분리되기 전인 달콤한 음식과 짭짤한 요리가 한 상에 같이 올랐던 시절을 시작으로, 격의
          없는 디저트들이 다시 부흥을 맞고 있는 동시에 분자요리사가 연금술사 뺨치는 솜씨로 디저트를 창조하는 현시점에서
          이야기를 마무리 짓는다. 식탁을 화려하게 수놓은 디저트의 흥미진진한 역사를 따라가다 보면, 디저트를 지적으로
          즐길 만한 이야깃거리들을 여럿 발견할 수 있을 것이다.
        </ReadMore>
      </div>
      <div class="book__section">
        <h3 class="book__section__title">책소개</h3>
        <ReadMore :visible-line="6" :font-size="16" :line-height="1.5">
          우리가 사랑하는 많은 디저트들은 놀랍고 흥미로운 이야기들을 풍성하게 담고 있다. 다채로운 디저트들의 기원과 진화
          과정을 상세하게 살펴보며, 오븐이나 냉장고 같은 조리도구부터 시대별로 유행을 선도한 디저트 코스에 이르기까지
          디저트를 둘러싼 모든 것들을 담은 책이다.<br /><br />
          디저트가 별개의 코스로 분리되기 전인 달콤한 음식과 짭짤한 요리가 한 상에 같이 올랐던 시절을 시작으로, 격의
          없는 디저트들이 다시 부흥을 맞고 있는 동시에 분자요리사가 연금술사 뺨치는 솜씨로 디저트를 창조하는 현시점에서
          이야기를 마무리 짓는다. 식탁을 화려하게 수놓은 디저트의 흥미진진한 역사를 따라가다 보면, 디저트를 지적으로
          즐길 만한 이야깃거리들을 여럿 발견할 수 있을 것이다.
        </ReadMore>
      </div>
      <div class="book__section">
        <BookReviews />
      </div>
    </div>
  </div>
</template>
<script>
import {
  computed,
  defineComponent,
  onBeforeMount,
  onBeforeUnmount,
  onMounted,
  useRoute,
  useStore,
} from '@nuxtjs/composition-api'
import BookMeta from '../../components/book-details/BookMeta.vue'
import BookReviews from '../../components/book-details/BookReviews.vue'
import BookSummary from '../../components/book-details/BookSummary.vue'
import ReadMore from '../../components/book-details/ReadMore.vue'
import { useVibrant } from '../../composables/useVibrant'

export default defineComponent({
  components: { BookSummary, ReadMore, BookMeta, BookReviews },
  setup() {
    const route = useRoute()
    const store = useStore()
    console.log(route.value.params.id)
    const bgColor = computed(() => {
      // FIXME: '1046000135' -> route.value.params.id
      if (store.getters['commonUI/getBookImgThemeColorList']['1046000135']) {
        return { backgroundColor: store.getters['commonUI/getBookImgThemeColorList']['1046000135'] }
      }
      return {}
    })
    const innerBackgroundImages = computed(() => ({
      backgroundImage: `url(${require('@/assets/images/1046000135.webp')})`,
    }))
    const { getPaletteData } = useVibrant()
    onBeforeMount(() => {
      store.commit('commonUI/SET_IS_USED_THEME_COLOR', true)
      store.commit('commonUI/SET_IS_SHOW_MENU', false)
    })
    onMounted(async () => {
      if (Object.keys(bgColor.value).length === 0) {
        const sampleImgPath = require('@/assets/images/1046000135.webp')
        const result = await getPaletteData(sampleImgPath)
        store.commit('commonUI/SET_THEME_COLOR', {
          bookId: '1046000135', // route.value.params.id,
          bgColor: `rgb(${result.Vibrant._rgb.join(',')})`,
        })
      }
    })
    onBeforeUnmount(() => {
      store.commit('commonUI/SET_IS_USED_THEME_COLOR', false)
      store.commit('commonUI/SET_IS_SHOW_MENU', true)
    })
    return {
      bgColor,
      innerBackgroundImages,
    }
  },
})
</script>

<style lang="scss" scoped>
.book {
  &__header {
    position: relative;
    &__background {
      display: block;
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-position: top;
      background-repeat: no-repeat;
      background-size: cover;
      z-index: 5;
      background-size: 900px;
    }
    &__mask {
      position: relative;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      transition: background 0.3s;
      background-size: 900px;
      z-index: 10;
      opacity: 0.95;
    }
  }
  &__main {
    margin-bottom: 32px;
    width: 800px;
    margin: auto;
  }
  &__section {
    padding: 24px 0;
    &:not(:last-child) {
      border-bottom: 1px solid rgba(153, 139, 130, 0.4470588235);
    }
    line-height: 1.5;
    &__title {
      font-size: 1.8rem;
      margin-bottom: 16px;
    }
  }
  @include sp_view {
    &__header {
      position: relative;
      &__background {
        background-size: 100%;
      }
      &__mask {
        background-size: 100%;
      }
    }
    &__main {
      width: 100%;
    }
    &__book-meta {
      border-bottom: 6px solid rgb(242, 244, 245);
    }
    &__section {
      padding: 16px;
      border-bottom: 6px solid rgb(242, 244, 245);
      &__title {
        font-size: 1.8rem;
        margin-bottom: 16px;
      }
    }
  }
}
</style>
