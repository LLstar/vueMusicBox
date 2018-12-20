<template>
  <div class="single-song">
    <ul class="single-songlist" id="singleList">
      <li class="songitem" v-for="infos in infolist" :key="infos.sid">
          <div>
            <p class="item-title">{{infos.songtitle}}</p>
            <small class="item-subtitle">{{infos.songsubtitle}}</small>
          </div>
          <audio :src="infos.song_url | resouceFilter" class="play"></audio>
          <div>
            <span class="icon-play iconfont" @click="play($event,infos.sid)" ></span>
            <span :data-target="infos.sid" class="icon-icon-1 iconfont" @click="addMenu(infos.sid,$event)"></span>
          </div>
      </li>
    </ul>
  </div>
</template>

<script>
  import {Toast} from 'mint-ui'
  export default {
    data(){
      return {
        infolist:[]
      }
    },
    created(){
      this.getInfo();
      this.getlist();
    },
    methods:{
      getlist(){
        if(window.uid){
          this.$http.get("mymenu/menulist",{params:{uid:window.uid}})
          .then(res=>{
            if(res.body.code == 1){
              var data = res.body.msg;
              data.forEach((el,i,arr)=>{
                for(var info of this.infolist){
                  if(info.sid == el.sid){
                    document.querySelector(`#singleList [data-target='${el.sid}']`).className +=" add";
                  }
                }
              })
            }
          })
        }
      },
      getInfo(){
        this.$http.get("songs/songlist",{params:{gid:this.id}})
        .then(res=>{
          if(res.body.code == 1){
            this.infolist = res.body.msg;
            var ul = document.getElementById("singleList");
            this.$nextTick(function(){
              var li = document.querySelector("#singleList>li");
              li.className += " actived";
            })
          }
        })
        
      },
      play($event,sid){
        //点击之后播放或暂停
        if($event.target.className == "icon-play iconfont"){
          $event.target.parentNode.previousElementSibling.play();
          $event.target.className = "icon-pause iconfont";
          //当播放时的时候，调用该函数，添加到最近播放列表中
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
      }
    },
    props:["id"]
  }
</script>

<style>
  .single-song>.single-songlist {
    padding: 0;
    margin-top: 0;
    list-style: none;
  }
  .single-song>.single-songlist>.songitem {
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
  .single-song>.single-songlist>.songitem.actived {
    border-left-color: gold;
    
  }
  .single-song>.single-songlist>.songitem .item-title{
    color: #fff;
    font-size: 16px;
    margin-bottom: 5px;
  }
  .single-song>.single-songlist>.songitem .item-subtitle{
    color: rgba(255,255,255,.7);
  }
  .single-song>.single-songlist>.songitem>div:first-child {
    margin-top: 5px;
  }
  .single-song>.single-songlist>.songitem>div:last-child {
    line-height: 60px;
  }
  .single-song>.single-songlist>.songitem span.iconfont{
    font-size: 32px;
    color: #fff;
  }
  .single-song>.single-songlist>.songitem span.iconfont.icon-icon-1{
    margin-left: 50px;
  }
  .single-song>.single-songlist>.songitem span.iconfont.icon-icon-1.add{
    color: gold;
  }
</style>