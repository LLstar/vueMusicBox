<template>
  <div class="mv-list">
    <mt-header fixed title="MV专区">
      <a @click="back" slot="left">
        <mt-button icon="back"></mt-button>
      </a>
    </mt-header>
    <div class="mv-video" v-for="item in list" :key="item.mid">
      <video :src="item.mv_url | resouceFilter" loop :poster="item.poster | resouceFilter" preload="metadata" controls class="playvedio" :data-mid="item.mid">您的浏览器版本太低，请升级！</video>
      <p class="mv-title">{{item.title}}</p>
      <p class="mv-info">
        <span class="mv-detail"><img :src="item.avatar  | resouceFilter"> {{item.name}}</span>
        <span class="iconfont icon-zan1" @click="change">{{item.zan}}</span>
      </p>
    </div>
  </div>
</template>

<script>

  export default {
    data(){
      return {
        list:[],
        pno:1,
        pageSize:8
      }
    },
    created(){
      this.getMVlist();
    },
    methods:{
      back(e){
        e.preventDefault();
        this.$router.go(-1);
      },
      getMVlist(){
        this.$http.get('mvlist/mvlist',{params:{pno:this.pno,pageSize:this.pageSize}})
        .then(res=>{
          if(res.body.code == 1){
            this.list = res.body.msg;
             this.$nextTick(()=>{
               //遍历获得的视频，当视频播放时判断是否存在该视频，不存在则添加到最近播放列表中，否则不添加
              var vedio = document.querySelectorAll(".playvedio");
              for(var item of vedio){
                item.onplay=(e)=>{
                  var mid = e.target.dataset.mid;
                  this.$http.get('latestplay/isvedio',{params:{mid:mid}})
                  .then(res=>{
                    if(res.data.code == 1){
                      console.log("已经存在啦");
                    }else{
                      this.$http.get('latestplay/addvedio',{params:{mid:mid}})
                      .then(res=>{
                        if(res.data.code == 1){
                          console.log("添加成功");
                        }
                      })
                    }
                  })
                  //console.log(mid);
                }
              }
            })
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
      loadMore(){
        this.loading = true;
        setTimeout(()=>{
          this.pno++;
          this.getMVlist();
        },2500);
        this.loading = false;
      }
    }
  }
</script>

<style>
 .mv-list {
   height: 100%;
   padding-top: 40px;
 }
 .mv-list .mint-header {
    background: #647077;
    font-size: 16px;
  }
  .mv-list .mv-video {
    background: rgba(255,255,255,.1);
    padding: 10px 0;
    margin: 10px 0;
    position: relative;
  }
  
  .mv-list .mv-video video{
    width: 90%;
    height:200px;
    margin: 0 auto;
    display: block;
  }
  .mv-list .mv-title {
    padding-left: 30px;
    font-size: 16px;
    color: #fff;
    margin: 0;
    margin-top: 15px;
  }
  .mv-list .mv-info {
    display: flex;
    justify-content: space-between;
    padding: 0 30px 0 30px;
    margin: 0;
    margin-top: 10px;
    color: #fff;
    height: 30px;
    line-height: 30px;
  }
  .mv-list .mv-info .mv-detail {
    display: flex;
    justify-content: start;
    height: 30px;
    line-height: 30px;
  }
  .mv-list .mv-info .mv-detail > img {
    width: 30px;
    height: 30px;
    border-radius: 50%;
    margin-right: 10px;
  }
  .mv-list .mv-info .iconfont.icon-zan1,
  .mv-list .mv-info .iconfont.icon-shou {
    font-size: 14px;
  }
  .mv-list .mv-info .iconfont.icon-zan1:before {
    font-size: 18px;
  }
  .mv-list .mv-info .iconfont.icon-shou:before {
    color: gold;
    font-size: 18px;
  }
</style>