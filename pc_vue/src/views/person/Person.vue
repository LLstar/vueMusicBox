<template>
  <div class="person">
    <!--第一部分导航头-->
    <mt-header-sub></mt-header-sub>
    <!--第二部分登录信息-->
    <div class="person-info" v-if="isLogin">
      <ul class="mui-table-view">
        <li class="mui-table-view-cell mui-media">
          <a href="#">
            <img class="mui-media-object mui-pull-left" :src="imgSrc | resouceFilter">
            <div class="mui-media-body">
              <p>{{title}}</p>
              <p class='mui-ellipsis'>累计听歌：{{playcount}}首</p>
            </div>
          </a>
        </li>
      </ul>
    </div>
    <!--第二部分未登录状态-->
    <div class="person-login" v-else>
      <ul class="mui-table-view">
        <li class="mui-table-view-cell mui-media">
          <a href="#">
            <span class="mui-pull-left">Hi</span>
            <div class="mui-media-body">
              <p>
                <router-link to="/login">登录</router-link>/<router-link to="/register">注册</router-link>
              </p>
              <p class='mui-ellipsis'>登录畅享高品音乐</p>
            </div>
          </a>
        </li>
      </ul>
    </div>
    <!--第三部分六宫格-->
    <ul class="mui-table-view mui-grid-view mui-grid-9">
      <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><router-link to="/localsong">
              <span class="iconfont icon-yinyue"></span>
              <div class="mui-media-body">本地音乐</div></router-link></li>
      <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><router-link to="/onload">
              <span class="iconfont icon-unie122"></span>
              <div class="mui-media-body">我的下载</div>
            </router-link></li>
      <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><router-link to="/latestplay">
              <span class="iconfont icon-zuijinbofang"></span>
              <div class="mui-media-body">最近播放</div>
              <small>{{playcount}}</small>  
            </router-link></li>
      <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><router-link to="/favorite">
              <span class="iconfont icon-shoucang1"></span>
              <div class="mui-media-body">我的收藏</div>
              <small>{{count}}</small> 
            </router-link></li>
      <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><router-link to="/mymenu">
              <span class="iconfont icon-gedan"></span>
              <div class="mui-media-body">我的歌单</div></router-link></li>
      <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><router-link to="/member">
              <span class="iconfont icon-huiyuan"></span>
              <div class="mui-media-body">会员中心</div></router-link></li>
    </ul>
    <!--发现-->
    <div class="person-find">
      <p class="find-title">发现</p>
      <ul class="mui-table-view">
        <li class="mui-table-view-cell mui-media">
          <a href="#">
            <img class="mui-media-object mui-pull-left" src="http://localhost:3001/img/person/person1.jpg">
            <div class="mui-media-body">
              <p>南城以南...</p>
              <p class='mui-ellipsis'>累计听歌：1543首</p>
            </div>
          </a>
        </li>
        <li class="mui-table-view-cell mui-media">
          <a href="#">
            <img class="mui-media-object mui-pull-left" src="http://localhost:3001/img/person/person1.jpg">
            <div class="mui-media-body">
              <p>音乐耳机</p>
              <p class='mui-ellipsis'>音乐耳机，带你听真正的无损音乐</p>
            </div>
          </a>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
  import mtHeaderSub from '@/components/header/HeaderSub.vue'
  export default {
    data(){
      return {
        isLogin: false,
        loginInfo:{},
        title:"",
        imgSrc:"img/person/person1.jpg",
        count:0,
        playcount:0
      }
    },
    components: {
      mtHeaderSub
    },
    created(){
      if(window.uid){
         this.islogin();
         this.getCount();
      }else{
        this.isLogin = false;
      }
      this.getPlayCount();
    },
    methods:{
      islogin(){
        this.$http.post("user/signin",{uid:window.uid},{emulateJSON:true})
        .then(res=>{
          if(res.body.code == 1){
            this.isLogin=true;
            this.loginInfo = res.body.msg[0];
            this.title = this.loginInfo.uname;
            this.imgSrc = this.loginInfo.avatar;
            
          }else{
            this.isLogin=false;
          }
        })
      },
      getCount(){
        //获取收藏的数量
        this.$http.get("favorite/favoriteCount",{params:{uid:window.uid}})
        .then(res=>{
          if(res.body.code == 1){
              this.count = res.body.msg[0].count;
          }
        })
      },
      getPlayCount(){
        //获得最近播放的歌曲跟视频的数量
        this.$http.get('latestplay/count')
        .then(res=>{
          if(res.data.code == 1){
            this.playcount = res.data.msg;
          }
        })
      }
    }
  }
</script>
<style>
  .person {
    padding-top: 40px;
  }
  .person>.person-info>.mui-table-view {
    background: rgba(255,255,255,.1);
    border: none;
    padding-bottom: 20px;
  }
  .person .mui-table-view:before,
  .person .mui-table-view:after,
  .person .mui-table-view>.mui-table-view-cell:after {
    height: 0;
  }
  .person>.person-info>.mui-table-view .mui-media-object {
    line-height: 70px;
    max-width: 70px;
    height: 70px;
    border-radius: 50%;
    margin-right: 20px;
  }
  .person>.person-info>.mui-table-view .mui-media-body {
    margin-top: 15px;
  }
  .person .mui-table-view .mui-media-body>p{
    color: #fff;
  }
  .person>.person-info>.mui-table-view .mui-media-body>p:first-child{
    font-size: 22px;
    font-weight: bold;
    margin-bottom: 5px;
  }
  .person .mui-table-view.mui-grid-view {
    background: rgba(255,255,255,.1);
    margin-top: 20px;
    border: none;
  }
  .person .mui-table-view.mui-grid-view .mui-table-view-cell {
    border: none;
    color: #fff;
  }
  .person .mui-table-view.mui-grid-view .mui-table-view-cell .iconfont {
    font-size: 30px;
    color: gold;
    font-weight: bold;
  }
  .person .mui-table-view.mui-grid-view .mui-table-view-cell .mui-media-body {
    color: #fff;
  }
  .person>.person-find {
      margin-top: 30px;
      background: rgba(255,255,255,.1);
      padding: 10px 0;
  }
  .person>.person-find>.mui-table-view {
    background: rgba(255,255,255,0);
    border: none;
  }
  .person>.person-find>.find-title {
    margin: 0;
    margin-left: 15px;
    color: #fff;
    font-weight: bold;
  }
  .person>.person-find .mui-media-body>p.mui-ellipsis {
    color: #ccc;
  }
  .person>.person-login>.mui-table-view {
    background: rgba(255,255,255,.1);
  }
  .person>.person-login>.mui-table-view>.mui-table-view-cell span.mui-pull-left {
    width: 70px;
    height: 70px;
    line-height: 70px;
    text-align: center;
    background: rgba(255,255,255,.4);
    border-radius: 50%;
    margin-right: 20px;
    font-size: 32px;
    color: #fff;
    font-weight: bold;
  }
  .person>.person-login>.mui-table-view>.mui-table-view-cell .mui-media-body {
    margin-top: 15px;
  }
  .person>.person-login>.mui-table-view>.mui-table-view-cell .mui-media-body>p:first-child {
    font-size: 24px;
    margin-bottom: 5px;
  }
  .person>.person-login>.mui-table-view>.mui-table-view-cell .mui-media-body>p:first-child>a {
    color: #fff;
  }
  .isShow {
    display: none;
  }
</style>