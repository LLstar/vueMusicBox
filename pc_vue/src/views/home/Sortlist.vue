<template>
  <div class="sortlist">
    <!--头部导航-->
    <mt-header fixed title="排行榜">
      <a @click="back" slot="left">
        <mt-button icon="back"></mt-button>
      </a>
    </mt-header>
    <!--排行榜-->
    <ul class="mui-table-view">
      <li class="mui-table-view-cell mui-media" v-for="(item,i) in list">
        <router-link :to="'/sortlistdetails/'+(i+1)">
          <span class="sortlist-title">{{item.title}}</span>
          <img class="mui-media-object mui-pull-left" src="/img/sortlist-01.jpg">
          <div class="mui-media-body">
            <p class='mui-ellipsis'>1.{{item.content[0]}}</p>
            <p class='mui-ellipsis'>2.{{item.content[1]}}</p>
            <p class='mui-ellipsis'>3.{{item.content[2]}}</p>
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
        list:[
          {"title":"热歌榜","content":["后会无期 - G.E.M.邓紫棋","暧昧 - 薛之谦","A.I.N.Y - G.E.M.邓紫棋"]},
          {"title":"新歌榜","content":["梦想天空分外蓝 - 陈奕迅","Tickets - Explicit - Maroon 5","我的秘密 - G.E.M.邓紫棋"]},
          {"title":"飙升榜","content":["Story - Non-LP - Maroon 5","动物世界 - 薛之谦","Better World - Winner"]},
          {"title":"潮流榜","content":["东风破 - 周杰伦","Faint《变形金刚》电影插曲 - Linkin Park","Hit the Lights - Selena Gomez"]},
          {"title":"怀旧榜","content":["告白 - EXO","Victory Yeah! - Winner","Baauer-Temple - G-Dragon&M.I.A.&Baauer"]}
        ]
      }
    },
    methods:{
      back(){
        this.$router.go(-1)
      }
    }
  }
</script>

<style>
  .sortlist {
    padding-top: 40px;
    height: 100%;
  }
  .sortlist .mint-header {
    background: #647077;
    position: fixed;
    top:0;left:0;
    width: 100%;
  }
  .sortlist .mint-header-title {
    font-size: 16px;
  }
  .sortlist .mui-table-view {
     background: rgba(255,255,255,0);
     margin-top: 20px;
  }
  .sortlist .mui-table-view .mui-table-view-cell {
    position: relative;
  }
  .sortlist .mui-table-view .sortlist-title {
    text-align: center;
    position: absolute;
    top: 11px;
    left: 15px;
    background: rgba(0,0,0,.3);
    display: block;
    width: 90px;
    height: 90px;
    color: #fff;
    line-height: 90px;
    font-size: 20px;
    font-weight: 700;
  }
  .sortlist .mui-table-view .mui-media-object {
    line-height: 90px;
    max-width: 90px;
    height: 90px;
  }
  .sortlist .mui-table-view .mui-media-body {
    margin-top: 10px;
  }
  .sortlist .mui-table-view .mui-media-body .mui-ellipsis {
    color: rgba(255,255,255,.8);
    margin: 5px 0;
  }
  .sortlist .mui-table-view::before,
  .sortlist .mui-table-view::after,
  .sortlist .mui-table-view .mui-table-view-cell::after {
    height: 0;
  }
</style>