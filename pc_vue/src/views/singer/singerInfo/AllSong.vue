<template>
  <div class="all-song">
    <ul class="song-demo">
      <li class="demo-item" v-for="album in albumlist" :key="album.aid">
        <img :src="album.album_url | resouceFilter">
        <p class="item-title">{{album.title}}</p>
        <span class="item-date">{{album.time | dateTimeFilter}}</span>
      </li>
    </ul>
  </div>
</template>

<script>

  export default {
    data(){
      return {
        albumlist:[]
      }
    },
    created(){
      this.getAlbum();
    },
    methods:{
      getAlbum(){
        this.$http.get("album/list",{params:{gid:this.id}})
        .then(res=>{
            if(res.body.code == 1){
              this.albumlist = res.body.msg;
            }
        })
      }
    },
    props:["id"]
  }
</script>

<style>
  .all-song {
    height: 100%;
  }
  .song-demo {
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: space-between;
    padding: 10px;
    flex-wrap: wrap;
  }
  .song-demo .demo-item {
    width: 30%;
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  .song-demo .demo-item img {
    width: 100%;
  }
  .song-demo .demo-item .item-title {
    margin: 5px 0;
    font-size: 15px;
    color: #fff;
  }
  .song-demo .demo-item .item-date {
    font-size: 14px;
    color: #ccc;
  }
</style>