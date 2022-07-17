<template>
  <nuxt-link class="book-thumbnail-link" :to="to">
    <book-thumbnail :src="src" :size="size" :loading="loading" :alt="alt" />
    <book-thumbnail-description :size="size" :title="title" :author="author" />
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
      required: true,
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
      type: String,
      default: '',
    },
  },
  setup(props) {
    const styles = computed(() => {
      if (props.author) {
        return 'author-existed'
      }
      return ''
    })
    return {
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
