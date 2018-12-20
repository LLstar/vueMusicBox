<template>
  <div class="local-song">
    <mtHeader></mtHeader>
    <div class="nolocal">
      <span class="icon-icon- iconfont"></span>
      <p class="local-subtitle">暂无本地歌曲</p>
      <a class="local-href" href="javascript:;">
        扫描本地歌曲
      </a>
    </div>
  </div>
</template>

<script>
  import mtHeader from '@/components/header/HeaderLogin.vue'
  export default {
    data(){
      return {}
    },
    components:{
      mtHeader
    },
    methods:{
      
    }
  }
</script>

<style>
  .local-song {
    height: 600px;
    padding-top: 40px;
  }
  .local-song .nolocal{
    text-align: center;
    position: absolute;
    top: 50%;
    left: 50%;
    margin-top: -73px;
    margin-left: -100px;
  }
  .local-song .nolocal >span.iconfont {
    font-size: 80px;
    color:rgba(255,255,255,.7);
  }
  .local-song .nolocal .local-subtitle {
    margin-top: 20px;
    color: rgba(255,255,255,.7);
  }
  .local-song .nolocal .local-href {
    display: block;
    width: 200px;
    height: 50px;
    line-height: 50px;
    text-align: center;
    background: rgba(255,215,0,.8);
    border-radius: 30px;
    color: #fff;
    margin: 0 auto;
  }
</style>