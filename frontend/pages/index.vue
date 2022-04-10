<template>
  <div style="padding: 200px">
    <BookThumbnail
      size="xLarge"
      src="https://placeimg.com/150/200/any"
      alt="sample image"
    />
    <BookThumbnail
      size="large"
      src="https://placeimg.com/150/200/any"
      alt="sample image"
    />
    <BookThumbnail
      size="medium"
      src="https://placeimg.com/150/200/any"
      alt="sample image"
    />
    <BookThumbnail
      size="small"
      src="https://placeimg.com/150/200/any"
      alt="sample image"
    />
  </div>
</template>

<script>
import BookThumbnail from '../components/BookThumbnail.vue'

export default {
  components: {
    BookThumbnail,
  },
}
</script>
