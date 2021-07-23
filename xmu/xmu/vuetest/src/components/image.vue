<template>
  <div>
    <!-- 删除用户人脸的Dialog-->
    <el-dialog
      title="警告"
      :visible.sync="delDialogVisible"
      width="30%"
      @close="closeDialog">
      <span>将删除该人脸信息，该操作不可取消！</span>
      <span slot="footer" class="dialog-footer">
    <el-button @click="closeDialog()">取 消</el-button>
    <el-button type="primary" @click="delFace()">确 定</el-button>
      </span>
    </el-dialog>


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
              @click="preDeleteToken(scope.row.face_token)">删除人脸</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-container>
  </div>
</template>
;

<script>
import axios from "axios";

export default {
  name: "user",
  data(){
    return {
      delDialogVisible: false,
      groupName: '',
      userName: '',
      preDeletedFaceToken: '',
      ret: false,
      faces :[
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
      //关闭窗口
      closeDialog() {
        this.delDialogVisible = false
        this.preDeletedFaceToken = null
      },
      preDeleteToken(faceToken){
        this.preDeletedFaceToken = faceToken
        this.delDialogVisible = true
      },
      //删除用户人脸
      delFace(){
        this.delDialogVisible = false
        axios.delete('http://localhost:8080/web/sample/aipface/delImage', {
          data: {
            gname: this.groupName,
            uname: this.userName,
            token: this.preDeletedFaceToken
          }
        }).then(val => {
            //console.log(val)
            let data = val.data;
            if(data==true)
              this.$message({
                type: 'success',
                message: '删除人脸成功'
              });
            else
              this.$message({
                type: 'error',
                message: '操作失败'
              });
          })
          .catch(function (error) {
            console.log(error);
          });
        //刷新数据
        clearTimeout(this.timer);  //清除延迟执行
        this.timer = setTimeout(()=>{   //设置延迟执行
          this.$router.go(0)
        },1000);
      },
  }
}
</script>
<style scoped>
</style>
