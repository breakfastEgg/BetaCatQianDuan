<style scoped>
.layout-nav-right{
    float: right;
}
.userIcon{
  width: 30px;
  height: 30px;
  vertical-align: middle;
  border-radius: 50%;
  border: 2px solid #dddee1;
}
.layout-nav-right .menuIcon{
  font-size: 2em;
  vertical-align: middle
}
.ivu-menu-horizontal.ivu-menu-light:after{
  height: 0;
}
</style>
<template>
  <Header :style="{padding: '0'}">
    <Menu mode="horizontal" theme="light" active-name="1" :style="{height: '64px', borderBottom: '1px solid #dddee1'}">
      <img src="../../assets/logo.png" alt="" :style="{backgroundColor: '#495060', float: 'left'}">
      <div class="layout-nav">
        <router-link :to="{name: 'Layout2'}">
          <MenuItem name="1">
            <Icon type="ios-navigate"></Icon>
            所有项目
          </MenuItem>
        </router-link>
        <router-link :to="{name: 'ChessBoard'}">
          <MenuItem name="2">
            <Icon type="ios-keypad"></Icon>
            我的棋盘
          </MenuItem>
        </router-link>
        <MenuItem name="3">
          <Icon type="ios-analytics"></Icon>
          已归档项目
        </MenuItem>
        <!-- 用户区域 -->
        <div class="layout-nav-right">
          <MenuItem name="4">
            <Icon type="ios-bell" class="menuIcon"></Icon>
          </MenuItem>
          <Submenu name="5" >
            <template slot="title">
                <img src="../../assets/canvas.png" alt="" class="userIcon">
                Item 1
            </template>
            <MenuItem name="1-1">Option 1</MenuItem>
            <MenuItem name="1-2">Option 2</MenuItem>
            <MenuItem name="1-3">Option 3</MenuItem>
          </Submenu>
        </div>
      </div>
    </Menu>
  </Header>
</template>
<script>
export default{
}
</script>
