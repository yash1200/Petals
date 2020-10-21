<template>
  <div class="ExpansionList">
    <button v-bind:class="'collapsible' + index" v-on:click="expand">
      <div class="button">
        <div class="title">
          {{ menu.type }}
        </div>
        <i class="material-icons"> {{ icon }} </i>
      </div>
    </button>
    <div v-bind:class="'content' + index">
      <RestaurantListTile
        v-for="item in menu.items"
        :key="item.name"
        :title="item.name"
        :value="item.price.toString()"
        :money="true"
      />
    </div>
  </div>
</template>

<script>
import RestaurantListTile from "@/components/MenuComponents/RestaurantListTile.vue";

export default {
  name: "ExpansionList",
  data() {
    return {
      icon: "keyboard_arrow_down",
    };
  },
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
      var content = document.getElementsByClassName(
        "content" + this.index.toString()
      );
      for (var col of collapsible) {
        for (var c of content) {
          if (c.style.maxHeight) {
            col.style.color = "white";
            this.icon = "keyboard_arrow_down";
            c.style.maxHeight = null;
          } else {
            col.style.color = "#64ffda";
            this.icon = "keyboard_arrow_up";
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
  width: 100%;
  border: none;
  outline: none;
  padding: 20px 15px 20px;
}

.button {
  display: flex;
  font-size: 15px;
  flex-direction: row;
  justify-content: space-between;
}

.title {
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.material-icons {
  display: flex;
  flex-direction: column;
  justify-content: center;
}

[class^="content"] {
  max-height: 0;
  overflow: hidden;
  transition: max-height 0.2s ease-out;
  background-color: #303030;
}
</style>