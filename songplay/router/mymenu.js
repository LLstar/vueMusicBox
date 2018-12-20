const express = require("express");
var router = express.Router();
const pool = require("../pool.js");

//功能一：收藏到我的歌单
router.post("/addmenu",(req,res)=>{
  var uid = req.body.uid;
  var sid = req.body.sid;
  var sql = "INSERT INTO mymenu VALUES(null,?,?)";
  pool.query(sql,[sid,uid],(err,result)=>{
    if(err) throw err;
    if(result.length>0)
      res.send({code:1})
    else
      res.send({code:0})
  })
});

//功能二：取消收藏
router.post("/removemenu",(req,res)=>{
  var uid = req.body.uid;
  var sid = req.body.sid;
  var sql = "DELETE FROM mymenu WHERE uid=? and sid=?";
  pool.query(sql,[uid,sid],(err,result)=>{
    if(err) throw err;
    if(result.length>0)
      res.send({code:1})
    else
      res.send({code:0})
  })
})

//功能三：先查询该用户是否有收藏的歌曲
router.get("/haslist",(req,res)=>{
  var uid = req.query.uid;
  var sid = req.query.sid;
  var sql = "SELECT mid,sid,uid FROM mymenu WHERE uid=? and sid=?";
  pool.query(sql,[uid,sid],(err,result)=>{
    if(err) throw err;
    if(result.length>0)
      res.send({code:1,msg:result})
    else
      res.send({code:0})
  })
})

//功能四：获取我的歌单列表
router.get("/menulist",(req,res)=>{
  var uid = req.query.uid;
  var sql = "SELECT mid,sid,uid FROM mymenu WHERE uid=?";
  pool.query(sql,[uid],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      var arr = result;
      var list = [];
      result.forEach((el,i,arr)=>{
        var sid = el.sid;
        var sql = "SELECT sid,songtitle,songsubtitle,song_url,gid FROM songs WHERE sid=?";
        pool.query(sql,[sid],(err,result)=>{
          list.push(result[0]);
          if(arr.length == list.length){
            res.send({code:1,msg:list});
          }
        })
      })
    }
  })
})

module.exports = router;