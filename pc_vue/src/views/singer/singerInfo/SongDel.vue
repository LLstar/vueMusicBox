<template>
  <div class="songdel">
    <div class="singer-details">
      <ul>
        <li>姓名：{{intrlist.gname}}</li>
        <li>别名：{{intrlist.alias}}</li>
        <li>语言：{{intrlist.language}}</li>
        <li>生日：{{intrlist.birthday | dateTimeFilter}}</li>
        <li>身高：{{intrlist.height}}</li>
      </ul>
      <ul>
        <li>性别：{{intrlist.sex | sexFilter}}</li>
        <li>国籍：{{intrlist.nation}}</li>
        <li>出生地：{{intrlist.homeplace}}</li>
        <li>星座：{{intrlist.xingzuo}}</li>
        <li>体重：{{intrlist.weight}}</li>
      </ul>
    </div>
    <p class="singer-content">{{intrlist.details}}</p>
    <p class="singer-content">{{intrlist.symbol}}</p>
  </div>
</template>

<script>
  import Vue from "vue";
  Vue.filter("sexFilter",function(val){
    if(val == 1){
      return "男";
    }else if(val == 0){
      return "女";
    }else{
      return "组合";
    }
  });
  export default {
    data(){
      return {
        intrlist:{}
      }
    },
    created(){
      this.getDetails();
    },
    methods:{
      getDetails(){
        this.$http.get("songs/introduce",{params:{gid:this.id}})
        .then(res=>{
          if(res.body.code == 1){
            this.intrlist = res.body.msg[0];
          }
        })
      }
    },
    props:["id"]
  }
</script>

<style>
  .songdel {
    height: 100%;
  }
  .songdel .singer-details {
    display: flex;
    justify-content: space-around;
    padding-bottom: 20px;
    font-size: 14px;
    color: #fff;
  }

  .songdel .singer-details>ul {
    list-style: none;
    padding: 0;
    margin: 0;
  }
  .songdel .singer-details>ul>li {
    margin-top: 5px;
    width: 140px;
    padding: 5px;
  }
  .songdel .singer-details>ul>li:nth-child(odd){
    background: rgba(0,0,0,.3);
  }
  .songdel .singer-content {
    margin: 10px;
    color: #fff;
    font-size: 14px;
  }
</style>