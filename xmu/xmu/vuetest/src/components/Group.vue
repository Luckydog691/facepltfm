<head>
<meta charset="UTF-8">
<!-- 引入样式 -->
<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-default/index.css">
<script src="https://unpkg.com/vue/dist/vue.js"></script>
<script src="https://unpkg.com/element-ui/lib/index.js"></script>
</head>

<template>
  <el-table :data="groups" class="data_table">
    <el-table-column prop="group_id" label="组名" width="180">
    </el-table-column>
  </el-table>
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
