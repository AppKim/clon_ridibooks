<template>
  <div style="padding: 200px">
    <Header />
    <BookThumbnail size="xLarge" src="https://placeimg.com/150/200/any" alt="sample image" />
    <BookThumbnail size="large" src="https://placeimg.com/150/200/any" alt="sample image" />
    <BookThumbnail size="medium" src="https://placeimg.com/150/200/any" alt="sample image" />
    <BookThumbnail size="small" src="https://placeimg.com/150/200/any" alt="sample image" />

    <BookThumbnailLink
      src="https://placeimg.com/150/200/any"
      alt="sample image"
      to="/category"
      title="악의 마음을 읽는 자들asdㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇ"
    />
    <BookThumbnailLink
      size="large"
      src="https://placeimg.com/150/200/any"
      alt="sample image"
      to="/category"
      title="유괴의 날"
      author="정해연 저"
    />
  </div>
</template>

<script>
import BookThumbnail from '../components/BookThumbnail.vue'
import BookThumbnailLink from '../components/BookThumbnailLink.vue'
import Header from '../components/Header.vue'

export default {
  components: {
    BookThumbnail,
    BookThumbnailLink,
    Header,
  },
}
</script>
