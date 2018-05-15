<style scoped>
  .pro-secrch{
    cursor: pointer;
  }
</style>

<template>
  <Layout class="ka">
    <Sider v-show="ifShowSideBar" hide-trigger :style="{background: '#fff'}">
      <Menu active-name="1-2" theme="dark" width="auto" :open-names="['1']" :style="{height: '100%'}">
        <slot name="sideBar"></slot>
      </Menu>
    </Sider>
    <Layout :style="{padding: '10px'}">
      <Card>
        <slot name='content'>
          <Row :style="{textAlign: 'right', marginBottom: '1em'}">
            <Button>新建项目</Button>
            <Input class="pro-secrch" placeholder="Enter something..." icon="ios-search" style="width: 200px"></Input>
            <ButtonGroup>
              <Button v-for="btn in btns"
              :key="btn.id"
              :type="btn.type"
              :icon="btn.icon"
              @click.native="switchBtn(btn.id)"></Button>
            </ButtonGroup>
          </Row>
          <Table v-if="table" :columns="columns1" :data="data2"></Table>
          <Table v-else :columns="columns2" :data="data3"></Table>
        </slot>
      </Card>
    </Layout>
  </Layout>
</template>

<script>
export default {
  data () {
    return {
      table: false,
      btns: [
        {
          id: 1,
          type: 'primary',
          icon: 'navicon-round'
        },
        {
          id: 2,
          type: 'ghost',
          icon: 'grid'
        }
      ],
      columns1: [
        {
          title: 'Name',
          key: 'name'
        },
        {
          title: 'Age',
          key: 'age'
        },
        {
          title: 'Address',
          key: 'address'
        }
      ],
      columns2: [
        {
          title: 'Name',
          key: 'name'
        },
        {
          title: 'Age',
          key: 'age'
        },
        {
          title: 'Address',
          key: 'address'
        }
      ],
      data2: [
        {
          name: 'John Brown',
          age: 18,
          address: 'New York No. 1 Lake Park',
          date: '2016-10-03'
        },
        {
          name: 'John Brown',
          age: 18,
          address: 'New York No. 1 Lake Park',
          date: '2016-10-03'
        },
        {
          name: 'John Brown',
          age: 18,
          address: 'New York No. 1 Lake Park',
          date: '2016-10-03'
        },
        {
          name: 'John Brown',
          age: 18,
          address: 'New York No. 1 Lake Park',
          date: '2016-10-03'
        },
        {
          name: 'John Brown',
          age: 18,
          address: 'New York No. 1 Lake Park',
          date: '2016-10-03'
        },
        {
          name: 'John Brown',
          age: 18,
          address: 'New York No. 1 Lake Park',
          date: '2016-10-03'
        },
        {
          name: 'John Brown',
          age: 18,
          address: 'New York No. 1 Lake Park',
          date: '2016-10-03'
        },
        {
          name: 'John Brown',
          age: 18,
          address: 'New York No. 1 Lake Park',
          date: '2016-10-03'
        },
        {
          name: 'John Brown',
          age: 18,
          address: 'New York No. 1 Lake Park',
          date: '2016-10-03'
        },
        {
          name: 'John Brown',
          age: 18,
          address: 'New York No. 1 Lake Park',
          date: '2016-10-03'
        },
        {
          name: 'John Brown',
          age: 18,
          address: 'New York No. 1 Lake Park',
          date: '2016-10-03'
        },
        {
          name: 'John Brown',
          age: 18,
          address: 'New York No. 1 Lake Park',
          date: '2016-10-03'
        },
        {
          name: 'John Brown',
          age: 18,
          address: 'New York No. 1 Lake Park',
          date: '2016-10-03'
        },
        {
          name: 'John Brown',
          age: 18,
          address: 'New York No. 1 Lake Park',
          date: '2016-10-03'
        },
        {
          name: 'John Brown',
          age: 18,
          address: 'New York No. 1 Lake Park',
          date: '2016-10-03'
        },
        {
          name: 'John Brown',
          age: 18,
          address: 'New York No. 1 Lake Park',
          date: '2016-10-03'
        },
        {
          name: 'Jim Green',
          age: 24,
          address: 'London No. 1 Lake Park',
          date: '2016-10-01'
        },
        {
          name: 'Joe Black',
          age: 30,
          address: 'Sydney No. 1 Lake Park',
          date: '2016-10-02'
        },
        {
          name: 'Jon Snow',
          age: 26,
          address: 'Ottawa No. 2 Lake Park',
          date: '2016-10-04'
        },
        {
          name: 'John Brown',
          age: 18,
          address: 'New York No. 1 Lake Park',
          date: '2016-10-03'
        },
        {
          name: 'Jim Green',
          age: 24,
          address: 'London No. 1 Lake Park',
          date: '2016-10-01'
        },
        {
          name: 'Joe Black',
          age: 30,
          address: 'Sydney No. 1 Lake Park',
          date: '2016-10-02'
        },
        {
          name: 'Jon Snow',
          age: 26,
          address: 'Ottawa No. 2 Lake Park',
          date: '2016-10-04'
        }
      ],
      data3: [
        {
          name: '1231',
          age: 1,
          address: 'dssdsd',
          date: '2016-10-03'
        },
        {
          name: 'ddddd',
          age: 13,
          address: 'dasdasda',
          date: '2016-10-03'
        },
        {
          name: 'dsaodn',
          age: 176,
          address: 'xxcxzx',
          date: '2016-10-03'
        }
      ]
    }
  },
  props: ['ifShowSideBar'],
  methods: {
    switchBtn (id) {
      this.btns.forEach(e => {
        if (e.id === id) {
          e.type = 'primary'
          this.table = true
        } else {
          e.type = 'ghost'
          this.table = false
        }
      })
    }
  }
}
</script>
