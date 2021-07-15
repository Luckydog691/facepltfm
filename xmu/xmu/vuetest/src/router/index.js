import Vue from 'vue'
import Router from 'vue-router'
//导入user组件
import Group from '../components/Group'
//显式调用User
Vue.use(Group)
Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/group',
      component: Group
    }
  ]
})
