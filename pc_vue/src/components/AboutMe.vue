<template>
  <div class="aboutMe">
    <mt-header fixed title="关于我们">
      <a @click="back" slot="left">
        <mt-button icon="back"></mt-button>
      </a>
    </mt-header>
    <el-collapse v-model="activeName" accordion>
      <el-collapse-item title="用户服务" name="1">
        <div>本音乐播放器是运用自己的数据系统通过互联网向用户提供音乐服务，例如视频、音频、歌单以及搜索服务等；</div>
        <div>用户在播放器中发布信息(包括注册用户名)时，必须遵守国防有关法律规定，并承担因自己发布不良信息导致的法律责任。</div>
      </el-collapse-item>
      <el-collapse-item title="隐私政策" name="2">
        <div>本音乐播放器是本人的仿写项目，对于网站的服务并没有特别周全的考虑；</div>
        <div>因此某些个人信息因其特殊性可能被认为是敏感信息，如有触犯，请勿介意。</div>
      </el-collapse-item>
      <el-collapse-item title="权利声明" name="3">
        <div>此版本适用于某些移动端设备，如在其他品牌或型号的设备上使用出现问题，敬请谅解；</div>
        <div>本app的数据均来自同一数据库，因终端、系统、软件不同，其表现形式可能会有差异，此非本人可控制。</div>
      </el-collapse-item>
      <el-collapse-item title="知识产权" name="4">
        <div>本app是基于当前主流的音乐播放器仿写而来，如有相似的地方，请谅解；</div>
        <div>此app只是本人的个人项目，不会以营利为目的而发布，如有雷同，纯属虚构。</div>
      </el-collapse-item>
    </el-collapse>
    <p>听音乐问题请联系</p>
    <p>QQ:552117379 微信:15736950550</p>
    <p>看视频问题请联系</p>
    <p>QQ:552117379 微信:15736950550</p>
    <span>Copyright&nbsp;&copy;2018</span>
  </div>
</template>

<script>

  export default {
    data(){
      return {
        activeName: '1'
      }
    },
    created(){
      
    },
    methods:{
      handleChange(val) {
        console.log(val);
      },
      back(){
        this.$router.push('/home');
      }
    },
    mounted(){
      
    }
  }
</script>

<style>
  .aboutMe {
    padding-top:40px;
    height: 600px;
  }
  .aboutMe .mint-header {
    background: #647077;
    color: #fff;
    width: 100%;
    height: 40px;
    position: fixed;
    top: 0;
    left: 0;
    font-size: 16px;
  }
  .aboutMe .el-collapse {
    width: 375px;
    margin: 0 auto;
    background: rgba(0,0,0,.2);
    overflow: hidden;
    padding: 10px;
    border: none;
    margin-bottom: 20px;
  }
  .aboutMe .el-collapse .el-collapse-item__header {
    background-color: rgba(0,0,0,0);
    font-size: 20px;
    color: #fff;
    border: none;
  }
  .aboutMe .el-collapse .el-collapse-item__wrap {
    background-color: rgba(0,0,0,0);
    border: none;
    padding: 0 10px;
    
  }
  .aboutMe .el-collapse .el-collapse-item__content {
    color: #f5f5f5;
    font-size: 15px;
  }
  .aboutMe > p {
    text-align: center;
    color: #c5c5c5;
  }
  .aboutMe > span {
    text-align: center;
    color: #c5c5c5;
    display: block;
    margin-top: 20px;
    font-size: 14px;
  }
</style>