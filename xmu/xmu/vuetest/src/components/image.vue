<template>
  <div>
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/group' }">人脸库</el-breadcrumb-item>
      <el-breadcrumb-item :to="{ path: '/user',query:{ gn:this.groupName} }" > <b v-text="this.groupName"></b> </el-breadcrumb-item>
      <el-breadcrumb-item :to="{ path: '/image',query:{ gn:this.groupName,un:this.userName} }" v-text=this.userName ></el-breadcrumb-item>
    </el-breadcrumb>
    <el-container style="height: 500px; border: 1px solid #eee">
      <el-header style="text-align: right; font-size: 12px">
      </el-header>
      <el-table :data="faces" border height="250" class="data_table">
        <el-table-column prop="face_token" align="center" label="人脸标签" width="480"></el-table-column>
        <el-table-column prop="time_string" align="center" label="创建时间" width="480"></el-table-column>
        <el-table-column align="center" label="操作">
          <template #default="scope">
            <el-button
              size="mini"
              type="danger"
              @click="delFace(scope.row.group_id)">删除人脸</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-container>
  </div>
</template>


<script>
export default {
  name: "user",
  data(){
    return {
      groupName:'',
      userName:'',
      faces  :[
      ]
    }
  },
  //页面初始化完成后要加载的东西
  created() {
    //this指的是当前的vue对象，把vue对象赋给_this
    this.groupName = this.$route.query.gn
    this.userName = this.$route.query.un
    const _this=this
    this.axios.get('http://localhost:8080/web/sample/aipface/findImageList?gname='+this.groupName+'&uname='+this.userName).then(function (resp) {
      //回调函数中的this指的是回调
      //把data数据赋给_this，即vue对象
      _this.faces=resp.data
    })
  },
  methods:{

  }
}
</script>
<style scoped>
</style>
