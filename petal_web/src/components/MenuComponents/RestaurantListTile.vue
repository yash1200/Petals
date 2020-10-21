<template>
  <div class="RestaurantListTile">
    <div class="title">
      {{ title }}
    </div>
    <div class="value">
      <div v-if="money == true">
        <i class="fa fa-rupee fa-16px"></i>
      </div>
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
    money: Boolean,
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

.fa {
  padding-right: 5px;
}

.value {
  color: white;
  display: flex;
  flex-direction: row;
}
</style>