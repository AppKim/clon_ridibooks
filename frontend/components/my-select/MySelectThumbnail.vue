<template>
  <div>
    <book-thumbnail size="xLarge" src="https://placeimg.com/150/200/any" alt="sample image"> </book-thumbnail>
    <book-thumbnail-description></book-thumbnail-description>
    <book-thumbnail-title></book-thumbnail-title>
  </div>
</template>

<script>
import BookThumbnail from '../BookThumbnail.vue'
import BookThumbnailTitle from '../BookThumbnailTitle'
import BookThumbnailDescription from '../BookThumbnailDescription'
export default {
  components: { BookThumbnail, BookThumbnailDescription, BookThumbnailTitle },
}
</script>

<style></style>
