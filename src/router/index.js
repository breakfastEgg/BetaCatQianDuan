import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      base: '/dist/',
      name: 'Layout2',
      component: () => ({component: import('@/components/Layout2'), loading: null, error: null}),
      children: [
        {
          path: 'ChessBoard',
          name: 'ChessBoard',
          components: {
            sideBar: () => ({component: import('@/components/content/SideBarOption'), loading: null, error: null}),
            content: () => ({component: import('@/components/content/ChessBoard'), loading: null, error: null})
          },
          children: []
        }
      ]
    }
  ]
})
