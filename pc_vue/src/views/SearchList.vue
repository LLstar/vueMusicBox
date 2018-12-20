<template>
  <div class="searchList">
    <mtHeader></mtHeader>
    <ul class="songlist" v-if="isShow">
      <li class="songitem" v-for="menu in songlist" :key="menu.sid">
          <div>
            <p class="item-title">{{menu.songtitle}}</p>
            <small class="item-subtitle">{{menu.songsubtitle}}</small>
          </div>
          <audio :src="menu.song_url | resouceFilter" class="play"></audio>
          <div>
            <span class="icon-play iconfont" @click="play"></span>
            <span :data-target="menu.sid" class="icon-icon-1 iconfont" @click="addMenu(menu.sid,$event)"></span>
          </div>
      </li>
    </ul>
    <div v-else class="searchList-detail">
      没有找到与"{{this.value}}"相关的结果,换个词再试试？
    </div>
  </div>
</template>

<script>
  import mtHeader from '@/components/header/HeaderLogin.vue'
  import {Toast} from 'mint-ui'
  export default {
    data(){
      return {
        isShow: true,
        songlist:[],
        value:this.$route.params.value
      }
    },
    created(){
      this.Search();
    },
    methods:{
      Search(){
        this.$http.get('search',{params:{kw:this.value}})
        .then(res=>{
          if(res.data.code == 1){
            this.songlist = res.data.msg;
            this.$nextTick(function(){
                document.querySelector(".songlist>.songitem").className = "songitem actived";
            })
          }else{
            this.isShow = false;
          }
        })
      },
      play($event,sid){
        //点击之后播放或暂停
        if($event.target.className == "icon-play iconfont"){
          $event.target.parentNode.previousElementSibling.play();
          $event.target.className = "icon-pause iconfont";
          this.addPlay(sid);
        }else{
          $event.target.parentNode.previousElementSibling.pause();
          $event.target.className = "icon-play iconfont";
        }
        var plays=document.querySelectorAll(".play");

        for(var play of plays){
          if(play.paused == false && play!=$event.target.parentNode.previousElementSibling){
            play.pause();
            play.nextElementSibling.children[0].className = "icon-play iconfont";
            
          }
        }
        //设置前面的标志线
        var lis = $event.target.parentNode.parentNode.parentNode.children;
        for(var li of lis){
          li.className = "songitem";
        }
        $event.target.parentNode.parentNode.className += " actived";
      },
      addMenu(id,$event){
        if(window.uid){
          //添加到我的歌单
          this.$http.get("mymenu/haslist",{params:{uid:window.uid,sid:id}})
          .then(res=>{
            if(res.body.code == 0){
              this.$http.post("mymenu/addmenu",{sid:id,uid:window.uid},{emulateJSON:true})
              .then(res=>{
                if(res.body.code == 1){
                  Toast("添加到我的歌单！");
                }
              });
              $event.target.className += " add";
            }else{
              this.$http.post("mymenu/removemenu",{sid:id,uid:window.uid},{emulateJSON:true})
              .then(res=>{
                if(res.body.code == 1){
                  Toast("取消添加！");
                }
              });
              $event.target.className = "icon-icon-1 iconfont";
            }
          })
        }else{
          Toast("还没登录哦！");
          this.$router.push("/login");
        }
      },
      addPlay(sid){
        this.$http.get("latestplay/isexists",{params:{sid:sid}})
        .then(res=>{
          if(res.data.code == 0){
            this.$http.get("latestplay/add",{params:{sid:sid}})
          }
        })
      }
    },
    components:{
      mtHeader
    }
  }
</script>

<style>
  .searchList {
    padding-top: 40px;
    height: 600px;
  }
  .searchList>.songlist {
    padding: 0;
    margin-top: 0;
    list-style: none;
  }
  .searchList>.songlist>.songitem {
    bakcground: rgba(255,255,255,0);
    width: 100%;
    height: 60px;
    display: flex;
    justify-content: space-between;
    padding-left: 15px;
    padding-right: 15px;
    margin-top: 10px;
    border-left: 5px solid transparent;
  }
  .searchList>.songlist>.songitem.actived {
    border-left-color: gold;
  }
  .searchList>.songlist>.songitem .item-title{
    color: #fff;
    font-size: 16px;
    margin-bottom: 5px;
  }
  .searchList>.songlist>.songitem .item-subtitle{
    color: rgba(255,255,255,.7);
  }
  .searchList>.songlist>.songitem>div:first-child {
    margin-top: 5px;
  }
  .searchList>.songlist>.songitem>div:last-child {
    line-height: 60px;
  }
  .searchList>.songlist>.songitem span.iconfont{
    font-size: 32px;
    color: #fff;
  }
  .searchList>.songlist>.songitem span.iconfont.icon-icon-1{
    margin-left: 50px;
  }
  .searchList>.songlist>.songitem span.iconfont.icon-icon-1.add{
    color: gold;
  }
  .searchList .searchList-detail {
    height: 50px;
    color: #fff;
    width: 75%;
    margin: 0 auto;
    position: absolute;
    top: 50%;
    margin-top: -66px;
    margin-left: 46px;
    text-align: center;
    font-size: 18px;
    line-height: 28px;
  }
</style>