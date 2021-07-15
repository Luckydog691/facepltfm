<template>
  <div>
    <table>
      <tr>
        <th>组名</th>
      </tr>
      <tr v-for="item in groups">
        <td>{{item.group_id}}</td>
      </tr>
    </table>
  </div>
</template>

<script>
    export default {
        name: "groups",
      data(){
        return {
          groups:[
          ]
        }
      },
      //页面初始化完成后要加载的东西
      created() {
        //this指的是当前的vue对象，把vue对象赋给_this
        const _this=this
        this.axios.get('http://localhost:8080/web/sample/aipface/findGroup').then(function (resp) {
          //回调函数中的this指的是回调
          //把data数据赋给_this，即vue对象
          _this.groups=resp.data
        })
      }
    }
</script>

<style scoped>

</style>
