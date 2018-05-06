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
.layout-nav{
    /* width: 420px; */
    /* margin: 0 auto;
    height: 64px;
    margin-left: 200px; */
}
.ivu-menu-horizontal.ivu-menu-light:after{
    height: 0;
}
</style>
<template>
    <div class="layout">
        <Header :style="{padding: '0'}">
            <Menu mode="horizontal" theme="light" active-name="1" :style="{height: '64px', borderBottom: '1px solid #dddee1'}">
                <img src="../assets/logo.png" alt="" :style="{backgroundColor: '#495060', float: 'left'}">
                <NavItem></NavItem>
            </Menu>
        </Header>
        <Layout class="ka">
            <Sider hide-trigger :style="{background: '#fff'}">
                <Menu active-name="1-2" theme="dark" width="auto" :open-names="['1']" :style="{height: '100%'}">
                    <Submenu name="1">
                        <template slot="title">
                            <Icon type="ios-navigate"></Icon>
                            Item 1
                        </template>
                        <MenuItem name="1-1">Option 1</MenuItem>
                        <MenuItem name="1-2">Option 2</MenuItem>
                        <MenuItem name="1-3">Option 3</MenuItem>
                    </Submenu>
                    <Submenu name="2">
                        <template slot="title">
                            <Icon type="ios-keypad"></Icon>
                            Item 2
                        </template>
                        <MenuItem name="2-1">Option 1</MenuItem>
                        <MenuItem name="2-2">Option 2</MenuItem>
                    </Submenu>
                    <Submenu name="3">
                        <template slot="title">
                            <Icon type="ios-analytics"></Icon>
                            Item 3
                        </template>
                        <MenuItem name="3-1">Option 1</MenuItem>
                        <MenuItem name="3-2">Option 2</MenuItem>
                    </Submenu>
                </Menu>
            </Sider>
            <Layout :style="{padding: '10px'}">
                <Card :style="{height: '100%'}">
                    <slot name='content'>no Content</slot>
                </Card>
            </Layout>
        </Layout>
    </div>
</template>
<script>
import NavItem from './nav/NavItem'
export default {
  components: {
    NavItem
  }
}
</script>
