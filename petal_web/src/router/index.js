import { createRouter, createWebHashHistory } from "vue-router";
import Home from "../views/Home.vue";
import Scanner from "../views/Scanner.vue";
import Search from "../views/Search.vue";
import Restaurant from "../views/Restaurant.vue";

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home,
  },
  {
    path: "/scan",
    name: "Scanner",
    component: Scanner,
  },
  {
    path: "/search",
    name: "Search",
    component: Search,
  },
  {
    path: "/restaurant/:id",
    name: "Restaurant",
    component: Restaurant,
    params: true,
  },
];

const router = createRouter({
  history: createWebHashHistory(),
  routes,
});

export default router;
