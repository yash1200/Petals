<template>
  <div class="MenuNavBar">
    <div class="material-icons" v-on:click="$router.go(-1)">arrow_back</div>
    <h2>Menu</h2>
  </div>
</template>

<script>
export default {
  name: "MenuNavBar",
};
</script>

<style scoped>
.MenuNavBar {
  background-color: #212121;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  color: white;
}

.material-icons {
  display: flex;
  padding-left: 10px;
  flex-direction: column;
  justify-content: center;
}

h2 {
  font-weight: 400;
  padding-left: 10px;
}
</style>