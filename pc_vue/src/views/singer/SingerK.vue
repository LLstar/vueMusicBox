<template>
  <div class="singerK">
    <!--歌手界面头部-->
    <HeaderBack></HeaderBack>
    <!--热门歌手-->
    <div class="hot-singer">
      <ul class="mui-table-view">
        <li class="mui-table-view-cell mui-media" v-for="singer in singerlist" :key="singer.gid">
          <router-link :to="'/singerinfo/'+singer.gid">
            <img class="mui-media-object mui-pull-left" :src="singer.avatar | resouceFilter">
            <div class="mui-media-body">
              <div class="mui-pull-left">
                <p>{{singer.name}}</p>
                <p class='mui-ellipsis'>粉丝：{{singer.fans}}万</p>
              </div>
              <span :data-show="singer.gid" class="mui-pull-right is-heart hidden" @click="addLove(singer.gid,$event)">
                已收藏
              </span>
              <span class="mui-pull-right no-heart" @click="addLove(singer.gid,$event)">
                +&nbsp;&nbsp;收藏
              </span>
            </div>
          </router-link>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
  import HeaderBack from '@/components/header/HeaderLogin.vue'
  import {Toast} from "mint-ui"
  export default {
    data(){
      return {
        singerlist:[],
        gidlist:[]
      }
    },
    components: {
      HeaderBack
    },
    created(){
      this.getSinger();
    },
    methods:{
      getSinger(){
        this.$http.get("singer/singerK")
        .then(res=>{
          if(res.body.code == 1){
            this.singerlist = res.body.msg;
            if(window.uid){
              this.$http.get("singer/favoritelist",{params:{uid:window.uid}})
              .then(res=>{
                if(res.body.code == 1){
                  this.gidlist = res.body.msg;
                  //console.log(this.gidlist);
                  this.gidlist.forEach((el,i,arr)=>{
                    for(var item of this.singerlist){
                      if(el.gid == item.gid){
                        //自定义一个属性，来保存当前的gid的值，来改变当前元素的显示隐藏
                        document.querySelector(`.hot-singer [data-show='${item.gid}']`).className="mui-pull-right is-heart";
                        document.querySelector(`.hot-singer [data-show='${item.gid}']`).nextElementSibling.className="mui-pull-right no-heart hidden";
                      }
                    }
                  })
                }
              })
            }
          }else{
            Toast("获取歌手信息失败");
          }
        })
      },
      addLove(id,$event){
        $event.preventDefault();
        if(window.uid){
          //当用户登录之后先去查询一下，该用户收藏了哪些歌手，将这些歌手的状态变为已收藏
          //先判断，如果该歌手已被收藏就不需要再添加数据，如果没有收藏，点击的时候再添加数据
          this.$http.get("singer/singerInfo",{params:{uid:window.uid,gid:id}})
          .then(res=>{
            if(res.body.code == 0){
              //如果用户收藏的列表中没有该歌手，就添加收藏
              this.$http.post("singer/add",{uid:window.uid,gid:id},{emulateJSON:true})
              .then(res=>{
                if(res.body.code == 1){
                  Toast("收藏成功");
                  $event.target.className = "mui-pull-right no-heart hidden";
                  $event.target.previousElementSibling.className = "mui-pull-right is-heart";
                }
              })
            }else if(confirm("取消收藏后就不能第一时间收到该艺人的新歌通知了，确定吗？")){
                //否则就取消收藏
                this.$http.post("singer/remove",{uid:window.uid,gid:id},{emulateJSON:true})
                .then(res=>{
                  if(res.body.code == 1){
                    $event.target.className = "mui-pull-right is-heart hidden";
                    $event.target.nextElementSibling.className = "mui-pull-right no-heart";
                  }
                })
              }
            })
        }else{
          Toast("请先登录");
          this.$router.push("/login");
        }
      }
      
    }
  }
</script>

<style>
  .singerK {
    padding-top: 40px;
    height: 600px;
  }
  .singerK>.hot-singer {
      margin-top: 20px;
      padding: 10px 0;
  }
  .singerK>.hot-singer>.mui-table-view {
    background: rgba(255,255,255,0);
    border: none;
  }
  .singerK>.hot-singer>.mui-table-view>.mui-table-view-cell .mui-media-object {
    max-width: 65px;
    height: 65px;
    line-height: 65px;
    border-radius: 50%;
  }
  .singerK>.hot-singer>.mui-table-view>.mui-table-view-cell .mui-media-body {
    margin-top: 10px;
  }
  .singerK>.hot-singer>.singer-title {
    margin: 0;
    margin-left: 15px;
    color: gold;
    font-weight: bold;
  }
  .singerK>.hot-singer .mui-media-body>div.mui-pull-left>p:first-child {
    color: #fff;
    width: 95px;
    white-space: nowrap;
    overflow: hidden;
  }
  .singerK>.hot-singer .mui-media-body>div.mui-pull-left>p.mui-ellipsis {
    color: #ccc;
  }
  .singerK>.hot-singer>.mui-table-view:before,
  .singerK>.hot-singer>.mui-table-view:after,
  .singerK>.hot-singer>.mui-table-view .mui-table-view-cell:after {
    height:0;
  }
  .singerK>.hot-singer .mui-media-body>span.mui-pull-right.is-heart{
    float: right;
    display: block;
    width: 78px;
    height: 30px;
    border: 1px solid #fff;
    font-size: 14px;
    text-align: center;
    line-height: 30px;
    color: #fff;
    margin-top: 5px;
  }
  .singerK>.hot-singer .mui-media-body>span.mui-pull-right.no-heart{
    float: right;
    display: block;
    width: 78px;
    height: 30px;
    border: 1px solid gold;
    font-size: 14px;
    text-align: center;
    line-height: 30px;
    color: gold;
    margin-top: 5px;
  }
  .singerK>.hot-singer .mui-media-body>span.mui-pull-right.hidden {
    display: none;
  }
</style>