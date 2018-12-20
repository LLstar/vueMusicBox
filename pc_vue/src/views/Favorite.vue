<template>
  <div class="favorite">
    <mt-header></mt-header>
    <ul class="mui-table-view favorite-singer" v-if="isfavorite">
      <li class="mui-table-view-cell mui-media" v-for="favorite in favoritelist" :key="favorite.gid">
        <a href="javascript:;">
          <img class="mui-media-object mui-pull-left" :src="favorite.avatar | resouceFilter">
          <div class="mui-media-body">
            <div class="mui-pull-left">
              <p>{{favorite.name}}</p>
              <p class='mui-ellipsis'>粉丝：{{favorite.fans}}万</p>
            </div>
            <span class="mui-pull-right">已收藏</span>
          </div>
        </a>
      </li>
    </ul>
    <div v-else class="collection">
      <i>(づ｡◕ᴗᴗ◕｡)づ</i>
      <b>还没有收藏，快去登录添加收藏吧！</b>
    </div>
  </div>
</template>

<script>
  import mtHeader from '@/components/header/HeaderLogin.vue'
  export default {
    data(){
      return {
        isfavorite:true,
        favoritelist:[]
      }
    },
    components: {
      mtHeader
    },
    created(){
      this.getFavorite();
      
    },
    methods:{
      getFavorite(){
        if(window.uid){
          this.isfavorite=true;
          this.$http.get("favorite/list",{params:{uid:window.uid}})
          .then(res=>{
            if(res.body.code == 1){
              this.favoritelist = res.body.msg;
            }
          })
        }else{
          this.isfavorite = false;
        }
      }
    }
  }
</script>

<style>
  .favorite {
    padding-top: 40px;
    height: 600px;
  }
  .favorite>.favorite-singer {
      margin-top: 20px;
      background: rgba(255,255,255,.1);
      padding: 10px 0;
  }
  .favorite>.favorite-singer {
    background: rgba(255,255,255,0);
    border: none;
  }
  .favorite>.favorite-singer>.singer-title {
    margin: 0;
    margin-left: 15px;
    color: gold;
    font-weight: bold;
  }
  .favorite>.favorite-singer .mui-media-object.mui-pull-left {
    line-height: 65px;
    max-width: 65px;
    height: 65px;
    border-radius: 50%;
  }
  .favorite>.favorite-singer .mui-media-body{
    margin-top: 13px;
  }
  .favorite>.favorite-singer .mui-media-body p:first-child {
    color: #fff;
    font-size: 16px;
    width: 95px;
    white-space: nowrap;
    overflow: hidden;
  }
  .favorite>.favorite-singer .mui-media-body p.mui-ellipsis {
    color: gold;
  }
  .favorite>.mui-table-view:before,
  .favorite>.mui-table-view:after,
  .favorite>.mui-table-view .mui-table-view-cell:after {
    height:0;
  }
  .favorite>.favorite-singer .mui-media-body>span.mui-pull-right {
    color: #fff;
    font-size: 14px;
    display: block;
    width: 65px;
    height: 30px;
    border: 1px solid #fff;
    text-align: center;
    line-height: 30px;
    margin-top: 5px;
    margin-right: 20px;
  }
  .favorite .collection {
    margin-top: 50px;
    text-align: center;
  }
  .favorite .collection i{
    display: block;
    margin: 0 auto;
    font-style: normal;
    color:  #fff;
  }

  .favorite .collection b {
    font-weight: normal;
    margin-top: 10px;
    display: block;
    color: #fff;
  }
 
</style>