<template>
  <div id="app">
    <!-- <img src="./assets/logo.png"> -->
    <!-- <router-view/> -->
    <router-view></router-view>
    <!-- <Layout>
      <ChessBoard slot="content"></ChessBoard>
    </Layout> -->
  </div>
</template>

<script>
export default {
  name: 'App',
  data () {
    return {
      viewComponent: ''
    }
  },
  // components: {
  //   // Layout: () => import('./components/Layout2.vue'),
  //   // ChessBoard: () => import('./components/content/ChessBoard.vue')
  //   // Layout: () => (
  //   //   {
  //   //       component: import('./components/Layout2.vue'),
  //   //     // delay: 2000,
  //   //     // timeout: 30000
  //   //   }
  //   // )
  //   Layout: asyncComponent('./components/Layout2.vue')
  // },
  methods: {
    add () {
      this.viewComponent = 'Layout'
    }
  }
}
</script>

<style>
</style>
