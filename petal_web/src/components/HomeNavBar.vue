<template>
  <div class="Nav">
    <div class="navBar">
      <div class="appName">Petal</div>
      <div class="material-icons">search</div>
    </div>
  </div>
</template>

<script>
export default {
  name: "HomeNavBar",
};
</script>

<style scoped>
.Nav {
  height: 7vh;
  display: flex;
  padding: 0 20px 0;
  flex-direction: column;
  justify-content: center;
  background-color: #212121;
}

.navBar {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}

.appName {
  color: white;
  font-size: 1.2em;
}

.material-icons {
  color: white;
}
</style>
