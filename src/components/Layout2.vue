<style scoped>
.layout{
    border: 1px solid #d7dde4;
    background: #f5f7f9;
    position: relative;
    border-radius: 4px;
    /* overflow: hidden; */
    /* height: 100vh; */
    display: flex;
    flex-direction: column
}

.sidebar-background{
  background-color: #dfe1e2
}
</style>
<template>
    <div class="layout">
        <NavBar></NavBar>
        <SideBarAndContent class="sidebar-background" :ifShowSideBar="sideBarShow">
          <router-view name="sideBar" slot="sideBar"></router-view>
          <router-view name="content" slot="content"></router-view>
        </SideBarAndContent>
    </div>
</template>
<script>
import NavBar from './nav/NavBar'
import SideBarAndContent from './nav/SideBarAndContent'
import BUS from './common/bus'

export default {
  mounted () {
    let _self = this

    BUS.$on('ifShowSideBar', function (param) {
      _self.sideBarShow = param
    })
  },
  data () {
    return {
      sideBarShow: false
    }
  },
  components: {
    NavBar,
    SideBarAndContent
  }
}
</script>
