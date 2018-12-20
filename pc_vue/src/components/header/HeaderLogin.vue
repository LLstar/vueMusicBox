<template>
  <div class="headerlogin">
    <mt-header fixed title="音乐播放器">
      <a @click="back" slot="left">
        <mt-button icon="back"></mt-button>
      </a>
    </mt-header>
  </div>
</template>

<script>
  export default {
    data(){
      return {}
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
  .headerlogin>.mint-header {
    background: #647077;
    color: rgba(255,255,255,.7);
  }
  .headerlogin .mint-header-title {
    color:#fff;
    font-size: 16px;
  }
</style>