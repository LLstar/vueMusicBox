<template>
  <div class="headerback">
    <mt-header fixed title="音乐播放器">
      <a @click="goBack" slot="left">
        <mt-button icon="back"></mt-button>
      </a>
      <router-link to="/" slot="right">
        <mt-button icon="search"></mt-button>
      </router-link>
    </mt-header>
  </div>
</template>

<script>
  export default {
    data(){
      return {}
    },
    methods:{
      goBack(e){
        e.preventDefault();
        this.$router.push("/home");
      }
    }
  }
</script>

<style>
  .headerback>.mint-header {
    background: #647077;
    color: rgba(255,255,255,.7);
  }
  .headerback .mint-header-title {
    color:#fff;
    font-size: 16px;
  }
</style>