<template>
  <div class="login">
    <!--登录头部-->
    <mt-header></mt-header>
    <!--登录信息-->
    <!--注册信息-->
    <div class="login-info">
      <mt-field label="用户名" v-model="uname"></mt-field>
      <mt-field label="密码" type="password" v-model="upwd"></mt-field>
      <mt-button type="primary" size="large" @click="isLogin">登录</mt-button>
    </div>
  </div>
</template>

<script>
  import mtHeader from '@/components/header/HeaderLogin.vue'
  import {Toast} from "mint-ui"
  export default {
    data(){
      return {
        uname:"dingding",
        upwd: "123456"
      }
    },
    components: {
      mtHeader
    },
    methods:{
      isLogin(){
        this.$http.post("user/login",{uname:this.uname,upwd:this.upwd},{emulateJSON:true})
        .then(res=>{
          if(res.body.code == 1){
            window.uid = res.body.msg[0].uid;
            Toast("登录成功");
            this.$router.push("/person");
          }else{
            Toast("登录失败");
          }
        })
      }
    }
  }
</script>

<style>
  .login {
    padding-top: 40px;
  }
  .login .login-info {
    margin-top: 70px;
    height: 500px;
    padding: 0 5px;
  }
  .login .login-info .mint-cell.mint-field {
    background: rgba(255,255,255,.3);
    color: #fff;
    height: 70px;
  }
  .login .login-info .mint-cell.mint-field .mint-field-core {
    background: rgba(255,255,255,.3);
    margin-top: 15px;
    color: #000;
  }
  .login .login-info .mint-button {
    margin-top: 20px;
    background: rgba(255,255,255,.3);
    border: 1px solid gold;
    color: gold;
  }
</style>