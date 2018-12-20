<template>
  <div class="mymenu">
    <mt-header></mt-header>
    <ul class="mymenulist" v-if="mymenu">
      <li class="songitem" v-for="menu in menulist" :key="menu.sid">
          <div>
            <p class="item-title">{{menu.songtitle}}</p>
            <small class="item-subtitle">{{menu.songsubtitle}}</small>
          </div>
          <audio :src="menu.song_url | resouceFilter" class="play"></audio>
          <div>
            <span class="icon-play iconfont" @click="play($event,menu.sid)"></span>
            <span class="icon-icon-1 iconfont add"></span>
          </div>
      </li>
    </ul>
    <div v-else class="collection">
      <i>(◕ᴗ◕✿)</i>
      <b>还没有歌曲，快去添加吧！</b>
    </div>
  </div>
</template>

<script>
  import mtHeader from '@/components/header/HeaderLogin.vue'
  export default {
    data(){
      return {
        mymenu:true,
        menulist:[]
      }
    },
    components: {
      mtHeader
    },
    created(){
      this.getMenu();
      
    },
    methods:{
      getMenu(){
        if(window.uid){
          this.isfavorite=true;
          this.$http.get("mymenu/menulist",{params:{uid:window.uid}})
          .then(res=>{
            if(res.body.code == 1){
              this.menulist = res.body.msg;
              this.$nextTick(function(){
                 document.querySelector(".mymenulist>.songitem").className = "songitem actived";
              })
            }
          })
        }else{
          this.mymenu = false;
        }
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
      addPlay(sid){
        this.$http.get("latestplay/isexists",{params:{sid:sid}})
        .then(res=>{
          if(res.data.code == 0){
            this.$http.get("latestplay/add",{params:{sid:sid}})
          }
        })
      }
    }
    
  }
</script>

<style>
  .mymenu{
    padding-top: 40px;
    height: 100%;
  }
  .mymenu>.mymenulist {
    padding: 0;
    margin-top: 0;
    list-style: none;
  }
  .mymenu>.mymenulist>.songitem {
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
  .mymenu>.mymenulist>.songitem.actived {
    border-left-color: gold;
    
  }
  .mymenu>.mymenulist>.songitem .item-title{
    color: #fff;
    font-size: 16px;
    margin-bottom: 5px;
  }
  .mymenu>.mymenulist>.songitem .item-subtitle{
    color: rgba(255,255,255,.7);
  }
  .mymenu>.mymenulist>.songitem>div:first-child {
    margin-top: 5px;
  }
  .mymenu>.mymenulist>.songitem>div:last-child {
    line-height: 60px;
  }
  .mymenu>.mymenulist>.songitem span.iconfont{
    font-size: 32px;
    color: #fff;
  }
  .mymenu>.mymenulist>.songitem span.iconfont.icon-icon-1{
    margin-left: 50px;
  }
  .mymenu>.mymenulist>.songitem span.iconfont.icon-icon-1.add{
    color: gold;
  }
  .mymenu .collection {
    margin-top: 50px;
    text-align: center;
    height: 478px;
  }
  .mymenu .collection i{
    display: block;
    margin: 0 auto;
    font-style: normal;
    color:  #fff;
  }

  .mymenu .collection b {
    font-weight: normal;
    margin-top: 10px;
    display: block;
    color: #fff;
  }
 
</style>