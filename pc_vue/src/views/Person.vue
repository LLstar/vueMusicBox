<template>
  <div class="person">
    <!-- 第一部分头部 -->
    <mt-header-sub></mt-header-sub>
    <!-- 第二部分登录信息 -->
    <ul class="mui-table-view">
      <li class="mui-table-view-cell mui-media">
        <a href="#">
          <img class="mui-media-object mui-pull-left" src="http://localhost:3001/img/person/person1.jpg">
          <div class="mui-media-body">
            <p>南城以南...</p>
            <p class='mui-ellipsis'>能和心爱的人一起睡觉，是件幸福的事情；可是，打呼噜怎么办？</p>
          </div>
        </a>
      </li>
    </ul>
    <!-- 第三部分六宫格 -->
    <ul class="mui-table-view mui-grid-view mui-grid-9">
      <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><router-link to="/singer">
              <span class="iconfont icon-yinyue"></span>
              <div class="mui-media-body">本地音乐</div></router-link></li>
      <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><router-link to="/photolist">
              <span class="iconfont icon-paixingbang"></span>
              <div class="mui-media-body">我的下载</div></router-link></li>
      <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><router-link to="/goodslist">
              <span class="iconfont icon-zuijinbofang"></span>
              <div class="mui-media-body">最近播放</div></router-link></li>
      <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><router-link to="/words">
              <span class="iconfont icon-shoucang"></span>
              <div class="mui-media-body">我的收藏</div></router-link></li>
      <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><router-link to="/video">
              <span class="iconfont icon-MV"></span>
              <div class="mui-media-body">我的订阅</div></router-link></li>
      <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><router-link to="/concat">
              <span class="iconfont icon-changge"></span>
              <div class="mui-media-body">已购音乐</div></router-link></li>
    </ul>
  </div>
</template>

<script>
  import mtHeaderSub from '@/components/HeaderSub.vue'
  export default {
    data(){
      return {}
    },
    components: {
      mtHeaderSub
    }
  }
</script>
<style>
  .person {
    padding-top: 40px;
  }

  .person .mui-table-view {
    background: rgba(255,255,255,.3);
    border: none;
    margin-top: 20px;
    padding-bottom: 20px;
  }
  .person .mui-table-view .mui-media-object {
    line-height: 70px;
    max-width: 70px;
    height: 70px;
    border-radius: 50%;
  }
  .person .mui-table-view .mui-media-body {
    margin-top: 15px;
  }

  .person .mui-table-view .mui-media-body >p{
    color: #fff;
  }
  .person .mui-table-view .mui-media-body >p:first-child{
    font-size: 18px;
    font-weight: bold;
  }
  .person .mui-table-view.mui-grid-view {
    background: rgba(255,255,255,.3);
    margin-top: 20px;
  }
  .person .mui-table-view.mui-grid-view .mui-table-view-cell {
    border: none;
  }
</style>