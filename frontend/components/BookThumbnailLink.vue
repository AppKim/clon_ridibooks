<template>
  <nuxt-link class="book-thumbnail-link" :to="to">
    <div class="book-thumbnail-link__thumbnail-wrapper" :class="size">
      <book-thumbnail :src="src" :loading="loading" :alt="alt" />
    </div>
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
  &__thumbnail-wrapper {
    display: flex;
    align-items: flex-end;
  }
  & .xLarge {
    width: 200px;
    height: 290px;
    max-height: 290px;
    @include sp_view {
      width: 150px;
      height: 218px;
      max-height: 218px;
    }
  }
  & .large {
    width: 140px;
    height: 216px;
    max-height: 216px;
  }
  & .medium {
    width: 120px;
    height: 184px;
    max-height: 184px;
    @include sp_view {
      width: 110px;
      height: 167px;
      max-height: 167px;
    }
  }
  & .small {
    width: 50px;
    height: 70px;
    max-height: 70px;
  }
}
</style>
