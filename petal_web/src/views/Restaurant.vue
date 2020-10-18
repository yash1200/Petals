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
        <button class="collapsible">
          {{ menu.type }}
        </button>
        <RestaurantListTile
          class="content"
          v-for="item in menu.items"
          :key="item.name"
          :title="item.name"
          :value="item.price.toString()"
        />
      </li>
    </ul>
  </div>
</template>

<script>
import axios from "axios";
import * as ResData from "@/model/Restaurant.js";
import RestaurantNavBar from "@/components/MenuComponents/RestaurantNavBar.vue";
import RestaurantListTile from "@/components/MenuComponents/RestaurantListTile.vue";

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

.collapsible {
  background-color: #303030;
  color: white;
  cursor: pointer;
  padding: 20px 15px 20px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
}

.active,
.collapsible:hover {
  color: green;
}

.active:after {
  content: "\2212";
}

.content {
  padding: 0 18px;
  max-height: 0;
  overflow: hidden;
  transition: max-height 0.2s ease-out;
  background-color: #f1f1f1;
}

ul {
  list-style-type: none;
  padding: 0px 0px 0px;
}

.collapsible:after {
  content: "\002B";
  color: white;
  font-weight: bold;
  float: right;
  margin-left: 5px;
}
</style>