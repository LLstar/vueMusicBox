<template>
  <div class="nav">
    <mt-header>
      <mt-button slot="left">热门歌单</mt-button>
      <router-link to="/sortmenu" slot="right">
        <mt-button icon="more"></mt-button>
      </router-link>
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