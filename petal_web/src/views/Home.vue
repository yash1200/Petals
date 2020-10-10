<template>
  <div class="home">
    <HomeNavBar />
    <HomeBody />
  </div>
</template>

<script>
// @ is an alias to /src
import HomeNavBar from "@/components/HomeNavBar.vue";
import HomeBody from "@/components/HomeBody.vue";

export default {
  name: "Home",
  components: {
    HomeNavBar,
    HomeBody,
  },
};
</script>

<style scoped>
body {
  height: 100%;
  background-color: #303030;
}

.home {
  background-color: #303030;
}
</style>