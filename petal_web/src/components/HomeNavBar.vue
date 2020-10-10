<template>
  <div class="Nav">
    <h3 class="appName">Petal</h3>
    <i class="material-icons">search</i>
  </div>
</template>

<script>
export default {
  name: "HomeNavBar",
};
</script>

<style scoped>
.Nav {
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
  vertical-align: -14%;
}
</style>
