<template>
  <div class="sortlist-details">
    <mt-header>
      <a @click="back" slot="left">
        <mt-button icon="back"></mt-button>
      </a>
    </mt-header>
    <div class="list-poster">
      {{title}}
    </div>
     <ul class="detailslist">
      <li class="songitem" v-for="item in sortlist" :key="item.sid">
          <div>
            <p class="item-title">{{item.songtitle}}</p>
            <small class="item-subtitle">{{item.songsubtitle}}</small>
          </div>
          <audio :src="item.song_url | resouceFilter" class="play"></audio>
          <div>
            <span class="icon-play iconfont" @click="play($event,item.sid)"></span>
            <span :data-target="item.sid" class="icon-icon-1 iconfont" @click="addMenu(item.sid,$event)"></span>
          </div>
      </li>
    </ul>
  </div>
</template>

<script>
  import {Toast} from "mint-ui";
  export default {
    data(){
      return {
        pno: this.$route.params.pno,
        sortlist:[],
        title:"热歌榜"
      }
    },
    created(){
      this.getSortlist();
      this.getlist();
      this.changeTitle(this.pno);
    },
    methods:{
      back(){
        this.$router.go(-1);
      },
      getSortlist(){
        this.$http.get("sortlist/list",{params:{pno:this.pno}})
        .then(res=>{
          if(res.body.code == 1){
            this.sortlist = res.body.msg;
            this.$nextTick(function(){
              document.querySelector(".detailslist>.songitem").className += " actived";
            })
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
      addPlay(sid){
        this.$http.get("latestplay/isexists",{params:{sid:sid}})
        .then(res=>{
          if(res.data.code == 0){
            this.$http.get("latestplay/add",{params:{sid:sid}})
          }
        })
      },
      getlist(){
        if(window.uid){
          this.$http.get("mymenu/menulist",{params:{uid:window.uid}})
          .then(res=>{
            if(res.body.code == 1){
              var data = res.body.msg;
              data.forEach((el,i,arr)=>{
                for(var item of this.sortlist){
                  if(item.sid == el.sid){
                    document.querySelector(`.detailslist [data-target='${el.sid}']`).className +=" add";
                  }
                }
              })
            }
          })
        }
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
      },
      changeTitle(pno){
       if(pno == 1){
         this.title = "热歌榜"
       }else if(pno == 2){
          this.title = "新歌榜";
       }else if(pno == 3){
          this.title = "飙升榜";
       }else if(pno == 4){
          this.title = "潮流榜";
       }else{
          this.title = "怀旧榜";
       }
      }
    }
  }
</script>

<style>
  .sortlist-details {
    padding-top: 40px;
    height: 100%;
  }
  .sortlist-details .mint-header {
    background: rgba(0,0,0,.7);
    position: fixed;
    top:0;left:0;
    width: 100%;
  }
  .sortlist-details>.detailslist {
    padding: 0;
    margin-top: 0;
    list-style: none;
  }
  .sortlist-details .list-poster {
    height: 150px;
    background: rgba(0,0,0,.7);
    line-height: 125px;
    text-align: center;
    color: #fff;
    font-size: 32px;
  }
  .sortlist-details>.detailslist>.songitem {
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
  .sortlist-details>.detailslist>.songitem.actived {
    border-left-color: gold;
    
  }
  .sortlist-details>.detailslist>.songitem .item-title{
    color: #fff;
    font-size: 16px;
    margin-bottom: 5px;
  }
  .sortlist-details>.detailslist>.songitem .item-subtitle{
    color: rgba(255,255,255,.7);
  }
  .sortlist-details>.detailslist>.songitem>div:first-child {
    margin-top: 5px;
  }
  .sortlist-details>.detailslist>.songitem>div:last-child {
    line-height: 60px;
  }
  .sortlist-details>.detailslist>.songitem span.iconfont{
    font-size: 32px;
    color: #fff;
  }
  .sortlist-details>.detailslist>.songitem span.iconfont.icon-icon-1{
    margin-left: 50px;
  }
  .sortlist-details>.detailslist>.songitem span.iconfont.icon-icon-1.add{
    color: gold;
  }
</style>