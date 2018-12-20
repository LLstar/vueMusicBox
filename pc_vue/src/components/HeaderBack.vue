<template>
  <div class="headerback">
    <mt-header fixed title="音乐播放器">
      <router-link to="/" slot="left">
        <mt-button icon="back"></mt-button>
      </router-link>
      <router-link to="/" slot="right">
        <mt-button icon="search"></mt-button>
      </router-link>
    </mt-header>
  </div>
</template>

<script>
  export default {

  }
</script>

<style>
  .headerback>.mint-header {
    background: #647077;
    color: rgba(255,255,255,.7);
  }
</style>