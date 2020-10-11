<template>
  <div class="Nav">
    <div class="appName">Petal</div>
    <div class="material-icons">search</div>
  </div>
</template>

<script>
export default {
  name: "HomeNavBar",
};
</script>

<style scoped>
.Nav {
  height: 60px;
  display: flex;
  flex-direction: row;
  background-color: #212121;
  justify-content: space-between;
  align-content: center;
}

.appName {
  color: white;
  padding-left: 20px;
}

.material-icons {
  color: white;
  padding-right: 20px;
}
</style>
