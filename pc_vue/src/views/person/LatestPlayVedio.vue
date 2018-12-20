<template>
  <div class="latest-play-song">
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
        list: []
      }
    },
    created(){
      this.getList();
      
    },
    mounted(){
      
    },
    methods:{
      getList(){
        this.$http.get('latestplay/vediolist')
        .then(res=>{
          if(res.data.code == 1){
            this.list = res.data.msg;
           
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
      },
    }
  }
</script>

<style>
  .latest-play-song .mv-video {
    background: rgba(255,255,255,.1);
    padding: 10px 0;
    margin: 10px 0;
    position: relative;
  }
  
  .latest-play-song .mv-video video{
    width: 90%;
    height:200px;
    margin: 0 auto;
    display: block;
  }
  .latest-play-song .mv-title {
    padding-left: 30px;
    font-size: 16px;
    color: #fff;
    margin: 0;
    margin-top: 15px;
  }
  .latest-play-song .mv-info {
    display: flex;
    justify-content: space-between;
    padding: 0 30px 0 30px;
    margin: 0;
    margin-top: 10px;
    color: #fff;
    height: 30px;
    line-height: 30px;
  }
  .latest-play-song .mv-info .mv-detail {
    display: flex;
    justify-content: start;
    height: 30px;
    line-height: 30px;
  }
  .latest-play-song .mv-info .mv-detail > img {
    width: 30px;
    height: 30px;
    border-radius: 50%;
    margin-right: 10px;
  }
  .latest-play-song .mv-info .iconfont.icon-zan1,
  .latest-play-song .mv-info .iconfont.icon-shou {
    font-size: 14px;
  }
  .latest-play-song .mv-info .iconfont.icon-zan1:before {
    font-size: 18px;
  }
  .latest-play-song .mv-info .iconfont.icon-shou:before {
    color: gold;
    font-size: 18px;
  }
</style>