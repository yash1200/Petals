<template>
  <div class="RestaurantNavBar">
    <div class="material-icons" v-on:click="$router.go(-1)">arrow_back</div>
    <div class="title">Menu</div>
  </div>
</template>

<script>
export default {
  name: "RestaurantNavBar",
};
</script>

<style scoped>
.RestaurantNavBar {
  background-color: #212121;
  display: flex;
  height: 7vh;
  flex-direction: row;
  justify-content: flex-start;
  color: white;
}

.material-icons {
  display: flex;
  padding-left: 15px;
  flex-direction: column;
  justify-content: center;
}

.title {
  display: flex;
  flex-direction: column;
  justify-content: center;
  font-size: 20px;
  font-weight: 400;
  padding: 5px 15px;
}
</style>