<template>
  <div class="my-select">
    <div class="my-select-header">
      <page-title :title="pageTitle"></page-title>
    </div>
    <div class="my-select-body">
      <div class="my-select-nav">
        <div class="left">
          <span class="checkbox-select-all">
            <check-box :checked="isAllSelected" @change="allSeleted"></check-box>
            <span>전체선택</span>
          </span>
        </div>
        <div class="right">
          <span class="delete">선택삭제</span>
          <span class="download">다운로드</span>
        </div>
      </div>
      <div class="my-select-list">
        <ul v-for="(item, index) in items" :key="index" class="my-select-list__item">
          <div class="left">
            <check-box :id="item.id" :checked="item.checked" @change="selected"></check-box>
            <book-thumbnail
              size="medium"
              align-items="center"
              src="https://placeimg.com/150/200/any"
              alt="sample image"
            >
            </book-thumbnail>
            <book-thumbnail-description :title="item.title" :author="item.author"></book-thumbnail-description>
          </div>
          <div class="right">
            <span class="download">다운로드</span>
          </div>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
import { defineComponent, ref } from '@nuxtjs/composition-api'
import BookThumbnail from '../BookThumbnail.vue'
import BookThumbnailDescription from '../BookThumbnailDescription'
import CheckBox from '../CheckBox.vue'
import PageTitle from '../PageTitle.vue'
export default defineComponent({
  components: { BookThumbnail, BookThumbnailDescription, CheckBox, PageTitle },
  setup() {
    const pageTitle = '마이 셀렉트'
    const isAllSelected = ref(false)
    const items = ref([
      {
        id: 1,
        title: 'Lorem.',
        author: 'Tanaka',
        checked: false,
      },
      {
        id: 2,
        title: 'Lorem.',
        author: 'Tanaka',
        checked: false,
      },
      {
        id: 3,
        title: 'Lorem.',
        author: 'Tanaka',
        checked: false,
      },
    ])

    const selected = (id, checked) => {
      const target = items.value.find((item) => String(item.id) === String(id))
      target.checked = checked
    }

    const allSeleted = () => {
      isAllSelected.value = !isAllSelected.value
      items.value.forEach((item) => (item.checked = isAllSelected.value))
    }

    return {
      pageTitle,
      isAllSelected,
      selected,
      allSeleted,
      items,
    }
  },
})
</script>

<style lang="scss" scoped>
.my-select {
  max-width: 800px;
  margin: auto;
  .my-select-header {
    @include sp_view {
      display: none;
    }
  }
  .my-select-body {
    .my-select-nav {
      display: flex;
      justify-content: space-between;
      padding: 10px;
      border-top: 2px solid #d1d5d9;
      border-bottom: 1px solid #d1d5d9;
      @include sp_view {
        border-top: none;
      }
    }
    .download {
      border: 1px solid rgb(0, 119, 217);
      border-radius: 3px;
      background: rgb(31, 140, 230);
      color: white;
      padding: 5px 10px;
      font-size: 12px;
      cursor: pointer;
    }
    .delete {
      font-size: 12px;
      border-radius: 3px;
      border: 1px solid #d1d5d9;
      padding: 5px 10px;
      cursor: pointer;
    }
    .my-select-list {
      .my-select-list__item {
        display: flex;
        align-items: center;
        justify-content: space-between;
        border-bottom: 2px solid #e6e8eb;
        padding: 10px;
        .left {
          display: flex;
          align-items: center;
        }
      }
      .book-thumbnail {
        margin: 0 15px 0 10px;
      }
      .book-thumbnail-description {
        position: relative;
        top: -30px;
      }
    }
  }
}
</style>
