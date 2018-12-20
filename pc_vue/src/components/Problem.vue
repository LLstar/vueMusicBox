<template>
  <div class="problem">
    <mt-header fixed title="问题反馈">
      <router-link to="/home" slot="left">
        <mt-button icon="back"></mt-button>
      </router-link>
    </mt-header>
    <h3>问题类型</h3>
    <ul class="problem-list">
      <li class="problem-item">建议</li>
      <li class="problem-item">歌词</li>
      <li class="problem-item">音乐包</li>
      <li class="problem-item">视频</li>
      <li class="problem-item">功能异常</li>
      <li class="problem-item">违规信息</li>
      <li class="problem-item">其他</li>
    </ul>
    <textarea placeholder="输入您想反馈的问题... ..."></textarea>
    <h3>添加相关图片</h3>
    <el-upload
      class="avatar-uploader"
      action="https://jsonplaceholder.typicode.com/posts/"
      :show-file-list="false"
      :on-success="handleAvatarSuccess"
      :before-upload="beforeAvatarUpload">
      <img v-if="imageUrl" :src="imageUrl" class="avatar">
      <i v-else class="el-icon-plus avatar-uploader-icon"></i>
    </el-upload>
    <button class="submit" @click="submit">提交</button>
  </div>
</template>

<script>
  import {Toast} from 'mint-ui'
  export default {
    data(){
      return {
        imageUrl: ''
      }
    },
    methods:{
      handleAvatarSuccess(res, file) {
        this.imageUrl = URL.createObjectURL(file.raw);
      },
      beforeAvatarUpload(file) {
        const isJPG = file.type === 'image/jpeg';
        const isLt2M = file.size / 1024 / 1024 < 2;

        if (!isJPG) {
          this.$message.error('上传头像图片只能是 JPG 格式!');
        }
        if (!isLt2M) {
          this.$message.error('上传头像图片大小不能超过 2MB!');
        }
        return isJPG && isLt2M;
      },
      submit(e){
        if(e.target.previousElementSibling.previousElementSibling.previousElementSibling.value){
          e.target.previousElementSibling.previousElementSibling.previousElementSibling.value = "";
          Toast("提交成功");
        }else{
          Toast("请输入要反馈的问题");
        }
        
      }
    }
  }
</script>

<style>
  .problem {
    padding-top:40px;
    background: #fff;
    height: 615px;
  }
  .problem .mint-header {
    background: #647077;
    color: #fff;
    width: 100%;
    height: 40px;
    position: fixed;
    top: 0;
    left: 0;
    font-size: 16px;
  }
  .problem h3 {
    font-size: 20px;
    margin-top: 20px;
    margin-left: 20px;
  }
  .problem .problem-list {
    list-style: none;
    padding: 10px 20px;
    margin: 0;
    display: flex;
    justify-content: start;
    flex-wrap: wrap;
  }
  .problem .problem-list .problem-item {
    width: 30%;
    height: 35px;
    line-height: 35px;
    text-align: center;
    border: 1px solid #666;
    border-radius: 20px;
    font-size: 15px;
    margin-left: 5px;
    margin-bottom: 8px;
    color: #333;
  }
  .problem textarea {
    width: 334px;
    height: 120px;
    margin: 0 auto;
    display: block;
    background: #f3f3f3;
    border:none;
  }
  .avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
    margin-left: 20px;
    margin-top: 10px;
  }
  .avatar-uploader .el-upload:hover {
    border-color: #409EFF;
  }
  .avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 110px;
    height: 100px;
    text-align: center;
    line-height: 100px !important;
    background: #f3f3f3;
    
  }
  .avatar {
    width: 110px;
    height: 100px;
    display: block;
  }
  .problem button.submit {
    display: block;
    width: 255px;
    height: 35px;
    background: gold;
    line-height: 36px;
    margin: 0 auto;
    text-align: center;
    padding: 0;
    border: 0;
    margin-top: 20px;
  }
</style>