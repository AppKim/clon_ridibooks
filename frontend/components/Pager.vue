<template>
  <nav class="paginations">
    <ul class="nav-links">
      <li class="previous-button"><a href="#"></a></li>
      <li v-for="i in total_page" :key="i" class="link-list">
        <a href="#">{{ i }}</a>
      </li>
      <li class="next-button"><a href="#"></a></li>
    </ul>
  </nav>
</template>

<script>
export default {}
</script>

<style lang="scss" scoped>
.nav-links {
  display: flex;
  list-style: none;
  justify-content: center;
  li {
    padding: 10px;
    border: 1px solid rgb(209, 213, 217);
    border-radius: 5px;
    margin: 5px;
    cursor: pointer;
    a {
      color: rgb(128, 137, 145);
    }
  }
  .previous-button {
    margin: auto 0;
    a:before {
      content: '<';
    }
  }
  .next-button {
    margin: auto 0;
    a:before {
      content: '>';
    }
  }
}
</style>
