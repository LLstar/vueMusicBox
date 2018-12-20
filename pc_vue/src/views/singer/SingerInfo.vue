<template>
  <div class="singer-info">
    <div class="singer-header"> 
      <mt-header>
        <a @click="backprev" slot="left">
          <mt-button icon="back"></mt-button>
        </a>
      </mt-header>
    </div>
    <div class="singer-title">
       <ul class="mui-table-view">
        <li class="mui-table-view-cell mui-media">
          <a href="javascript:;">
            <img class="mui-media-object mui-pull-left" :src="singer.avatar | resouceFilter">
            <div class="mui-media-body">
              <p>{{singer.name}}</p>
              <p class='mui-ellipsis'>粉丝：{{singer.fans}}万</p>
              <span v-if="show">已收藏</span>
              <span v-else>未收藏</span>
            </div>
          </a>
        </li>
      </ul>
    </div>
    <ul class="songlist">
      <p class="songtitle">
        <router-link :to="'/singerinfo/'+this.id" @click.native="addActive">单曲</router-link>
        <router-link :to="'/singerinfo/'+this.id+'/allsong'" @click.native="addActive">专辑</router-link>
        <router-link :to="'/singerinfo/'+this.id+'/mv'" @click.native="addActive">MV</router-link>
        <router-link :to="'/singerinfo/'+this.id+'/songdel'" @click.native="addActive">简介</router-link>
      </p>
      <router-view :id="id"></router-view>
    </ul>
  </div>
</template>

<script>

  export default {
    data(){
      return {
        id:this.$route.params.id,
        singer:{},
        show:true
      }
    },
    created(){
      this.getSingerDetails();
      this.isFovarite();
    },
    mounted(){
      window.addEventListener("scroll",this.handleScroll);
    },
    methods:{
      backprev(e){
        e.preventDefault();
        this.$router.push("/singer");
      },
      addActive(e){
        e.preventDefault();
        var as = e.target.parentNode.children;
        for(var a of as){
          a.style.borderBottomColor = "transparent";
        }
        e.target.style.borderBottomColor = "gold";
      },
      handleScroll(){
        if(e.target.body.children[1].children[0].className == "singer-info"){
          var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
          var head = document.querySelector(".singer-info>.singer-header>.mint-header");
          if(scrollTop>5){
            head.style.background = "#647077";
          }else{
            head.style.background = "rgba(0,0,0,.5)";
          }
        }
      },
      getSingerDetails(){
        this.$http.get("songs/singerDetails",{params:{gid:this.id}})
        .then(res=>{
          if(res.body.code == 1){
            this.singer = res.body.msg[0];
          }
        })
      },
      isFovarite(){
        if(window.uid){
          this.$http.get("singer/singerInfo",{params:{uid:window.uid,gid:this.id}})
          .then(res=>{
            if(res.body.code == 1){
              this.show = true;
            }else{
              this.show = false;
            }
          })
        }else{
          this.show = false;
        }
      }
    }
  }
</script>

<style>
  .singer-info {
    height:100%;
    padding-top: 40px;
  }
  .singer-info>.singer-header>.mint-header {
     background: rgba(0,0,0,.5);
     width: 100%;
     position:fixed;
     top: 0;
     left: 0;
     z-index:5;
  }
  .singer-info>.singer-title>.mui-table-view {
    height: 150px;
    background: rgba(0,0,0,.5);
  }
  .singer-info>.singer-title>.mui-table-view .mui-media-object {
    line-height: 120px;
    max-width: 120px;
    height: 120px;
    border-radius: 50%;
    margin-right: 15px;
  }
  .singer-info>.singer-title>.mui-table-view .mui-media-body {
    color: #fff;
    margin-top: 17px;
  }

  .singer-info>.singer-title>.mui-table-view .mui-media-body>p:first-child {
    font-size: 18px;
    font-weight: 600;
    margin-bottom: 5px;
    color: #fff;
  }
  .singer-info>.singer-title>.mui-table-view .mui-media-body>p.mui-ellipsis {
    color: rgba(255,255,255,.7);
    margin-bottom: 5px;
  }
  .singer-info>.singer-title>.mui-table-view .mui-media-body>span {
    display: block;
    width: 80px;
    height: 30px;
    border-radius: 16px;
    background: rgba(255,255,255,.3);
    line-height: 30px;
    text-align: center;
    font-size: 15px;
  }
  
  .singer-info>.singer-title>.mui-table-view:before,
  .singer-info>.singer-title>.mui-table-view:after,
  .singer-info>.singer-title>.mui-table-view .mui-table-view-cell:after {
    height:0;
  }
  .singer-info>.songlist {
    background: rgba(255,255,255,.1);
    padding: 0;
    margin-top: 0;
  }
  .singer-info>.songlist>.songtitle {
    display: flex;
    justify-content: space-between;
    padding: 10px 30px;
  }
  .singer-info>.songlist>.songtitle>a{
    color: #fff;
    font-size: 16px;
    padding: 5px 0;
    border-bottom: 2px solid transparent;
  }
  .singer-info>.songlist>.songtitle>a:first-child {
    border-bottom-color: gold;
  }
</style>