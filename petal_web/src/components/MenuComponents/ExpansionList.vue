<template>
  <div class="ExpansionList">
    <button v-bind:class="'collapsible' + index" v-on:click="expand">
      {{ menu.type }}
    </button>
    <div v-bind:class="'content' + index">
      <RestaurantListTile
        v-for="item in menu.items"
        :key="item.name"
        :title="item.name"
        :value="item.price.toString()"
      />
    </div>
  </div>
</template>

<script>
import RestaurantListTile from "@/components/MenuComponents/RestaurantListTile.vue";

export default {
  name: "ExpansionList",
  components: {
    RestaurantListTile,
  },
  props: {
    menu: Object,
    index: Number,
  },
  methods: {
    expand() {
      var collapsible = document.getElementsByClassName(
        "collapsible" + this.index.toString()
      );
      for (var col of collapsible) {
        console.log(col);
        // col.classList.toggle("active" + this.index.toString());
        var content = document.getElementsByClassName(
          "content" + this.index.toString()
        );
        for (var c of content) {
          if (c.style.maxHeight) {
            col.style.color = "white";
            c.style.maxHeight = null;
          } else {
            col.style.color = "#64ffda";
            c.style.maxHeight = c.scrollHeight + "px";
          }
        }
      }
    },
  },
};
</script>

<style scoped>
[class^="collapsible"] {
  background-color: #303030;
  color: white;
  cursor: pointer;
  padding: 15px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
}

[class^="collapsible"]:after {
  content: "\032D";
  color: white;
  font-weight: bold;
  float: right;
}

[class^="active"] {
  color: #64ffda;
}

[class^="active"]:after {
  content: "\02C7";
  color: #64ffda;
}

[class^="content"] {
  max-height: 0;
  overflow: hidden;
  transition: max-height 0.2s ease-out;
  background-color: #303030;
}
</style>