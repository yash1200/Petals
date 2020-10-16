<template>
  <div class="Nav">
    <div class="navBar">
      <router-link class="appNameLink" to="/">
        <div class="appName">Petal</div>
      </router-link>
      <router-link class="searchLink" to="/search">
        <div class="material-icons">search</div>
      </router-link>
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

.appNameLink {
  text-decoration: none;
  cursor: pointer;
}

.appName {
  color: white;
  font-size: 1.2em;
}

.material-icons {
  color: white;
  cursor: pointer;
}
</style>
