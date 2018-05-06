<style scoped>
.layout{
    border: 1px solid #d7dde4;
    background: #f5f7f9;
    position: relative;
    border-radius: 4px;
    overflow: hidden;
    height: 100vh;
    display: flex;
    flex-direction: column
}
</style>
<template>
    <div class="layout">
        <NavBar></NavBar>
        <SideBarAndContent>
          <router-view name="sideBar" slot="sideBar"></router-view>
          <router-view slot="content"></router-view>
        </SideBarAndContent>
    </div>
</template>
<script>
import NavBar from './nav/NavBar'
import SideBarAndContent from './nav/SideBarAndContent'

export default {
  components: {
    NavBar,
    SideBarAndContent
  }
}
</script>
