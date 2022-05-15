<template>
<div>
  <book-thumbnail
  size="xLarge"
  src="https://placeimg.com/150/200/any"
  alt="sample image"
  ></book-thumbnail>
  <book-thumbnail-title></book-thumbnail-title>
</div>
</template>

<script>
import BookThumbnail from './BookThumbnail.vue'
import BookThumbnailTitle from './charts/BookThumbnailTitle.vue'
export default {
  components: { BookThumbnail, BookThumbnailTitle },
}
</script>

<style>

</style>