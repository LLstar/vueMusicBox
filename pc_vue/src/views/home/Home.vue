<template>
  <div class="home">
    <!--第一部分头部导航-->
    <mt-header></mt-header>
    <!--第二部分图片轮播图-->
    <mt-swipe :auto="4000">
      <mt-swipe-item v-for="item in imglist" :key="item.cid"><img :src="item.pic_url | resouceFilter"></mt-swipe-item>
    </mt-swipe>
    <!--第三部分六宫格-->
    <ul class="mui-table-view mui-grid-view mui-grid-9">
      <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-4"><router-link to="/singer">
              <span class="iconfont icon-geshou"></span>
              <div class="mui-media-body">歌手</div></router-link></li>
      <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-4"><router-link to="/sortlist">
              <span class="iconfont icon-paixingbang"></span>
              <div class="mui-media-body">排行榜</div></router-link></li>
      <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-4"><router-link to="/sortmenu">
              <span class="iconfont icon-fenlei"></span>
              <div class="mui-media-body">分类·歌单</div></router-link></li>
      <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-4"><router-link to="/radio">
              <span class="iconfont icon-02"></span>
              <div class="mui-media-body">电台</div></router-link></li>
      <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-4"><router-link to="/mvlist">
              <span class="iconfont icon-MV"></span>
              <div class="mui-media-body">MV</div></router-link></li>
      <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-4"><router-link to="/singsong">
              <span class="iconfont icon-changge"></span>
              <div class="mui-media-body">唱歌</div></router-link></li>
    </ul>
    <!--第四部分导航-->
    <Nav></Nav>
    <!--热门歌单-->
    <div>
      <ul class="songmenu">
        <li class="songmenu-item" v-for="menu in menus" :key="menu.sid">
          <router-link :to="'/sortmenulist2/'+menu.sid">
            <img :src="menu.img_url | resouceFilter">
            <p class="song-info">
              <span><i class="iconfont icon-headset"></i> {{menu.playcount}}万</span>
              <span class="iconfont icon-play"></span>
            </p>
            <p class="song-title">{{menu.title}}</p>
          </router-link>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
  import mtHeader from '@/components/header/Header.vue'
  import Nav from '@/components/header/Nav.vue'
  export default {
    data(){
      return {
        imglist:[],
        menus:[]
      }
    },
    components: {
      mtHeader,
      Nav
    },
    created(){
      this.getImg();
      this.getMenu();
    },
    methods:{
      //获取播放列表
      getImg(){
        this.$http.get("index/list")
        .then(res=>{
          //console.log(res.body.msg);
          this.imglist = res.body.msg;
        })
      },
      //获取热门菜单的信息
      getMenu(){
        this.$http.get("index/menuinfo")
        .then(res=>{
          this.menus = res.body.msg;
          //console.log(this.menus);
        })
      }
    }
  }
</script>

<style>
  .home {
    padding-top: 40px;
  }
  
  .home .mint-swipe {
    height: 170px;
    padding: 5px;
  }

  .home .mint-swipe img{
    height: 100%;
    width: 100%;
  }
  .home .mui-table-view.mui-grid-view {
    background: rgba(0,0,0,0);
    border: none;
  }
  .home .mui-table-view.mui-grid-view .mui-table-view-cell{
      border: none;
  }
  .home .mui-table-view.mui-grid-view .mui-table-view-cell .mui-media-body{
      color: #fff;
  }
  .home .mui-table-view .mui-table-view-cell img {
    width: 100%;
    height: 100%;
  }
  .home .mui-table-view.mui-grid-view .mui-table-view-cell span.iconfont{
    display: block;
    width: 50px;
    height: 50px;
    font-size: 30px;
    line-height: 50px;
    text-align: center;
    margin: 0 auto;
    border-radius: 50%;
    color: #fff;
    font-weight: bold;
  }
  .home .mui-table-view.mui-grid-view .mui-table-view-cell span.icon-geshou{
    background: #AB82FF;
  }
  .home .mui-table-view.mui-grid-view .mui-table-view-cell span.icon-paixingbang {
    background: #63B8FF;
  }
  .home .mui-table-view.mui-grid-view .mui-table-view-cell span.icon-fenlei {
    background: #76EEC6;
  }
  .home .mui-table-view.mui-grid-view .mui-table-view-cell span.icon-02 {
    background: #EE9A49;
  }
  .home .mui-table-view.mui-grid-view .mui-table-view-cell span.icon-MV {
    background: #9BCD9B;
  }
  .home .mui-table-view.mui-grid-view .mui-table-view-cell span.icon-changge {
    background: #F08080;
  }
  .songmenu {
    display: flex;
    justify-content: space-between;
    padding: 5px;
    flex-wrap: wrap;
    margin-top: 0;
  }
  .songmenu .songmenu-item {
    width: 32%;
    position: relative;
  }
  .songmenu .songmenu-item img {
    width: 100%;
  }
  .songmenu .songmenu-item .song-info {
    color: #fff;
    font-size: 10px;
    position: absolute;
    bottom: 45px;
    left: 0;
    width: 100%;
  }
  .songmenu .songmenu-item .song-title {
    color: #fff;
  }
  .songmenu .songmenu-item .song-info .icon-play {
    display: inline-block;
    width: 20px;
    height: 20px;
    background: rgba(0,0,0,.4);
    text-align: center;
    line-height: 20px;
    border-radius: 50%;
    position: absolute;
    right: 5px;
  }
</style>
