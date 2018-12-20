<template>
  <div class="nav">
    <mt-header>
      <router-link to="/" slot="left">
        <mt-button>热门歌单</mt-button>
      </router-link to="/classify">
      <mt-button icon="more" slot="right"></mt-button>
    </mt-header>
  </div>
</template>

<script>
  export default {
    data(){
      return {}
    }
  }
</script>

<style>
  .nav>.mint-header {
    background: rgba(0,0,0,0);
    padding: 0 15px;
    font-size: 16px;
  }

  .nav>.mint-header .mint-button-text {
    font-weight: bold;
  }
</style>