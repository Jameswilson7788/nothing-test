import Vue from 'vue'
import App from './App.vue'
import './quasar'
import "../node_modules/slick-carousel/slick/slick.css";

Vue.config.productionTip = false

new Vue({
  render: h => h(App),
}).$mount('#app')
