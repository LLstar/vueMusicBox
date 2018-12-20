<template>
  <div class="latest-play-song">
    <ul class="songlist">
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
  </div>
</template>

<script>
  import {Toast} from 'mint-ui';
  export default {
    data(){
      return {
        songlist:[]
      }
    },
    created(){
      this.getMenu();
    },
    methods:{
      getMenu(){
        this.$http.get("latestplay/songlist")
        .then(res=>{
          if(res.body.code == 1){
            this.songlist = res.body.msg;
            
            this.$nextTick(function(){
                document.querySelector(".songlist>.songitem").className = "songitem actived";
            })
          }
        })
      },
      play(e){
        //点击之后播放或暂停
        if(e.target.className == "icon-play iconfont"){
          e.target.parentNode.previousElementSibling.play();
          e.target.className = "icon-pause iconfont";
        }else{
          e.target.parentNode.previousElementSibling.pause();
          e.target.className = "icon-play iconfont";
        }
        var plays=document.querySelectorAll(".play");

        for(var play of plays){
          if(play.paused == false && play!=e.target.parentNode.previousElementSibling){
            play.pause();
            play.nextElementSibling.children[0].className = "icon-play iconfont"; 
          }
        }
        //设置前面的标志线
        var lis = e.target.parentNode.parentNode.parentNode.children;
        for(var li of lis){
          li.className = "songitem";
        }
        e.target.parentNode.parentNode.className += " actived";
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
              console.log(111);
              $event.target.className += " add";
            }else{
              this.$http.post("mymenu/removemenu",{sid:id,uid:window.uid},{emulateJSON:true})
              .then(res=>{
                if(res.body.code == 1){
                  Toast("取消添加！");
                  console.log(222);
                }
              });
              console.log(222);
              $event.target.className = "icon-icon-1 iconfont";
            }
          })
        }else{
          Toast("还没登录哦！");
          this.$router.push("/login");
        }
      }
    }
  }
</script>

<style>
  .latest-play-song {
    height: 100%;
  }
  .latest-play-song>.songlist {
    padding: 0;
    margin-top: 0;
    list-style: none;
  }
  .latest-play-song>.songlist>.songitem {
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
  .latest-play-song>.songlist>.songitem.actived {
    border-left-color: gold;
  }
  .latest-play-song>.songlist>.songitem .item-title{
    color: #fff;
    font-size: 16px;
    margin-bottom: 5px;
  }
  .latest-play-song>.songlist>.songitem .item-subtitle{
    color: rgba(255,255,255,.7);
  }
  .latest-play-song>.songlist>.songitem>div:first-child {
    margin-top: 5px;
  }
  .latest-play-song>.songlist>.songitem>div:last-child {
    line-height: 60px;
  }
  .latest-play-song>.songlist>.songitem span.iconfont{
    font-size: 32px;
    color: #fff;
  }
  .latest-play-song>.songlist>.songitem span.iconfont.icon-icon-1{
    margin-left: 50px;
  }
  .latest-play-song>.songlist>.songitem span.iconfont.icon-icon-1.add{
    color: gold;
  }
</style>