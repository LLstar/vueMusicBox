<template>
  <div class="member">
    <mt-header fixed title="会员中心">
      <a @click="back" slot="left">
        <mt-button icon="back"></mt-button>
      </a>
    </mt-header>

    <h2>亲，暂未开放此功能</h2>
    <p>{{time}}s后返回个人中心</p>
  </div>
</template>

<script>

  export default {
    data(){
      return {
        time:5
      }
    },
    created(){
      this. goHome();
    },
    methods:{
      back(e){
        e.preventDefault();
        this.$router.push("/person");
      },
      goHome(){
        setInterval(()=>{
          this.time--;
        },1000)
        setTimeout(()=>{
          this.$router.go('/person');
        },5000)
      }
    }
  }
</script>

<style>
 .member {
   height: 600px;
   padding-top: 40px;
 }
 .member .mint-header {
    background: #647077;
    font-size: 16px;
  }
  .member h2 {
    position: absolute;
    top: 50%;
    left: 50%;
    margin-top: -85px;
    margin-left: -130px;
    color: #fff;
  }
  .member p {
    position: absolute;
    top: 50%;
    left: 50%;
    margin-top: -30px;
    margin-left: -73px;
    color: gold;
    font-size: 20px;
  }
</style>