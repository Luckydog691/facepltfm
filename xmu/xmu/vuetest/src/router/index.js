import Vue from 'vue'
import Router from 'vue-router'
//导入user组件
import group from '../components/group'
import user from "../components/user";
//显式调用User
Vue.use(user)
Vue.use(group)
Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/group',
      component: group
    },
    {
      name: "user",
      path: '/user',
      component: user
    }
  ]
})

