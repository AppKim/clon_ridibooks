<template>
  <transition name="modal" appear>
    <div class="modal__overlay">
      <div class="modal__window">
        <div class="modal__header">
          <h1>카테고리</h1>
          <button class="modal__close__btn" type="button" @click="$emit('close')">
            <svg viewBox="0 0 24 24">
              <path d="M5.636 4.222l14.142 14.142-1.414 1.414L4.222 5.636z"></path>
              <path d="M18.364 4.222l1.414 1.414L5.636 19.778l-1.414-1.414z"></path>
            </svg>
          </button>
        </div>
        <ul class="modal__content">
          <li v-for="category in categories" :key="category.id">
            <button type="button" class="category__item__btn" @click="moveToCategory(category.id)">
              <div class=""></div>
              {{ category.categoryName }}
            </button>
          </li>
        </ul>
      </div>
    </div>
  </transition>
</template>

<script>
import { useRouter } from '@nuxtjs/composition-api'
export default {
  props: {
    categories: {
      type: Array,
      required: true,
    },
  },
  setup() {
    const router = useRouter()

    const moveToCategory = (id) => {
      router.push(`/categories/${id}`)
    }
    return {
      moveToCategory,
    }
  },
}
</script>

<style lang="scss" scoped>
.modal {
  &__overlay {
    display: flex;
    align-items: center;
    justify-content: center;
    position: fixed;
    z-index: 100;
    top: 0;
    left: 0;
    height: 100%;
    width: 100%;
    background: rgba(0, 0, 0, 0.4);
  }

  &__header {
    display: flex;
    justify-content: space-between;
    font-size: 24px;
    padding: 16px;
  }

  &__close__btn {
    margin: 0px;
    padding: 0px;
    border: 0px;
    appearance: none;
    background: none;
    line-height: 0;
    box-shadow: none;
    cursor: pointer;
    width: 32px;
    height: 32px;
    border-radius: 2px;
    outline: none;
  }

  &__window {
    width: 25%;
    height: 47%;
    overflow: auto;
    background-color: white;
  }

  &__content {
    padding: 0px;
  }
}
.category__item__btn {
  margin: 0px;
  border: 0px;
  appearance: none;
  box-shadow: none;
  cursor: pointer;
  background: white;
  width: 100%;
  text-align: left;
  padding: 12px 20px 12px 50px;
  font-size: 16px;
  line-height: 24px;
  color: rgb(33, 37, 41);
  position: relative;
  transition: background 0.2s ease 0s;
}

svg {
  width: 26px;
  height: 26px;
  fill: rgb(184, 191, 196);
  outline: none;
}
</style>
>
