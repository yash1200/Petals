<template>
  <div class="SearchBar">
    <input class="SearchField" placeholder="Search" />
    <div class="material-icons">cancel</div>
  </div>
</template>

<script>
export default {
  name: "SearchBar",
};
</script>

<style scoped>
.SearchBar {
  height: 60px;
  background-color: #212121;
}

.SearchField {
  height: 58px;
  width: 90%;
  color: white;
  border: none;
  border-width: 0;
  border-style: hidden;
  background-color: #212121;
}

.material-icons {
  color: #64ffda;
  vertical-align: middle;
}
</style>