<template>
  <div class="sort-menu">
    <mt-header fixed title="分类·歌单">
      <a @click="back" slot="left">
        <mt-button icon="back"></mt-button>
      </a>
    </mt-header>
    <ul class="menu-list">
      <li class="menu-item">
        <a href="javascript:;">抖音</a>
      </li>
      <li class="menu-item">
        <a href="javascript:;">放松</a>
      </li>
      <li class="menu-item">
        <a href="javascript:;">经典</a>
      </li>
      <li class="menu-item">
        <a href="javascript:;">伤感</a>
      </li>
      <li class="menu-item">
        <a href="javascript:;">古风</a>
      </li>
      <li class="menu-item">
        <a href="javascript:;">网络</a>
      </li>
      <li class="menu-item">
        <a href="javascript:;">潮流</a>
      </li>
      <li class="menu-item">
        <a href="javascript:;">安静</a>
      </li>
      <li class="menu-item">
        <a href="javascript:;">专区</a>
      </li>
    </ul>
    <div class="songform">
      <h3>精选歌单</h3>
      <ul class="form-list">
        <li class="form-item">
          <router-link to="/sortmenulist/1">
            <img src="/img/zhiyu.jpg">
            <p class="form-title">时间是最好的解药，治愈最坏的伤口</p>
            <span class="form-subtitle">陆仁</span>
            <p class="song-info">
              <span><i class="iconfont icon-headset"></i> 251.7万</span>
              <span class="iconfont icon-play"></span>
            </p>
          </router-link>
        </li>
        <li class="form-item">
          <router-link to="/sortmenulist/2">
            <img src="/img/fangkong.jpg">
            <p class="form-title">放空大脑专享的舒缓华语歌曲</p>
            <span class="form-subtitle">念安娜</span>
            <p class="song-info">
              <span><i class="iconfont icon-headset"></i> 53.7万</span>
              <span class="iconfont icon-play"></span>
            </p>
          </router-link>
        </li>
        <li class="form-item">
          <router-link to="/sortmenulist/3">
            <img src="/img/hanxi.jpg">
            <p class="form-title">秋季特调饮品：浓醇韩系R&B</p>
            <span class="form-subtitle">smile</span>
            <p class="song-info">
              <span><i class="iconfont icon-headset"></i> 10.8万</span>
              <span class="iconfont icon-play"></span>
            </p>
          </router-link>
        </li>
        <li class="form-item">
          <router-link to="/sortmenulist/4">
            <img src="/img/qianxi.jpg">
            <p class="form-title">“点这首歌我们一起唱好不好”</p>
            <span class="form-subtitle">趵突泉边的小屁孩</span>
            <p class="song-info">
              <span><i class="iconfont icon-headset"></i> 490.4万</span>
              <span class="iconfont icon-play"></span>
            </p>
          </router-link>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>

  export default {
    data(){
      return {}
    },
    methods:{
      back(e){
        e.preventDefault();
        this.$router.go(-1);
      }
    }
  }
</script>

<style>
  .sort-menu {
    padding-top: 40px;
    height: 100%;
  }
  .sort-menu .mint-header {
    background: #647077;
    font-size: 16px;
  }
  .sort-menu .menu-list {
    display: flex;
    justify-content: space-between;
    margin: 0;
    padding: 0;
    padding: 10px 5px;
    flex-wrap: wrap;
  }
  .sort-menu .menu-list .menu-item{
    width: 32%;
    height: 30px;
    line-height: 30px;
    background: rgba(0,0,0,.2);
    display:flex;
    align-items: center;
    flex-direction: column;
    margin: 5px 0;
  }
  .sort-menu .menu-list .menu-item a {
    color: #fff;
    font-size: 15px;
  }
  .sort-menu .songform h3 {
    margin-left: 10px;
    font-size: 18px;
    color: #fff;
  }
  .sort-menu .songform .form-list {
    display: flex;
    justify-content: space-between;
    margin:0;
    padding: 10px;
    flex-wrap: wrap;
  }
  .sort-menu .songform .form-list .form-item {
    display: flex;
    color: #fff;
    flex-direction: column;
    width: 49%;
    position: relative;
  }
  .sort-menu .songform .form-list .form-item img {
    width: 100%;
  }
  .sort-menu .songform .form-list .form-item .form-title {
    color: #fff;
    font-size: 14px;
    margin: 5px 0;
    height: 42px;
  }
  .sort-menu .songform .form-list .form-item .form-subtitle {
    color: #c5c5c5;
    font-size: 14px;
  }
  .sort-menu .songform .form-list .form-item .song-info {
    position: absolute;
    bottom: 80px;
    left: 0;
    padding: 0 5px;
    color: #fff;
    margin: 0;
    height:25px;
    width: 100%;
  }
  .sort-menu .songform .form-list .form-item .song-info .icon-play {
    display: inline-block;
    width: 25px;
    height: 25px;
    background: rgba(0,0,0,.4);
    text-align: center;
    line-height: 25px;
    border-radius: 50%;
    position:absolute;
    right: 5px;
  }
</style>