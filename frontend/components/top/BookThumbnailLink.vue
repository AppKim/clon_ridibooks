<template>
  <nuxt-link class="book-thumbnail-link" :class="styles" :to="to">
    <book-thumbnail :size="size" :src="src" />
    <book-thumbnail-description :size="size" :title="title" :author="author" />
  </nuxt-link>
</template>

<script>
import { defineComponent, computed } from '@vue/composition-api'
import BookThumbnail from '@/components/BookThumbnail.vue'
import BookThumbnailDescription from '@/components/top/BookThumbnailDescription'

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
      default: '',
    },
    to: {
      type: String,
      required: true,
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
