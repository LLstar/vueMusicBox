<template>
  <div class="sortmenu-list">
    <mtHeader></mtHeader>
    <div class="sortmenu-title">
      <div class="banner-bg"></div>
      <ul class="mui-table-view">
        <li class="mui-table-view-cell mui-media">
          <a href="javascript:;">
            <img class="mui-media-object mui-pull-left" :src="titleList[this.pno-1].pic">
            <div class="mui-media-body">
              <p class="body-title">{{titleList[this.pno-1].title}}</p>
              <p class='body-subtitle'>{{titleList[this.pno-1].author}}</p>
              <p class="body-icon"><span>{{titleList[this.pno-1].keyword1}}</span><span>{{titleList[this.pno-1].keyword2}}</span><span>{{titleList[this.pno-1].keyword3}}</span></p>
            </div>
          </a>
        </li>
      </ul>
    </div>
    <ul class="single-songlist">
      <li class="songitem" v-for="item in lists" :key="item.sid">
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
  import mtHeader from '@/components/header/HeaderLogin.vue'
  import {Toast} from 'mint-ui'
  export default {
    data(){
      return {
        pno:this.$route.params.id,
        lists:[],
        titleList:[
          {title:"时间是最好的解药，治愈最坏的伤口",author:"陆仁",keyword1:"伤感",keyword2:"华语",keyword3:"流行",pic:"/img/zhiyu.jpg"},
          {title:"放空大脑专享的舒缓华语",author:"念安娜",keyword1:"治愈",keyword2:"流行",keyword3:"国语",pic:"/img/fangkong.jpg"},
          {title:"秋季特调饮品：浓醇韩系R&B",author:"smile",keyword1:"韩语",keyword2:"R&B",keyword3:"想念",pic:"/img/hanxi.jpg"},
          {title:'“点这首歌我们一起唱好不好”',author:"趵突泉边上的小屁孩",keyword1:"国语",keyword2:"流行",keyword3:"KTV热歌",pic:"/img/qianxi.jpg"},
        ],
        
      }
    },
    
    created(){
      this.getList();
      this.changeBg();
    },
    methods:{
      getList(){
        this.$http.get("sortlist/list",{params:{pno:this.pno,pageSize:10}})
        .then(res=>{
          if(res.data.code == 1){
            this.lists = res.data.msg;
            this.$nextTick(function(){
              document.querySelector(".single-songlist>.songitem").className += " actived";
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
      changeBg(){
        this.$nextTick(function(){
          document.querySelector(".banner-bg").style.backgroundImage = `url('${this.titleList[this.pno-1].pic}')`;
        })
      }
    },
    components:{
      mtHeader
    }
  }
</script>

<style>
  .sortmenu-list {
    padding-top: 40px;
    height: 100%;
  }
  .sortmenu-list .sortmenu-title {
    height: 200px;
    width: 100%;
    position: relative;
  }
  .sortmenu-list .sortmenu-title:before {
    display: table;
    content: "";
  }
  .sortmenu-list .sortmenu-title .banner-bg {
    height: 200px;
    width: 100%;
    position: absolute;
    float: left;
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
    -webkit-filter: blur(2px);
    -moz-filter: blur(2px);
    -o-filter: blur(2px);
    -ms-filter: blur(2px);
    filter: blur(2px);
  }
  .sortmenu-list .sortmenu-title .mui-table-view {
    background: rgba(255,255,255,0);
    margin-top: 20px;
  }
  .sortmenu-list .sortmenu-title .mui-table-view .mui-media .mui-media-object {
    max-width: 120px;
    height: 120px;
    line-height: 120px;
  }
  .sortmenu-list .sortmenu-title .mui-table-view .mui-media .mui-media-body {
    margin-top: 10px;
  }
  .sortmenu-list .sortmenu-title .mui-table-view .mui-media .mui-media-body .body-title {
    color:#fff;
    font-size: 20px;
    white-space: pre-wrap;
    line-height: 25px;
    font-weight: 700;
  }
  .sortmenu-list .sortmenu-title .mui-table-view .mui-media .mui-media-body .body-subtitle {
    color: #d5d5d5;
    line-height: 25px;
    margin-top: 5px;
  }
  .sortmenu-list .sortmenu-title .mui-table-view .mui-media .mui-media-body .body-icon {
    display: flex;
    justify-content: start;
    margin-top: 10px;
  }
  .sortmenu-list .sortmenu-title .mui-table-view .mui-media .mui-media-body .body-icon > span {
    display: block;
    width: 50px;
    height: 20px;
    background: rgba(255,255,255,.3);
    color: #fff;
    line-height: 20px;
    margin-right: 5px;
    text-align: center;
  }
  .sortmenu-list .sortmenu-title .mui-table-view:before,
  .sortmenu-list .sortmenu-title .mui-table-view:after,
  .sortmenu-list .sortmenu-title .mui-table-view .mui-media:after {
    height: 0;
  }

  .sortmenu-list>.single-songlist {
    padding: 0;
    margin-top: 0;
    list-style: none;
  }
  .sortmenu-list>.single-songlist>.songitem {
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
  .sortmenu-list>.single-songlist>.songitem.actived {
    border-left-color: gold;
    
  }
  .sortmenu-list>.single-songlist>.songitem .item-title{
    color: #fff;
    font-size: 16px;
    margin-bottom: 5px;
  }
  .sortmenu-list>.single-songlist>.songitem .item-subtitle{
    color: rgba(255,255,255,.7);
  }
  .sortmenu-list>.single-songlist>.songitem>div:first-child {
    margin-top: 5px;
  }
  .sortmenu-list>.single-songlist>.songitem>div:last-child {
    line-height: 60px;
  }
  .sortmenu-list>.single-songlist>.songitem span.iconfont{
    font-size: 32px;
    color: #fff;
  }
  .sortmenu-list>.single-songlist>.songitem span.iconfont.icon-icon-1{
    margin-left: 50px;
  }
  .sortmenu-list>.single-songlist>.songitem span.iconfont.icon-icon-1.add{
    color: gold;
  }
</style>