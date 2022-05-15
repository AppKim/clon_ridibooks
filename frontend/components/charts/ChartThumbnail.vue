<template>
<div>
    <book-thumbnail
    size="xLarge"
    src="https://placeimg.com/150/200/any"
    alt="sample image"
    ></book-thumbnail>
    <book-thumbnail-title></book-thumbnail-title>
    <book-review></book-review>
</div>
</template>

<script>
import { defineComponent } from '@vue/composition-api'
import BookThumbnail from '../BookThumbnail.vue'
import BookReview from './BookReview.vue'
import BookThumbnailTitle from './BookThumbnailTitle.vue'

export default defineComponent({
    components: { BookThumbnail, BookReview, BookThumbnailTitle },
    props: {
        src: {
            type: String,
            required: true,
        },
        alt: {
            type: String,
            required: true,
        },
    }
})
</script>