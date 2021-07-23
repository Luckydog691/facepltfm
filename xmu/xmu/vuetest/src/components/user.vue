
<template>
  <div>

    <!-- 删除用户 的 dialog-->
    <el-dialog
      title="警告"
      :visible.sync="delDialogVisible"
      width="30%"
      @close="closeDialog">
      <span>将删除该用户之下的所有人脸信息，该操作不可取消！</span>
      <span slot="footer" class="dialog-footer">
    <el-button @click="closeDialog()">取 消</el-button>
    <el-button type="primary" @click="delUser()">确 定</el-button>
      </span>
    </el-dialog>

    <!--新建用户人脸 Dialog-->
    <el-dialog
      title="请上传人脸照片"
      :visible.sync="addFaceDialogVisible"
      width="70%"
      @close="closeDialog"
    >
      <el-upload
        accept="image/jpeg,image/gif,image/png"
        action="#"
        :http-request="httpRequest"
        :show-file-list="false"
        :before-upload="beforeAvatarUpload"
        list-type="picture"
      >
        <img v-if="userForm.url" :src="userForm.url" class="avatar" width="108" height="108">
        <el-button size="small" type="primary">
          <div v-if="userForm.url">更换图片</div><div v-else>上传图片</div>
        </el-button>
      </el-upload>
      <template #footer>
            <span class="dialog-footer">
              <el-button type="primary" @click="uploadUser(userForm.name,userForm.url)">确 定</el-button>
            </span>
      </template>
    </el-dialog>

    <!--新建用户 Dialog-->
    <el-dialog
      title="新建用户"
      :visible.sync="addUserDialogVisible"
      width="70%"
      @close="closeDialog"
    >
      <el-form :model="userForm">
        <el-form-item label="用户名称">
          <el-input v-model="userForm.name" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <el-upload
        accept="image/jpeg,image/gif,image/png"
        action="#"
        :http-request="httpRequest"
        :show-file-list="false"
        :before-upload="beforeAvatarUpload"
        list-type="picture"
        >
        <img v-if="userForm.url" :src="userForm.url" class="avatar" width="108" height="108">
        <el-button size="small" type="primary">
          <div v-if="userForm.url">更换图片</div><div v-else>上传图片</div>
        </el-button>
      </el-upload>
      <template #footer>
            <span class="dialog-footer">
              <el-button type="primary" @click="uploadUser(userForm.name,userForm.url)">确 定</el-button>
            </span>
      </template>
    </el-dialog>



    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/group' }">人脸库</el-breadcrumb-item>
      <el-breadcrumb-item :to="{ path: '/user',query:{ gn:this.groupName} }" id="first" v-text=this.groupName ></el-breadcrumb-item>
    </el-breadcrumb>



    <el-container style="height: 500px; border: 1px solid #eee">
      <el-header style="text-align: right; font-size: 12px">
        <el-button @click="addUserDialogVisible=true">1:N识别</el-button>
        <el-button @click="addUserDialogVisible=true">新建用户</el-button>
      </el-header>
      <el-table :data="users" border height="250" class="data_table">
        <el-table-column prop="user_name" align="center" label="用户名" width="640"></el-table-column>
        <el-table-column align="center" label="操作">
          <template #default="scope">
            <el-button
              size="mini"
              @click="goToImage(scope.row.user_name)">查看人脸表</el-button>
            <el-button
              size="mini"
              @click="loginImage(scope.row.user_name)">新人脸注册</el-button>
            <el-button
              size="mini"
              type="danger"
              @click="preDelUser(scope.row.user_name)">删除用户</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-container>
  </div>
</template>


<script>
import axios from "axios";

export default {
  name: "user",
  data(){
    return {
      delDialogVisible: false,
      addUserDialogVisible: false,
      addFaceDialogVisible: false,
      preDeleteUserName: "",
      groupName:'',
      userForm: {
        name: '',
        url:''
      },
      users  :[
      ]
    }
  },
  //页面初始化完成后要加载的东西
  created() {
    //this指的是当前的vue对象，把vue对象赋给_this
    this.groupName = this.$route.query.gn
    const _this=this
    this.axios.get('http://localhost:8080/web/sample/aipface/findUser?gname='+this.groupName+'&'+'length=20').then(function (resp) {
      //回调函数中的this指的是回调
      //把data数据赋给_this，即vue对象
      _this.users=resp.data
    })
  },
  methods:{
    //进入用户组
    goToImage (userName) {
      this.$router.push({ path: 'image', query:
          {
              un: userName,
              gn: this.groupName
          }})
    },
    //关闭窗口
    closeDialog() {
      this.delDialogVisible = false
      this.addUserDialogVisible = false
      this.addFaceDialogVisible = false
      this.userForm.url = null
      this.userForm.name = null
    },
    //判断图片是否合法
    beforeAvatarUpload(file) {
      const isJPG = file.type === 'image/jpeg'||'image/gif'||'image/png';
      const isLt2M = file.size / 1024 / 1024 < 2;

      if (!isJPG) {
        this.$message.error('上传头像图片只能是 JPG 格式!');
      }
      if (!isLt2M) {
        this.$message.error('上传头像图片大小不能超过 2MB!');
      }
      return isJPG && isLt2M;
    },
    //上传用户图片信息
    uploadUser(userName,imgUrl){
      if (!userName) {
        this.$message.error('用户名不能为空!');
        return;
      }
      if (!imgUrl) {
        this.$message.error('图片不能为空!');
        return;
      }
      axios.post('http://localhost:8080/web/sample/aipface/addUser', {
        gname: this.groupName,
        uname: userName,
        url:imgUrl
      })
        .then(function (response) {
          console.log(response);
        })
        .catch(function (error) {
          console.log(error);
        });
      //刷新数据
      this.closeDialog()
      this.$router.go(0)
    },
    //新建人脸 预处理
    loginImage(userName){
      this.userForm.name = userName
      this.addFaceDialogVisible = true
    },
    //为用户新加人脸
    addUserFace(userName,imgUrl){
      if (!userName) {
        this.$message.error('用户名不能为空!');
        return;
      }
      if (!imgUrl) {
        this.$message.error('图片不能为空!');
        return;
      }
      axios.post('http://localhost:8080/web/sample/aipface/addImage', {
        gname: this.groupName,
        uname: userName,
        url: imgUrl
      })
        .then(function (response) {
          console.log(response);
        })
        .catch(function (error) {
          console.log(error);
        });
      //刷新数据
      this.closeDialog()
      this.$router.go(0)
    },
    httpRequest (data) {
      let _this = this
      let rd = new FileReader() // 创建文件读取对象
      let file = data.file
      rd.readAsDataURL(file) // 文件读取装换为base64类型
      rd.onloadend = function (e) {
        _this.userForm.url = this.result // this指向当前方法onloadend的作用域
      }
    },
    preDelUser(userName){
      this.preDeleteUserName = userName
      this.delDialogVisible = true
    },
    //删除用户
    delUser(){
      this.delDialogVisible = false
      axios.delete('http://localhost:8080/web/sample/aipface/delUser?gname=' + this.groupName + '&uname=' + this.preDeleteUserName, {
      })
        .then(function (response) {
          console.log(response);
        })
        .catch(function (error) {
          console.log(error);
        });
      //刷新数据
      this.$router.go(0)
    }
  }
}
</script>
<style scoped>
</style>
