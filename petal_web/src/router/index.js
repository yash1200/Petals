import { createRouter, createWebHashHistory } from "vue-router";
import Home from "../views/Home.vue";
import Scanner from "../views/Scanner.vue";
import Search from "../views/Search.vue";

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
];

const router = createRouter({
  history: createWebHashHistory(),
  routes,
});

export default router;
