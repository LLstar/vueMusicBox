<template>
  <div class="radio-detail">
    <mtHeader></mtHeader>
    <div class="sortmenu-title">
      <div class="banner-bg"></div>
      <ul class="mui-table-view">
        <li class="mui-table-view-cell mui-media">
          <a href="javascript:;">
            <img class="mui-media-object mui-pull-left" :src="titleList[this.id-1].pic">
            <div class="mui-media-body">
              <p class="body-title">{{titleList[this.id-1].title}}</p>
              <p class='body-subtitle'>{{titleList[this.id-1].author}}</p>
              <p class="body-icon"><span>{{titleList[this.id-1].keyword1}}</span><span>{{titleList[this.id-1].keyword2}}</span><span>{{titleList[this.id-1].keyword3}}</span></p>
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
            <span class="icon-play iconfont" @click="play"></span>
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
        id:this.$route.params.id,
        lists:[],
        titleList:[
          {title:"每个90后都有一份关于林俊杰的回忆",author:"陆川",keyword1:"治愈",keyword2:"华语",keyword3:"流行",pic:"http://localhost:3001/img/singer/singer1.jpg"},{},
          {title:"最全周杰伦歌曲！一代人的青春记忆",author:"念安娜",keyword1:"回忆",keyword2:"流行",keyword3:"国语",pic:"http://localhost:3001/img/singer/singer3.jpg"},{},
          {title:"单曲循环，邓紫棋精美歌曲",author:"smile",keyword1:"国语",keyword2:"R&B",keyword3:"想念",pic:"http://localhost:3001/img/singer/singer5.jpg"}
        ],
        
      }
    },
    
    created(){
      this.getList();
      this.changeBg();
    },
    methods:{
      getList(){
        this.$http.get("songs/songlist",{params:{gid:this.id}})
        .then(res=>{
          if(res.data.code == 1){
            this.lists = res.data.msg;
            this.$nextTick(function(){
              document.querySelector(".single-songlist>.songitem").className += " actived";
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
      },
      changeBg(){
        this.$nextTick(function(){
          document.querySelector(".banner-bg").style.backgroundImage = `url('${this.titleList[this.id-1].pic}')`;
        })
      }
      
     
    },
    components:{
      mtHeader
    }
  }
</script>

<style>
  .radio-detail {
    padding-top: 40px;
    height: 100%;
  }
  .radio-detail .sortmenu-title {
    height: 200px;
    width: 100%;
    position: relative;
  }
  .radio-detail .sortmenu-title:before {
    display: table;
    content: "";
  }
  .radio-detail .sortmenu-title .banner-bg {
    height: 203px;
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
    margin-top: -3px;
  }
  .radio-detail .sortmenu-title .mui-table-view {
    background: rgba(255,255,255,0);
    margin-top: 20px;
  }
  .radio-detail .sortmenu-title .mui-table-view .mui-media .mui-media-object {
    max-width: 120px;
    height: 120px;
    line-height: 120px;
  }
  .radio-detail .sortmenu-title .mui-table-view .mui-media .mui-media-body {
    margin-top: 10px;
  }
  .radio-detail .sortmenu-title .mui-table-view .mui-media .mui-media-body .body-title {
    color:#fff;
    font-size: 20px;
    white-space: pre-wrap;
    line-height: 25px;
    font-weight: 700;
  }
  .radio-detail .sortmenu-title .mui-table-view .mui-media .mui-media-body .body-subtitle {
    color: #d5d5d5;
    line-height: 25px;
    margin-top: 5px;
  }
  .radio-detail .sortmenu-title .mui-table-view .mui-media .mui-media-body .body-icon {
    display: flex;
    justify-content: start;
    margin-top: 10px;
  }
  .radio-detail .sortmenu-title .mui-table-view .mui-media .mui-media-body .body-icon > span {
    display: block;
    width: 50px;
    height: 20px;
    background: rgba(255,255,255,.3);
    color: #fff;
    line-height: 20px;
    margin-right: 5px;
    text-align: center;
  }
  .radio-detail .sortmenu-title .mui-table-view:before,
  .radio-detail .sortmenu-title .mui-table-view:after,
  .radio-detail .sortmenu-title .mui-table-view .mui-media:after {
    height: 0;
  }

  .radio-detail>.single-songlist {
    padding: 0;
    margin-top: 0;
    list-style: none;
  }
  .radio-detail>.single-songlist>.songitem {
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
  .radio-detail>.single-songlist>.songitem.actived {
    border-left-color: gold;
    
  }
  .radio-detail>.single-songlist>.songitem .item-title{
    color: #fff;
    font-size: 16px;
    margin-bottom: 5px;
  }
  .radio-detail>.single-songlist>.songitem .item-subtitle{
    color: rgba(255,255,255,.7);
  }
  .radio-detail>.single-songlist>.songitem>div:first-child {
    margin-top: 5px;
  }
  .radio-detail>.single-songlist>.songitem>div:last-child {
    line-height: 60px;
  }
  .radio-detail>.single-songlist>.songitem span.iconfont{
    font-size: 32px;
    color: #fff;
  }
  .radio-detail>.single-songlist>.songitem span.iconfont.icon-icon-1{
    margin-left: 50px;
  }
  .radio-detail>.single-songlist>.songitem span.iconfont.icon-icon-1.add{
    color: gold;
  }
</style>