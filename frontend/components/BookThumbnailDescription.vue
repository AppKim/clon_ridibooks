<template>
  <div class="book-thumbnail-description" :class="styles">
    <div v-show="title" class="book-thumbnail-description__title">
      {{ title }}
    </div>
    <div v-show="author" class="book-thumbnail-description__author">
      {{ author }}
    </div>
  </div>
</template>
<script>
import { computed, defineComponent } from '@nuxtjs/composition-api'

export default defineComponent({
  props: {
    size: {
      type: String,
      default: 'medium',
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
      const classes = []
      if (props.author) {
        classes.push('author-existed')
      }
      classes.push(props.size)
      return classes.join(' ')
    })
    return {
      styles,
    }
  },
})
</script>

<style lang="scss" scoped>
.book-thumbnail-description {
  position: relative;
  display: inline-block;
  &.author-existed {
    .book-thumbnail-description__title {
      font-size: 1.5rem;
      font-weight: $font-weight-bold;
      margin-top: 8px;
      color: $black;
    }
    .book-thumbnail-description__author {
      font-size: 1.4rem;
      margin-top: 2px;
      color: $light-gray;
    }
    @include sp_view {
      .book-thumbnail-description__title {
        font-size: 1.4rem;
      }
      .book-thumbnail-description__author {
        font-size: 1.3rem;
      }
    }
  }
  &.xLarge {
    width: 200px;
    @include sp_view {
      width: 150px;
    }
  }
  &.large {
    width: 140px;
  }
  &.medium {
    width: 120px;
    @include sp_view {
      width: 110px;
    }
  }
  &.small {
    width: 50px;
  }
  .book-thumbnail-description__title {
    font-size: 1.3rem;
    margin-top: 8px;
    color: $gray;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
  }
}
</style>
