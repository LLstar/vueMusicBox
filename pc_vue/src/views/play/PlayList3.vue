<template>
  <div class="play-detail">
    <div class="mv-video" v-for="item in list">
      <video :src="item.mv_url | resouceFilter" loop :poster="item.poster | resouceFilter" preload="metadata" controls>您的浏览器版本太低，请升级！</video>
      <p class="mv-title">{{item.title}}</p>
      <p class="mv-info">
        <span class="mv-detail"><img :src="item.avatar | resouceFilter"> {{item.name}}</span>
        <span class="iconfont icon-zan1" @click="change">{{item.zan}}</span>
      </p>
    </div>
  </div>
</template>

<script>

  export default {
    data(){
      return {
        pno:5,
        list:[],
        pageSize:8
      }
    },
    created(){
      this.getMVlist();
    },
    methods:{
      back(e){
        e.preventDefault();
        this.$router.push("/home");
      },
      getMVlist(){
        this.$http.get('mvlist/mvlist',{params:{pno:this.pno,pageSize:this.pageSize}})
        .then(res=>{
          if(res.body.code == 1){
            this.list = res.body.msg;
          }
        })
      },
      change(e){
       if(e.target.className == "iconfont icon-shou"){
          e.target.className = "iconfont icon-zan1";
          e.target.innerHTML = parseInt(e.target.innerHTML)-1;
       }else{
          e.target.className = "iconfont icon-shou";
          e.target.innerHTML = parseInt(e.target.innerHTML)+1;
       }
      }
    },
    props:["id"]
  }
</script>

<style>
 .play-detail {
   height: 100%;
 }
 .play-detail .mint-header {
    background: #647077;
    font-size: 16px;
  }
  .play-detail .mv-video {
    background: rgba(255,255,255,.1);
    padding: 10px 0;
    margin: 10px 0;
    position: relative;
  }
  
  .play-detail .mv-video video{
    width: 90%;
    height:200px;
    margin: 0 auto;
    display: block;
  }
  .play-detail .mv-title {
    padding-left: 30px;
    font-size: 16px;
    color: #fff;
    margin: 0;
    margin-top: 15px;
  }
  .play-detail .mv-info {
    display: flex;
    justify-content: space-between;
    padding: 0 30px 0 30px;
    margin: 0;
    margin-top: 10px;
    color: #fff;
    height: 30px;
    line-height: 30px;
  }
  .play-detail .mv-info .mv-detail {
    display: flex;
    justify-content: start;
    height: 30px;
    line-height: 30px;
  }
  .play-detail .mv-info .mv-detail > img {
    width: 30px;
    height: 30px;
    border-radius: 50%;
    margin-right: 10px;
  }
  .play-detail .mv-info .iconfont.icon-zan1,
  .play-detail .mv-info .iconfont.icon-shou {
    font-size: 14px;
  }
  .play-detail .mv-info .iconfont.icon-zan1:before {
    font-size: 18px;
  }
  .play-detail .mv-info .iconfont.icon-shou:before {
    color: gold;
    font-size: 18px;
  }
</style>