<template>
  <div class="grid-booklist-container">
    <ul class="grid-booklist">
      <li v-for="i in 24" :key="i" class="grid-booklist__item">
        <div>
          <book-thumbnail size="xLarge" src="https://placeimg.com/150/200/any" alt="sample image"></book-thumbnail>
          <book-thumbnail-title :title="title"></book-thumbnail-title>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
import BookThumbnail from '../BookThumbnail.vue'
import BookThumbnailTitle from '../BookThumbnailTitle.vue'
export default {
  components: { BookThumbnail, BookThumbnailTitle },
}
</script>

<style lang="scss" scoped>
.grid-booklist-container {
  min-width: 320px;
  max-width: 800px;
  margin: 10px auto;
  .grid-booklist {
    display: flex;
    flex-wrap: wrap;
    padding: 16px 0;
    .grid-booklist__item {
      width: 120px;
      margin: 0 10px 50px 10px;
    }
  }
}
</style>
