<template>
  <div class="navBar">
    <router-link class="appNameLink" to="/">
      <div class="appName">Petal</div>
    </router-link>
    <router-link class="searchLink" to="/search">
      <div class="material-icons">search</div>
    </router-link>
  </div>
</template>

<script>
export default {
  name: "HomeNavBar",
};
</script>

<style scoped>
.navBar {
  height: 7vh;
  padding: 0 20px 0;
  background-color: #212121;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}

.appNameLink,
.searchLink {
  text-decoration: none;
  cursor: pointer;
}

.appName {
  color: white;
  display: flex;
  cursor: pointer;
  font-size: 20px;
  height: 7vh;
  flex-direction: column;
  justify-content: center;
}

.material-icons {
  height: 7vh;
  color: white;
  cursor: pointer;
  display: flex;
  flex-direction: column;
  justify-content: center;
}
</style>
