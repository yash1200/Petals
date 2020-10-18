<template>
  <div class="RestaurantListTile">
    <div class="title">
      {{ title }}
    </div>
    <div class="value">
      {{ value }}
    </div>
  </div>
</template>

<script>
export default {
  name: "RestaurantListTile",
  props: {
    title: {
      type: String,
      required: true,
    },
    value: {
      type: String,
      required: true,
    },
  },
};
</script>

<style scoped>
.RestaurantListTile {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  padding: 20px 15px 20px;
}

.title {
  color: white;
}

.value {
  color: white;
}
</style>