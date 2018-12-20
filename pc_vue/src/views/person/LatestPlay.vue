<template>
  <div class="latest-play">
    <mt-header fixed title="音乐播放器">
      <router-link to="/person" slot="left">
        <mt-button icon="back"></mt-button>
      </router-link>
    </mt-header>
    <div class='latest-head'>
      <router-link to="/latestplay">最近播放的歌曲</router-link>
      <router-link to="/latestplay/latestplayvedio">最近播放的视频</router-link>
    </div>
    <router-view></router-view>
  </div>
</template>

<script>
  export default {
    data(){
      return {}
    },
    methods:{
      
    }
  }
</script>

<style>
  .latest-play {
    padding-top: 40px;
    height: 100%;
  }
  .latest-play .mint-header {
    background: #647077;
    font-size: 16px;
  }
  .latest-play .latest-head {
    height: 40px;
    background: rgba(255,255,255,.1);
    display: flex;
    justify-content: space-around;
    
    line-height: 40px;
    text-align: center;
  }
  .latest-play .latest-head>a {
    color:#fff;
    font-size: 15px;
    border-bottom: 3px solid transparent;
  }
  .latest-play .latest-head>a.router-link-exact-active.router-link-active {
    border-bottom-color: gold;
  }
</style>