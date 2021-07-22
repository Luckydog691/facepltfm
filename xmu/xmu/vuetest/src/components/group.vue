

<template>
  <div>
    <!-- 删除人脸组 的 dialog-->
    <el-dialog
      title="警告"
      :visible.sync="delDialogVisible"
      width="30%"
      @close="closeDialog">
      <span>将删除该人脸组下的所有用户与人脸，该操作不可取消！</span>
      <span slot="footer" class="dialog-footer">
    <el-button @click="closeDialog()">取 消</el-button>
    <el-button type="primary" @click="delGroup()">确 定</el-button>
      </span>
    </el-dialog>

    <!-- 新建人脸组 的 dialog-->
    <el-dialog
      title="新建人脸组"
      :visible.sync="addDialogVisible"
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
        <el-button @click="addDialogVisible=true">新建人脸组</el-button>
      </el-header>
      <el-table :data="groups" border height="250" class="data_table">
        <el-table-column prop="group_id" align="center" label="组名" width="640"></el-table-column>
        <el-table-column align="center" label="操作">
          <template #default="scope">
            <el-button
              size="mini"
              @click="goToGroup(scope.row.group_id)">查看用户列表</el-button>
            <el-button
              size="mini"
              type="danger"
              @click="preDelGroup(scope.row.group_id)">删除人脸组</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-container>
  </div>
</template>


<script>
export default {
  name: "group",
  data(){
    return {
      addDialogVisible: false,
      delDialogVisible: false,
      preDeleteGroupName: "",
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
      this.addDialogVisible = false
      this.delDialogVisible = false
    },
    //新建人脸组
    addGroup (str) {
      if(!str)
      {
          this.$message.error('组名不能为空!');
          return;
      }
      this.$http({
        method: 'post',
        url: 'http://localhost:8080/web/sample/aipface/addGroup?name='+str,
        data: {
        }
      })
      this.addDialogVisible = false
      //刷新数据
      this.$router.go(0)
    },
    //预删除用户组，弹出dialog
    preDelGroup (str) {
      this.preDeleteGroupName = str
      this.delDialogVisible = true
    },
    delGroup () {
      this.delDialogVisible = false
      this.$http({
        method: 'delete',
        url: 'http://localhost:8080/web/sample/aipface/delGroup?name='+this.preDeleteGroupName,
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
