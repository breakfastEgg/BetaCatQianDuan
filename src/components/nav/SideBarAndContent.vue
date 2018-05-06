<style scoped>
</style>

<template>
  <Layout class="ka">
    <Sider hide-trigger :style="{background: '#fff'}">
      <Menu active-name="1-2" theme="dark" width="auto" :open-names="['1']" :style="{height: '100%'}">
        <slot name="sideBar"></slot>
        <!--  -->
      </Menu>
    </Sider>
    <Layout :style="{padding: '10px'}">
      <Card :style="{height: '100%'}">
        <slot name='content'>no Content</slot>
      </Card>
    </Layout>
  </Layout>
</template>

<script>
export default {
}
</script>
