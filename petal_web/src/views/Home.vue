<template>
  <div class="home">
    <HomeNavBar />
    <HomeBody />
  </div>
</template>

<script>
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
</style>