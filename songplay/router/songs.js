const express = require("express");
const pool = require("../pool");
var router = express.Router();

//获得每个歌手的详细信息
router.get("/singerDetails",(req,res)=>{
  var gid = req.query.gid;
  var sql = "SELECT gid,name,fans,avatar FROM singer WHERE gid=?";
  pool.query(sql,[gid],(err,result)=>{
    if(err) throw err;
    if(result.length>0)
      res.send({code:1,msg:result});
    else
      res.send({code:0})
  })
})

//获取歌手的歌曲列表
router.get("/songlist",(req,res)=>{
  var gid = req.query.gid;
  var sql = "SELECT sid,songtitle,songsubtitle,song_url,gid FROM songs WHERE gid=?";
  pool.query(sql,[gid],(err,result)=>{
    if(err) throw err;
    if(result.length>0)
      res.send({code:1,msg:result});
    else
      res.send({code:0});
  })
});

//获取歌手的简介信息
router.get("/introduce",(req,res)=>{
  var gid = req.query.gid;
  var sql = "SELECT iid,gname,sex,alias,nation,language,homeplace,birthday,xingzuo,height,weight,details,symbol,gid FROM introduce WHERE gid=?";
  pool.query(sql,[gid],(err,result)=>{
    if(err) throw err;
    if(result.length>0)
      res.send({code:1,msg:result});
    else
      res.send({code:0})
  })
})

//获得歌手的mv视频
router.get("/mvDetail",(req,res)=>{
  var gid = req.query.gid;
  var sql = 'SELECT mid,mv_url,poster,gid,title,zan,(SELECT name FROM singer WHERE gid=? limit 1) as name,(SELECT avatar FROM singer WHERE gid=? limit 1) as avatar FROM mv WHERE gid=?';
  pool.query(sql,[gid,gid,gid],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,msg:result});
    }else{
      res.send({code:0});
    }
  })
})
module.exports = router;