<template>
  <div class="register">
    <!--注册头部-->
    <mt-header></mt-header>
    <!--注册信息-->
    <div class="register-info">
      <mt-field label="用户名" placeholder="Input username" :state="nameState" v-model="uname"></mt-field>
      <mt-field label="密码" placeholder="Input password" :state="pwdState" type="password" v-model="upwd"></mt-field>
      <mt-field type="text" v-model="avatar"></mt-field>
      <div class="register-avatar">
        <span class="avatar-left">更换头像</span>
        <div class="avatar-right">
          <img id="avatarImg" :src="chaAvatar" width="80" height="80" alt="点击更换头像" accept="image/*">
          <input type="file" id="avatarInput" @change="changeAvatar" name="mypic" ref="fileUpload" capture="camera">
        </div>
      </div> 
      <mt-button type="primary" size="large" @click="addInfo">注册</mt-button>
    </div>
  </div>
</template>

<script>
  import mtHeader from '@/components/header/HeaderLogin.vue'
  import axios from 'axios';
  import {Toast} from "mint-ui"
  export default {
    data(){
      return {
        uname:"",
        upwd:"",
        avatar:"/img/bg1.jpg",
        chaAvatar:"/img/bg1.jpg",
        nameState: "",
        pwdState:""
      }
    },
    components: {
      mtHeader
    },
    created(){

    },
    methods:{
      addInfo(){
        
        this.$http.post("user/register",{uname:this.uname,upwd:this.upwd,avatar:this.avatar},{emulateJSON:true})
        .then(res=>{
          if(res.body.code == 1){
            Toast("注册成功，去登录吧！");
            this.$router.push("/login");

          }else{
            Toast("注册失败！");
          }
        })
      },
      changeAvatar(e){
          var form = new FormData();
          form.append('mypic',this.$refs.fileUpload.files[0]);
          
          axios({
              method:'post',
              url:'http://localhost:3001/user/upload',
              anync:true,
              contentType:false,
              processData:false,
              data:form
          }).then((res)=>{
              if(res.data.code == 1){
                this.avatar = res.data.msg;
              }
          })

          let $target = e.target || e.srcElement
          let file = $target.files[0];
          //console.log(file.name.indexOf(".jpg"));
          if(file.name.indexOf(".jpg")!=-1 || file.name.indexOf(".png")!=-1 || file.name.indexOf(".gif") !=-1 || file.name.indexOf(".jpeg") !=-1){
            this.avatar = file.name;
            console.log(this.avatar);
            var reader = new FileReader()
            reader.onload = (data) => {
              let res = data.target || data.srcElement
              this.chaAvatar = res.result
            }
            reader.readAsDataURL(file)
          }else{
            Toast("图片的格式不正确");
          }  
      }
    },
    watch:{
      uname(){
        var regName = /^\w|[\u4e00-\u9fa5]{1,}$/i;
        if(!regName.test(this.uname)){
          this.nameState = "error";
          return;
        }else {
          this.nameState = "success";
        }
      },
      upwd(){
        var regPwd = /^\w{6,12}$/i;
        if(!regPwd.test(this.upwd)){
          this.pwdState = "error";
          return;
        }else {
          this.pwdState = "success";
        }
      }
    }
  }
</script>

<style>
  .register {
    padding-top: 40px;
  }
  .register .register-info {
    margin-top: 70px;
    height: 500px;
    padding: 0 5px;
  }
  .register .register-info .mint-cell.mint-field {
    background: rgba(255,255,255,.3);
    color: #fff;
    height: 70px;
  }
  .register .register-info .mint-cell.mint-field .mint-field-core {
    background: rgba(255,255,255,.3);
    margin-top: 15px;
    color: #000;
  }
  .register .register-info .mint-button {
    margin-top: 20px;
    background: rgba(255,255,255,.3);
    border: 1px solid gold;
    color: gold;
  }
  .register .register-avatar {
    height: 100px;
    background: rgba(255,255,255,.3);
    position: relative;
    display: flex;
    justify-content: start;
  }
  .register .register-info .is-nolabel {
    display:none;
  }
  .register .register-avatar .avatar-left{
    display: block;
    width: 120px;
    height: 100px;
    line-height: 100px;
    color: #fff;
    padding-left: 10px;
    font-size: 16px;
  }
  .register .register-avatar .avatar-right{
    position: relative;
  }
  .register .register-avatar #avatarImg {
    position: absolute;
    left: 0;
    top: 0;
    z-index:9;
  }
  .register .register-avatar input[type="file"] {
    width: 80px;
    height: 80px;
    position: absolute;
    left: 0;
    top: 0;
    z-index: 10;
    opacity: 0;
  }
  
</style>