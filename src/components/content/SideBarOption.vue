<style>

</style>

<template>
  <div>
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
  </div>
</template>

<script>
export default{

}
</script>
