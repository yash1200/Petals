<template>
  <div class="Search">
    <div class="SearchNavBar">
      <div class="material-icons" v-on:click="$router.go(-1)">arrow_back</div>
      <input
        class="SearchField"
        placeholder="Search"
        v-model="searchContent"
        v-on:input="getResults"
      />
      <div class="material-icons" v-on:click="clearSearchField">cancel</div>
    </div>
    <div v-if="searchResults != null">
      <SearchResultListTile
        v-for="result in searchResults"
        :key="result._id"
        :id="result._id"
        :title="result.name"
      />
    </div>
  </div>
</template>

<script>
import axios from "axios";
import * as SearchRes from "@/model/SearchRes.js";
import SearchResultListTile from "@/components/SearchComponents/SearchResultListTile.vue";

export default {
  name: "Search",
  data() {
    return {
      searchContent: "",
      searchResults: null,
    };
  },
  components: {
    SearchResultListTile,
  },
  methods: {
    clearSearchField() {
      this.searchContent = "";
      this.searchResults = null;
    },
    getResults() {
      if (this.searchContent != "") {
        axios
          .get("http://192.168.0.104:3000/search/", {
            params: { q: this.searchContent },
          })
          .then((response) => {
            this.searchResults = SearchRes.toSearchRes(response.data);
          });
      } else {
        this.searchResults = null;
      }
    },
  },
};
</script>

<style scoped>
.SearchBar {
  display: flex;
  flex-direction: column;
}

.SearchNavBar {
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