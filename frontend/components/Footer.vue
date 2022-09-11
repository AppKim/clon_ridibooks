<template>
  <footer class="footer">
    <ul class="footer__menu">
      <li class="footer__menu__item">
        <a href="#" target="_blank" rel="noopener noreferrer">뷰어 다운로드</a>
      </li>
      <li class="footer__menu__item">
        <a href="#" target="_blank" rel="noopener noreferrer">이용 방법</a>
      </li>
      <li class="footer__menu__item">
        <a href="#">이용권 등록</a>
      </li>
      <li class="footer__menu__item">
        <a href="#" target="_blank" rel="noopener noreferrer">FAQ</a>
      </li>
    </ul>
    <div class="footer__sns">
      <fa-icon class="fa-2x footer__sns__icon" :icon="['fab', 'instagram']" />
      <fa-icon class="fa-2x footer__sns__icon" :icon="['fab', 'twitter']" />
      <fa-icon class="fa-2x footer__sns__icon" :icon="['fab', 'facebook']" />
    </div>
    <p class="css-v2uwde">© RIDI Corp.</p>
  </footer>
</template>

<script>
export default {}
</script>

<style lang="scss" scoped>
.footer {
  margin-top: 24px;
  padding: 22px 0px 28px;
  text-align: center;
  background: rgba(247, 250, 252, 0.5);
  &__menu {
    font-size: 1.5rem;
    font-weight: 600;
    :not(:first-child) {
      ::before {
        display: inline-block;
        width: 3px;
        height: 3px;
        margin: 10px 10px 0px 0px;
        border-radius: 3px;
        background: rgb(184, 191, 196);
        content: '';
        vertical-align: top;
      }
    }
    &__item {
      display: inline-block;
      margin-right: 8px;
      a {
        text-decoration: none;
        color: rgb(64, 71, 77);
      }
    }
  }
  &__sns {
    margin: 16px 0;
    &__icon {
      color: rgb(64, 71, 77);
      margin: 0 8px;
      cursor: pointer;
      @include hover_opacity;
    }
  }
}
</style>
