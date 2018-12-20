<template>
  <div class="radio">
    <mt-header fixed title="电台">
      <a @click="back" slot="left">
        <mt-button icon="back"></mt-button>
      </a>
    </mt-header>
    <ul class="mui-table-view">
      <h2 class="radio-title">热门电台</h2>
      <li class="mui-table-view-cell mui-media">
        <router-link to="/sortmenulist/4">
          <img class="mui-media-object mui-pull-left" src="/img/qianxi.jpg">
          <div class="mui-media-body">
            怀旧金曲电台
            <p class='mui-ellipsis'>致听这些歌长大的90后的我们</p>
            <p class='radio-play'>
              <span class="iconfont icon-play">30.5万</span>
            </p>
          </div>
        </router-link>
      </li>
      <li class="mui-table-view-cell mui-media">
        <router-link to="/sortmenulist/1">
          <img class="mui-media-object mui-pull-left" src="/img/zhiyu.jpg">
          <div class="mui-media-body">
            致亲爱的自己
            <p class='mui-ellipsis'>这年头谁还怕单身啊</p>
            <p class='radio-play'>
              <span class="iconfont icon-play">1627.5万</span>
            </p>
          </div>
        </router-link>
      </li>
      <li class="mui-table-view-cell mui-media">
        <router-link to="/sortmenulist/2">
          <img class="mui-media-object mui-pull-left" src="/img/fangkong.jpg">
          <div class="mui-media-body">
            深夜解药
            <p class='mui-ellipsis'>相信我，一个人永远比两个人舒服</p>
            <p class='radio-play'>
              <span class="iconfont icon-play">1627.5万</span>
            </p>
          </div>
        </router-link>
      </li>
    </ul>
    <ul class="mui-table-view">
      <h2 class="radio-title">明星电台</h2>
      <li class="mui-table-view-cell mui-media">
        <router-link to="/radiodetail/1">
          <img class="mui-media-object mui-pull-left" src="http://localhost:3001/img/singer/singer1.jpg">
          <div class="mui-media-body">
            林俊杰电台
            <p class='mui-ellipsis'>每个90后都有一份关于林俊杰的回忆</p>
            <p class='radio-play'>
              <span class="iconfont icon-play">35.5万</span>
            </p>
          </div>
        </router-link>
      </li>
      <li class="mui-table-view-cell mui-media">
        <router-link to="/radiodetail/3">
          <img class="mui-media-object mui-pull-left" src="http://localhost:3001/img/singer/singer3.jpg">
          <div class="mui-media-body">
            周杰伦电台
            <p class='mui-ellipsis'>最全周杰伦歌曲！一代人的青春记忆</p>
            <p class='radio-play'>
              <span class="iconfont icon-play">22.5万</span>
            </p>
          </div>
        </router-link>
      </li>
      <li class="mui-table-view-cell mui-media">
        <router-link to="/radiodetail/5">
          <img class="mui-media-object mui-pull-left" src="http://localhost:3001/img/singer/singer5.jpg">
          <div class="mui-media-body">
            邓紫棋电台
            <p class='mui-ellipsis'>单曲循环，邓紫棋精美歌曲</p>
            <p class='radio-play'>
              <span class="iconfont icon-play">12.1万</span>
            </p>
          </div>
        </router-link>
      </li>
    </ul>
  </div>
</template>

<script>

  export default {
    data(){
      return {
        
      }
    },
    created(){
      
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
 .radio {
   height: 100%;
   padding-top: 40px;
 }
 .radio .mint-header {
    background: #647077;
    font-size: 16px;
  }
  .radio .mui-table-view {
    background: rgba(255,255,255,.1);
    border: none;
    margin-top: 10px;
    padding-top: 10px;
  }
  .radio .mui-table-view .radio-title {
    font-size: 20px;
    color: #fff;
    margin: 0;
    padding-left: 15px;
  }
  .radio .mui-table-view .mui-media-object {
    line-height: 90px;
    max-width: 90px;
    height: 90px;
    
  }
  .radio .mui-table-view .mui-media-object.mui-pull-left {
    margin-right: 20px;
  }
  .radio .mui-table-view .mui-media-body {
    margin-top: 15px;
    color: #fff;
    font-size: 18px;
    font-weight: bold;
  }
  .radio .mui-table-view .mui-media-body .mui-ellipsis {
    margin-top: 10px;
    color: #f1f1f1;
    font-weight: normal;
  }
  .radio .mui-table-view .mui-media-body .radio-play .icon-play{
    color: #f1f1f1;
    font-size: 14px;
    font-weight: normal;
  }
  .radio .mui-table-view:before,
  .radio .mui-table-view:after,
  .radio .mui-table-view>.mui-table-view-cell:after {
    height: 0;
  }
</style>