<template>
  <div class="Restaurant" v-if="restaurant != null">
    <RestaurantNavBar />
    <RestaurantListTile
      v-if="restaurant != null"
      :title="'Owner'"
      :value="restaurant.owner"
    />
    <RestaurantListTile
      v-if="restaurant != null"
      :title="'Phone'"
      :value="restaurant.phone"
    />
    <ul>
      <li v-for="(menu, index) in restaurant.menus" :key="index">
        <ExpansionList :menu="menu" :index="index" />
      </li>
    </ul>
  </div>
</template>

<script>
import axios from "axios";
import * as ResData from "@/model/Restaurant.js";
import RestaurantNavBar from "@/components/MenuComponents/RestaurantNavBar.vue";
import RestaurantListTile from "@/components/MenuComponents/RestaurantListTile.vue";
import ExpansionList from "@/components/MenuComponents/ExpansionList.vue";

export default {
  name: "Restaurant",
  data() {
    return {
      restaurant: null,
    };
  },
  components: {
    RestaurantNavBar,
    RestaurantListTile,
    ExpansionList,
  },
  methods: {
    getRestaurant() {
      axios
        .get("http://192.168.0.104:3000/petal/" + this.$route.params.id)
        .then((response) => {
          console.log(response.data);
          this.restaurant = ResData.toRestaurant(response.data);
          console.log(this.restaurant.menus[0].type);
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
.Restaurant {
  display: flex;
  flex-direction: column;
}

ul {
  list-style-type: none;
  padding: 0px 0px 0px;
}
</style>