<template>
  <div id="app">
    <!-- <img src="./assets/logo.png"> -->
    <!-- <router-view/> -->
    <Layout>
      <ChessBoard slot="content"></ChessBoard>
    </Layout>
  </div>
</template>

<script>
import Layout from './components/Layout2'
import ChessBoard from './components/content/ChessBoard'
export default {
  name: 'App',
  components: {
    Layout,
    ChessBoard
  }
}
</script>

<style>
</style>
