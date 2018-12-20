<template>
  <div class="songlist-index">
    <mtHeader></mtHeader>
    <div class="index-list">
      <router-link to="/sortmenulist2/1" class="index-item">
        <img src="/img/menu01.jpg">
        <span>伤感</span>
      </router-link>
      <router-link to="/sortmenulist2/3" class="index-item">
        <img src="/img/menu02.jpg">
        <span>热歌</span>
      </router-link>
      <router-link to="/sortmenulist2/2" class="index-item">
        <img src="/img/menu03.jpg">
        <span>午后</span>
      </router-link>
      <router-link to="/sortmenulist2/4" class="index-item">
        <img src="/img/menu04.jpg">
        <span>旅行</span>
      </router-link>
      <router-link to="/sortmenulist2/8" class="index-item">
        <img src="/img/menu05.jpg">
        <span>华语</span>
      </router-link>
      <router-link to="/sortmenulist2/6" class="index-item">
        <img src="/img/menu06.jpg">
        <span>安静</span>
      </router-link>
    </div>
    <ul class="song-index-list">
      <router-link to="/singer" class="song-index-item">
        <div class="index-lf">
          <span class="iconfont icon-geshou"></span>
          <span class="index-title">歌手</span>
        </div>
        <div class="index-rh">
          <span class="index-subtitle">热门/飙升歌手</span>
          <span class="arrowed"></span>
        </div>
      </router-link>
      <router-link to="/sortmenu" class="song-index-item">
        <div class="index-lf">
          <span class="iconfont icon-icon-"></span>
          <span class="index-title">歌单</span>
        </div>
        <div class="index-rh">
          <span class="index-subtitle">发现更多好音乐</span>
          <span class="arrowed"></span>
        </div>
      </router-link>
      <router-link to="/mvlist" class="song-index-item">
        <div class="index-lf">
          <span class="iconfont icon-MV"></span>
          <span class="index-title">MV</span>
        </div>
        <div class="index-rh">
          <span class="index-subtitle">精选视频尽收眼底</span>
          <span class="arrowed"></span>
        </div>
      </router-link>
      <router-link to="/radio" class="song-index-item">
        <div class="index-lf">
          <span class="iconfont icon-02"></span>
          <span class="index-title">电台</span>
        </div>
        <div class="index-rh">
          <span class="index-subtitle">听有趣的声音</span>
          <span class="arrowed"></span>
        </div>
      </router-link>
      <router-link to="/sortlist" class="song-index-item">
        <div class="index-lf">
          <span class="iconfont icon-dianpu"></span>
          <span class="index-title">热门专区</span>
        </div>
        <div class="index-rh">
          <span class="index-subtitle">总有一样适合你</span>
          <span class="arrowed"></span>
        </div>
      </router-link>
    </ul>
  </div>
</template>

<script>
  import mtHeader from '@/components/header/Header.vue'
  export default {
    data(){
      return {}
    },
    components:{
      mtHeader
    },
    methods:{
      
    }
  }
</script>

<style>
  .songlist-index {
    padding-top: 40px;
    height: 100%;
  }
  .songlist-index .index-list {
    display: flex;
    justify-content: space-between;
    padding: 6px;
    flex-wrap: wrap;
  }
  .songlist-index .index-list .index-item {
    width: 32%;
    position: relative;
  }
  .songlist-index .index-list .index-item img{
    width: 100%;
    border-radius: 10px;
  }
  .songlist-index .index-list .index-item span{
    position: absolute;
    top: 0;
    left:0;
    width: 100%;
    height: 115px;
    display: block;
    text-align: center;
    line-height: 115px;
    color: #fff;
    font-size: 20px;
    font-weight: 700;
    background: rgba(0,0,0,.2);
  }
  .songlist-index .song-index-list{
    list-style: none;
    padding: 0;
    margin: 0;
    margin-top: 10px;
  }
  .songlist-index .song-index-list .song-index-item{
    display: flex;
    justify-content: space-between;
    flex-wrap: nowrap;
    padding:0 10px;
    color: #fff;
    height: 40px;
    line-height: 40px;
    margin-bottom: 15px;
  }
  .songlist-index .song-index-list .song-index-item .index-lf .iconfont {
    font-size: 24px;
    font-weight: 700;
  }
  .songlist-index .song-index-list .song-index-item .index-lf .index-title{
    margin-left: 8px;
  }
  .songlist-index .song-index-list .song-index-item .index-rh {
    white-space: nowrap;
    display: flex;
    justify-content: end;
  }
  .songlist-index .song-index-list .song-index-item .index-rh .index-subtitle {
    font-size: 14px;
    color: #d5d5d5;
  }
  .arrowed:after {
    width: 8px;
    height: 8px;
    border-top: 2px solid #fff;
    border-right: 2px solid #fff;
    transform: rotate(45deg);
    content: "";
    display: block;
    margin-top: 14px;
    margin-left: 5px;
  }
</style>