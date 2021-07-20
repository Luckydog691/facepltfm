

<template>
  <div>
    <el-dialog
      title="新建人脸组"
      :visible.sync="dialogVisible"
      width="30%"
      @close="closeDialog"
    >
      <el-form :model="groupForm">
        <el-form-item label="组名称">
          <el-input v-model="groupForm.name" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <template #footer>
            <span class="dialog-footer">
              <el-button type="primary" @click="addGroup(groupForm.name)">确 定</el-button>
            </span>
      </template>
    </el-dialog>
    <el-container style="height: 500px; border: 1px solid #eee">
      <el-header style="text-align: right; font-size: 12px">
        <el-button @click="dialogVisible=true">新建人脸组</el-button>
      </el-header>
      <el-table :data="groups" border height="250" class="data_table">
        <el-table-column prop="group_id" align="center" label="组名" width="640"></el-table-column>
        <el-table-column align="center" label="操作">
          <template #default="scope">
            <el-button
              size="mini"
              @click="goToGroup(scope.row.group_id)">查看</el-button>
            <el-button
              size="mini"
              type="danger"
              @click="delGroup(scope.row.group_id)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-container>
  </div>
</template>


<script>
export default {
  name: "groups",
  data(){
    return {
      dialogVisible: false,
      groupForm: {
        name: ''
      },
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
  },
  methods:{
    //关闭窗口
    closeDialog() {
      this.dialogVisible = false
    },
    //新建人脸组
    addGroup (str) {
      this.dialogVisible = false
      this.$http({
        method: 'post',
        url: 'http://localhost:8080/web/sample/aipface/addGroup?name='+str,
        data: {
        }
      })
      //刷新数据
      this.$router.go(0)
    },
    delGroup (str) {
      this.dialogVisible = false
      this.$http({
        method: 'delete',
        url: 'http://localhost:8080/web/sample/aipface/delGroup?name='+str,
        data: {
        }
      })
      //刷新数据
      this.$router.go(0)
    },
    //进入用户组
    goToGroup (str) {
      this.$router.push({ path: 'user', query: { gn: str }})
    }
  }
}
</script>
<style scoped>
</style>
