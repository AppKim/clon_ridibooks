<template>
  <div>
    <div class="my-select-header">
      <page-title :title="title"></page-title>
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
        <ul v-for="(item, index) in items" :key="index">
          <check-box :id="item.id" :checked="item.checked" @change="selected"></check-box>
          <book-thumbnail size="xLarge" src="https://placeimg.com/150/200/any" alt="sample image"> </book-thumbnail>
          <book-thumbnail-description></book-thumbnail-description>
          <book-thumbnail-title></book-thumbnail-title>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
import { defineComponent, ref } from '@nuxtjs/composition-api'
import BookThumbnail from '../BookThumbnail.vue'
import BookThumbnailTitle from '../BookThumbnailTitle'
import BookThumbnailDescription from '../BookThumbnailDescription'
import CheckBox from '../CheckBox.vue'
import PageTitle from '../PageTitle.vue'
export default defineComponent({
  components: { BookThumbnail, BookThumbnailDescription, BookThumbnailTitle, CheckBox, PageTitle },
  setup() {
    const title = '마이 셀렉트'
    const isAllSelected = ref(false)
    const items = ref([
      {
        id: 1,
        checked: false,
      },
      {
        id: 2,
        checked: false,
      },
      {
        id: 3,
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
      title,
      isAllSelected,
      selected,
      allSeleted,
      items,
    }
  },
})
</script>

<style lang="scss" scoped>
.my-select-body {
  width: 800px;
  margin: auto;
  .my-select-nav {
    display: flex;
    justify-content: space-between;
  }
}
</style>
