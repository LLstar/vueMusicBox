<template>
  <div class="sing-song">
    <mt-header fixed title="唱歌">
      <a @click="back" slot="left">
        <mt-button icon="back"></mt-button>
      </a>
    </mt-header>

    <h2>亲，暂未开放此功能</h2>
    <p>{{time}}s后返回首页</p>
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
        this.$router.push("/home");
      },
      goHome(){
        setInterval(()=>{
          this.time--;
        },1000)
        setTimeout(()=>{
          this.$router.push('/home');
        },5000)
      }
    }
  }
</script>

<style>
 .sing-song {
   height: 600px;
   padding-top: 40px;
 }
 .sing-song .mint-header {
    background: #647077;
    font-size: 16px;
  }
  .sing-song h2 {
    position: absolute;
    top: 50%;
    left: 50%;
    margin-top: -85px;
    margin-left: -130px;
    color: #fff;
  }
  .sing-song p {
    position: absolute;
    top: 50%;
    left: 50%;
    margin-top: -30px;
    margin-left: -60px;
    color: gold;
    font-size: 20px;
  }
</style>