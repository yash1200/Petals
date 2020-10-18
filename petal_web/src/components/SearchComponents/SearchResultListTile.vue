<template>
  <div class="ListTile" v-on:click="Nav">
    <div class="Title">
      {{ title }}
    </div>
  </div>
</template>

<script>
export default {
  name: "SearchResultListTile",
  props: {
    id: {
      type: String,
      required: true,
    },
    title: {
      type: String,
      required: true,
    },
  },
  methods: {
    Nav() {
      this.$router.push({ name: "Restaurant", params: { id: this.id } });
    },
  },
};
</script>

<style scoped>
.ListTile {
  height: 60px;
  background-color: #424242;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  margin: 5px 10px 5px;
  border-radius: 15px;
}

.Title {
  display: flex;
  flex-direction: column;
  justify-content: center;
  color: white;
  padding-left: 20px;
}
</style>