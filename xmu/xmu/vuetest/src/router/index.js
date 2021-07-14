import Vue from 'vue'
import Router from 'vue-router'
//导入user组件
import User from '../components/User'
//显式调用User
Vue.use(User)
Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/user',
      component: User
    }
  ]
})
