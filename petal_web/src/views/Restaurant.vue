<template>
  <div class="Restaurant">
    <MenuNavBar />
  </div>
</template>

<script>
import axios from "axios";
import * as ResData from "@/model/Restaurant.js";
import MenuNavBar from "@/components/MenuComponents/MenuNavBar.vue";

export default {
  name: "Restaurant",
  data() {
    return {
      restaurant: null,
    };
  },
  components: {
    MenuNavBar,
  },
  methods: {
    getRestaurant() {
      axios
        .get("http://localhost:3000/petal/" + this.$route.params.id)
        .then((response) => {
          console.log(response.data);
          this.restaurant = ResData.toRestaurant(response.data);
        });
    },
  },
  mounted() {
    console.log(this.$route.params.id);
    this.getRestaurant();
  },
};
</script>

<style scoped>
</style>