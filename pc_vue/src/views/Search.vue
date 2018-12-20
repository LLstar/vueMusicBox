<template>
  <div class="search">
    <mt-search v-model="value" placeholder="小酒窝 林俊杰" autofocus show>
    </mt-search>
    <i class="arrow" @click="goBack"></i>
    <i class="m-search" @click="goSearch">搜索</i>
    <h2 class="search-title">搜索热词</h2>
    <ul class="search-list" @click="getValue">
      <li class="search-item">林俊杰</li>
      <li class="search-item">稻香 周杰伦</li>
      <li class="search-item">2018中国好声音</li>
      <li class="search-item">中国新说唱</li>
      <li class="search-item">张艺兴</li>
      <li class="search-item">邓紫棋</li>
    </ul>
  </div>
</template>

<script>
  
  export default {
    data(){
      return {
        value:'小酒窝 林俊杰'
      }
    },
    methods:{
      goBack(){
        this.$router.go(-1);
      },
      getValue(e){
        if(e.target.nodeName == "LI"){
          this.value = e.target.innerHTML;
          //console.log(e.target.innerHTML);
        }
      },
      goSearch(){
        if(this.value){
          this.$router.push('/searchlist/'+this.value);
        }
        
      }
    }
  }
</script>

<style>
  .search {
    height: 600px;
    position: relative;
  }
  .search .mint-search {
     height: 44px;
  }
  .search .mint-search-list {
     height: 44px;
  }
  .search .mint-searchbar {
    background: #647077;
  }
  .search .mint-searchbar-inner {
    width: 235px;
    flex: 0;
    background: rgba(255,255,255,.2);
    margin: 0 auto;
    border-radius: 15px;
  }
  .search .mint-searchbar-core {
    margin-top: 14px;
    height: 28px;
    line-height: 28px;
    background: rgba(255,255,255,0);
    width: 235px;
    text-align: center;
    font-size: 15px;
    color: #fff;
    text-align: left;
  }
  .search .mintui.mintui-search {
    font-size: 15px;
    color: #fff;
  }
  .search .mint-searchbar-cancel {
    display: none;
  }
  .search .mint-searchbar-core::placeholder {
    color: rgba(255,255,255,.8);
  }
  .search .arrow {
    width: 12px;
    height: 12px;
    border-top: 2px solid #fff;
    border-left: 2px solid #fff;
    transform: rotate(-45deg);
    display: block;
    position: absolute;
    top: 16px;
    left: 14px;
    z-index: 10;
  }
  .m-search{
    position: absolute;
    top: 12px;
    right: 12px;
    z-index: 10;
    font-style: normal;
    color: #fff;
    font-size: 15px;
  }
  .search .search-title {
    font-size: 22px;
    color: #fff;
    margin: 20px 0 0 20px;
  }
  .search .search-list {
    padding: 0 20px;
    margin: 0;
    list-style: none;
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    margin-top: 10px;
  }
  .search .search-list .search-item {
    width:45%;
    padding: 10px;
    border-bottom: 1px solid rgba(255,255,255,.5);
    color: #fff;
    height: 60px;
    line-height:50px;

  }
</style>