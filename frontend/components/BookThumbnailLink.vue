<template>
  <nuxt-link class="book-thumbnail-link" :to="to">
    <BookThumbnail :src="src" :size="size" :loading="loading" :alt="alt" />
    <BookThumbnailDescription :size="size" :title="title" :author="author_name" />
  </nuxt-link>
</template>

<script>
import { defineComponent, computed } from '@nuxtjs/composition-api'
import BookThumbnail from '@/components/BookThumbnail.vue'
import BookThumbnailDescription from '@/components/BookThumbnailDescription.vue'

export default defineComponent({
  components: {
    BookThumbnail,
    BookThumbnailDescription,
  },
  props: {
    size: {
      type: String,
      default: 'medium',
    },
    src: {
      type: String,
      required: true,
    },
    alt: {
      type: String,
      required: false,
      default: '',
    },
    loading: {
      type: String,
      default: 'lazy',
    },
    to: {
      type: String,
      default: '/',
    },
    title: {
      type: String,
      default: '',
    },
    author: {
      type: Array,
      required: false,
      default: () => [],
    },
  },
  setup(props) {
    const styles = computed(() => {
      if (props.author) {
        return 'author-existed'
      }
      return ''
    })
    const author_name = props.author.map((author) => author['name']).join()
    return {
      author_name,
      styles,
    }
  },
})
</script>

<style lang="scss" scoped>
.book-thumbnail-link {
  display: inline-flex;
  flex-direction: column;
  text-decoration: none;
}
</style>
