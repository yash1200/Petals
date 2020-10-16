<template>
  <div class="SearchBar">
    <div class="material-icons" v-on:click="$router.go(-1)">arrow_back</div>
    <input
      class="SearchField"
      placeholder="Search"
      v-model="searchContent"
      v-on:input="getResults"
    />
    <div class="material-icons" v-on:click="clearSearchField">cancel</div>
  </div>
</template>

<script>
export default {
  name: "SearchBar",
  data() {
    return {
      searchContent: "",
    };
  },
  methods: {
    clearSearchField() {
      this.searchContent = "";
    },
    getResults() {
      console.log(this.searchContent);
    },
  },
};
</script>

<style scoped>
.SearchBar {
  height: 60px;
  display: flex;
  flex-direction: row;
  justify-content: center;
  background-color: #212121;
}

.SearchField {
  height: 58px;
  width: 90%;
  color: white;
  border: 0px solid #555;
  background-color: #212121;
  outline: none;
}

.SearchField:focus {
  border: 0px solid #555;
  outline: none;
}

.material-icons {
  display: flex;
  color: #64ffda;
  margin: 0 10px 0;
  flex-direction: column;
  justify-content: center;
}
</style>