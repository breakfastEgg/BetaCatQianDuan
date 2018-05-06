<template>
  <div id="app">
    <!-- <img src="./assets/logo.png"> -->
    <!-- <router-view/> -->
    <input type="button" @click="add" value="加载">
    <div :is="viewComponent"></div>
    <!-- <Layout>
      <ChessBoard slot="content"></ChessBoard>
    </Layout> -->
  </div>
</template>

<script>
// import ChessBoard from './components/content/ChessBoard'
let asyncComponent = (url)  =>  {
    const asya = (url) => ({
      // 需要加载的组件 (应该是一个 `Promise` 对象)
      // component: import('./MyComponent.vue'),
      component: import(`${url}`),
      // 异步组件加载时使用的组件
      // loading: LoadingComponent,
      // 加载失败时使用的组件
      // error: ErrorComponent,
      // 展示加载时组件的延时时间。默认值是 200 (毫秒)
      delay: 200,
      // 如果提供了超时时间且组件加载也超时了，
      // 则使用加载失败时使用的组件。默认值是：`Infinity`
      timeout: 3000
     })
  }

console.log(() => ({component: import('./components/Layout2.vue')}));

const AsyncComponent = () => ({
  // 需要加载的组件 (应该是一个 `Promise` 对象)
  component: import('./components/Layout2.vue'),
  // 异步组件加载时使用的组件
  // 展示加载时组件的延时时间。默认值是 200 (毫秒)
  delay: 200,
  // 如果提供了超时时间且组件加载也超时了，
  // 则使用加载失败时使用的组件。默认值是：`Infinity`
  timeout: 3000
})

console.log(AsyncComponent);
console.log(AsyncComponent());
console.log(asyncComponent('./components/layout.vue'));


// let asyncComponent = () => import('./components/Layout2.vue')
export default {
  name: 'App',
  data () {
    return {
      viewComponent: ''
    }
  },
  components: {
    // Layout: () => import('./components/Layout2.vue'),
    // ChessBoard: () => import('./components/content/ChessBoard.vue')
    // Layout: () => (
    //   {
    //       component: import('./components/Layout2.vue'),
    //     // delay: 2000,
    //     // timeout: 30000
    //   }
    // )
    Layout: asyncComponent('./components/layout.vue')
  },
  methods: {
    add () {
      this.viewComponent = 'Layout'
    }
  }
}
</script>

<style>
</style>
