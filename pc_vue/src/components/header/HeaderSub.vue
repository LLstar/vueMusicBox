<template>
  <div class="headerSub">
    <header class="mui-bar mui-bar-nav">  
      <a href="javascript:;" class="mui-icon mui-action-menu mui-icon-bars mui-pull-left"  @click="showMenu"></a>
      <a class="mui-icon mui-icon-extra mui-icon-extra-custom mui-pull-right"></a>
    </header>
    <!-- 侧边栏 -->
    <div class='menuCover' @click='toggleMenu'></div>
    <div class='sideBar'>
      <!--头部登录和未登录状态-->
      <div class="sideBar-title">
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
                    <router-link to="/login">登录/</router-link><router-link to="/register">注册</router-link>
                  </p>
                </div>
              </a>
            </li>
          </ul>
        </div>
      </div>
      <!--列表项-->
      <ul class='menu'>
        <router-link to="/pifu" class='menu-item'>
          <span class="iconfont icon-pifu"></span>
          <span class="menu-item-title">个性皮肤</span>
        </router-link>
        <router-link to="/member" class='menu-item'>
          <span class="iconfont icon-huiyuan"></span>
          <span class="menu-item-title">会员中心</span>
        </router-link>
        <router-link to="/notfound" class='menu-item'>
          <span class="iconfont icon-icon--"></span>
          <span class="menu-item-title">彩铃专区</span>
        </router-link>
        <router-link to="/notfound" class='menu-item'>
          <span class="iconfont icon-saoyisao"></span>
          <span class="menu-item-title">扫一扫</span>
        </router-link>
        <router-link to="/aboutme" class='menu-item'>
          <span class="iconfont icon-denglu"></span>
          <span class="menu-item-title">关于我们</span>
        </router-link>
      </ul>
      <!--底部菜单-->
      <nav class="headerSub-bottomNav">
        <router-link class="bottomNav" to="/problem">
          <span class="iconfont icon-fankui"></span>
          <span class="bottomNav-title">反馈</span>
        </router-link>
        <router-link class="bottomNav" to="/songlist">
          <span class="iconfont icon-shezhi"></span>
          <span class="bottomNav-title">设置</span>
        </router-link>
        <a class="bottomNav" href="javascript:;">
          <span class="iconfont icon-h"></span>
          <span class="bottomNav-title" @click="loginout">退出</span>
        </a>
      </nav>
    </div>
  </div>
</template>

<script>

  export default {
    data(){
      return {
        isLogin: true,
        title:"",
        imgSrc:"img/person/person1.jpg",
        loginInfo:{},
        count:0,
        playcount:0
      }
    },
    created(){
      if(window.uid){
         this.islogin();
      }else{
        this.isLogin = false;
      }
      this.getPlayCount();
    },
    methods:{
      toggleMenu(e){
        e.currentTarget.style.display = "none";
        e.currentTarget.nextElementSibling.style.left = "-300px";
        
      },
      showMenu(e){
        //e.currentTarget只选中当前点击的元素，不继承父元素的点击事件，也不冒泡
        e.currentTarget.parentElement.nextElementSibling.style.display = "block";
        //document.querySelector(".menuCover").style.display = "block";
        e.currentTarget.parentElement.nextElementSibling.nextElementSibling.style.left = 0;
      },
      islogin(){
        this.$http.post("user/signin",{uid:window.uid},{emulateJSON:true})
        .then(res=>{
          if(res.body.code == 1){
            this.isLogin=true;
            this.loginInfo = res.body.msg[0];
            this.imgSrc = this.loginInfo.avatar;
            this.title = this.loginInfo.uname;
            
          }else{
            this.isLogin=false;
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
      },
      loginout(){
        if(window.uid){
          window.uid = 0;
          this.isLogin = false;
        }
      },
      changeBg(){
        document.querySelector(".sideBar").style.backgroundImage = `url(${this.$store.getters.optBgUrl})`;
      }
    },
    mounted(){
      this.changeBg();
    }
  }
</script>

<style>
  .headerSub .mui-bar.mui-bar-nav{
    background: rgba(255,255,255,.1);
    color: #fff;
    width: 100%;
    height: 40px;
    position: fixed;
    top: 0;
    left: 0;
    box-shadow: none;
  }
  .headerSub .mui-bar.mui-bar-nav > a{
    color:#fff;
    font-size: 16px;
    line-height: 25px;
  }
  .headerSub .mui-bar.mui-bar-nav > a.mui-icon-extra-custom {
    font-size: 24px;
  }
  .headerSub .menuCover {
    position: fixed;
    left: 0px;
    right: 0px;
    top: 0px;
    bottom: 0px;
    background: #000;
    opacity: .5;
    z-index: 900;
    display: none;
  }
  .headerSub .sideBar {
    min-width: 300px;
    background: url("/img/bg1.jpg") no-repeat;
    position: fixed;
    top: 0;
    bottom: 0;
    z-index: 1000;
    transition: all .4s ease;
    overflow: auto;
    font-size: 16px;
    left: -300px;
  }
  .headerSub .sideBar .sideBar-title>.person-info>.mui-table-view {
    padding-top: 20px;
    background: rgba(0,0,0,.3);
  }
  .headerSub .sideBar .sideBar-title .mui-table-view:before,
  .headerSub .sideBar .sideBar-title .mui-table-view:after,
  .headerSub .sideBar .sideBar-title .mui-table-view>.mui-table-view-cell:after {
    height: 0;
  }
  .headerSub .sideBar .sideBar-title>.person-info>.mui-table-view .mui-media-object {
    line-height: 60px;
    max-width: 60px;
    height: 60px;
    border-radius: 50%;
    margin-right: 10px;
  }
  .headerSub .sideBar .sideBar-title>.person-info>.mui-table-view .mui-media-body {
    margin-top: 6px;
  }
  .headerSub .sideBar .sideBar-title>.person-login>.mui-table-view {
    padding-top: 20px;
    background: rgba(0,0,0,.3);
  }
  .headerSub .sideBar .sideBar-title>.person-login>.mui-table-view>.mui-table-view-cell span.mui-pull-left {
    width: 50px;
    height: 50px;
    line-height: 50px;
    text-align: center;
    background: rgba(255,255,255,.4);
    border-radius: 50%;
    margin-right: 10px;
    font-size: 22px;
    color: #fff;
    font-weight: bold;
  }
  .headerSub .sideBar .sideBar-title .mui-table-view .mui-media-body>p{
    color: #fff;
  }
  .headerSub .sideBar .sideBar-title>.person-info>.mui-table-view .mui-media-body>p:first-child{
    font-size: 22px;
    font-weight: bold;
    margin-bottom: 5px;
  }
  .headerSub .sideBar .sideBar-title>.person-login>.mui-table-view>.mui-table-view-cell .mui-media-body {
    margin-top: 15px;
  }
  .headerSub .sideBar .sideBar-title>.person-login>.mui-table-view>.mui-table-view-cell .mui-media-body>p:first-child {
    font-size: 20px;
    margin-bottom: 5px;
  }
  .headerSub .sideBar .sideBar-title>.person-login>.mui-table-view>.mui-table-view-cell .mui-media-body>p:first-child>a {
    color: #fff;
  }
  .headerSub .menu {
    padding: 20px 20px 0;
    margin: 0;
    list-style: none;
    color: #d5d5d5;
    background: rgba(255,255,255,.1);
    height: 525px;
  }
  .headerSub .menu .menu-item {
    height: 40px;
    line-height: 40px;
    display: block;
    color: #f5f5f5;
  }
  .headerSub .menu .menu-item .iconfont {
    font-size: 22px;
    vertical-align: middle;
  }
  .headerSub .menu .menu-item .menu-item-title {
    margin-left: 15px;
    color: #fff;
  }
  .headerSub .headerSub-bottomNav {
    position:fixed;
    bottom: 0;
    width: 300px;
    height: 50px;
    line-height: 50px;
    display: flex;
    justify-content:space-between;
    background: rgba(0,0,0,.5);
    padding: 0 20px;
  }
  .headerSub .headerSub-bottomNav .bottomNav {
    color: #fff;
  }
  .headerSub .headerSub-bottomNav .bottomNav .iconfont {
     font-size: 22px;
     vertical-align: middle;
  }
  .headerSub .headerSub-bottomNav .bottomNav .icon-h {
     font-size: 24px;
     vertical-align: middle;
  }
  .headerSub .headerSub-bottomNav .bottomNav .bottomNav-title {
    font-size: 14px;
    margin-left: 8px;
  } 
</style>