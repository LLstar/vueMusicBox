<template>
  <div class="play">
    <mt-header></mt-header>
    <div class="play-head">
      <router-link to="/play">推荐</router-link>
      <router-link to="/play/playlist">音乐</router-link>
      <router-link to="/play/playlist2">MV</router-link>
      <router-link to="/play/playlist3">影视</router-link>
    </div>
    <router-view></router-view>
  </div>
</template>

<script>
  import mtHeader from '@/components/header/Header.vue'
  export default {
    data(){
      return {}
    },
    components: {
      mtHeader
    }
  }
</script>

<style>
  .play {
    padding-top: 40px;
    height: 100%;
  }
  .play .play-head {
    height: 40px;
    background: rgba(255,255,255,.1);
    
    display: flex;
    justify-content: space-around;
  }
  .play .play-head>a {
    display: block;
    width: 55px;
    color: #fff;
    height: 25px;
    margin-top: 8px;
    font-size: 15px;
    border-radius: 15px;
    text-align: center;
    line-height: 25px;
  }
  .play .play-head>a.router-link-exact-active.router-link-active {
    background: gold;
  }
  
</style>