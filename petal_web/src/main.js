import { createApp } from "vue";
import App from "./App.vue";
import axios from "axios";
import VueAxios from "vue-axios";
import router from "./router";

axios.defaults.headers.common["Access-Control-Allow-Origin"] = "*";

createApp(App)
  .use(router, VueAxios, axios)
  .mount("#app");
