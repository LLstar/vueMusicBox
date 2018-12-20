<template>
  <div class="pifu">
    <mt-header fixed title="换肤">
      <router-link to="/home" slot="left">
        <mt-button icon="back"></mt-button>
      </router-link>
    </mt-header>
    <ul class="pifu-list">
      <li class="pifu-item" v-for="(item,i) in pifuList" :key="i" @click="changePifu(item.url)">
        <img :src="item.url">
        <span>{{item.title}}</span>
      </li>
    </ul>
  </div>
</template>

<script>
  export default {
    data(){
      return {
        pifuList:[
          {url:"/img/bg1.jpg",title:"默认"},
          {url:"/img/bg2.jpg",title:"夕阳"},
          {url:"/img/bg3.jpg",title:"七月与安生"},
          {url:"/img/bg4.jpg",title:"蒲公英"},
          {url:"/img/bg5.jpg",title:"林允儿"},
          {url:"/img/bg6.jpg",title:"简约"},
          {url:"/img/bg7.jpg",title:"阿狗阿猫"},
          {url:"/img/bg8.jpg",title:"海浪"},
          {url:"/img/bg9.jpg",title:"春天里"},
          {url:"/img/bg10.jpg",title:"寒梅"},
          {url:"/img/bg11.jpg",title:"星空"},
          {url:"/img/bg12.jpg",title:"繁华"}
        ]
      }
    },
    methods:{
     changePifu(url){
      //更改主界面的背景图片
      document.getElementById("app").style.backgroundImage = `url(${url})`;
        this.$store.commit("changeBgUrl",url);
        this.$router.push("/home");
     }
    }
  }
</script>

<style>
  .pifu {
    padding-top:40px;
    background: #fff;
    height: 100%;
  }
  .pifu .mint-header {
    background: #647077;
    color: #fff;
    width: 100%;
    height: 40px;
    position: fixed;
    top: 0;
    left: 0;
    font-size: 16px;
  }
  .pifu .pifu-list {
    list-style: none;
    padding: 0;
    margin: 0;
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
    margin-top: 10px;
    padding: 5px;
  }
  .pifu .pifu-list .pifu-item {
    width: 30%;
    height: 170px;
    display: flex;
    flex-direction: column;
  }
  .pifu .pifu-list .pifu-item>img {
    width: 100%;
    height: 130px;
    border-radius: 5px;
  }
  .pifu .pifu-list .pifu-item>span {
    margin-top: 5px;
    color: #333;
    font-size: 14px;
    text-align: center;
  }
</style>