<template>
  <div id="app">
    <router-view></router-view>
    <!--3：tabbar 固定在底端导航条-->
    <nav class="mui-bar mui-bar-tab">
      <router-link class="mui-tab-item" to="/home">
        <span class="mui-icon mui-icon-home-filled"></span>
        <span class="mui-tab-label">首页</span>
      </router-link>
      <router-link class="mui-tab-item" to="/songlist">
        <span class="mui-icon mui-icon-list"></span>
        <span class="mui-tab-label">曲库</span>
      </router-link>
      <router-link class="mui-tab-item" to="/play">
        <span class="mui-icon mui-icon-videocam">
        </span>
        <span class="mui-tab-label">视频</span>
      </router-link>
      <router-link class="mui-tab-item" to="/person">
        <span class="mui-icon mui-icon-person-filled"></span>
        <span class="mui-tab-label">我的</span>
      </router-link>
    </nav>
  </div>
</template>

<style>
  #app {
    background: url("/img/bg1.jpg") no-repeat fixed 25% 0;
    height: 100%;
    padding-bottom: 50px;
  }

  #app .mui-bar.mui-bar-tab {
    background: #19191F;
  }

  #app .mui-bar.mui-bar-tab .mui-tab-item {
    color: rgba(255,255,255,.7);
    font-weight: bold;
  }

  #app .mui-bar.mui-bar-tab .mui-tab-item.router-link-active {
    color: gold;
  }
  
  
</style>
