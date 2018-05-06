import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Layout2',
      component: () => ({component: import('@/components/Layout2.vue'), loading: null, error: null})
    }
  ]
})
