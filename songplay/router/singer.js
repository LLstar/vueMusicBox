//留言列表
//1:引入需要的模块
const express = require("express");
const pool = require("../pool");
//2:创建路由对象
var router = express.Router();

//3:热门歌手列表
router.get("/list",(req,res)=>{
  var sql = "SELECT gid,name,fans,avatar FROM singer";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    if(result!=null)
      res.send({code:1,msg:result});
    else
      res.send({code:-1})
  })
})

//4:添加收藏
router.post("/add",(req,res)=>{
  var uid = req.body.uid;
  var gid = req.body.gid;
  var sql = "INSERT INTO islove VALUES(null,?,?)";
  pool.query(sql,[gid,uid],(err,result)=>{
    if(err) throw err;
    res.send({code:1});
  })
})

//5:取消收藏
router.post("/remove",(req,res)=>{
  var uid = req.body.uid;
  var gid = req.body.gid;
  var sql = "DELETE FROM islove WHERE uid=? and gid=?";
  pool.query(sql,[uid,gid],(err,result)=>{
    if(err) throw err;
    res.send({code:1});
  })
})

//6:获取用户登录后的歌手列表
router.get("/favoriteList",(req,res)=>{
  var uid = req.query.uid;
  var sql = "SELECT gid FROM islove WHERE uid=?";
  pool.query(sql,[uid],(err,result)=>{
    if(err) throw err;
    if(result!=null){
      res.send({code:1,msg:result});
    }else{
      res.send({code:0})
    }
  })
})

//7:查找该用户是否收藏了该歌手
router.get("/singerInfo",(req,res)=>{
  var uid = req.query.uid;
  var gid = req.query.gid;
  var sql = "SELECT gid FROM islove WHERE uid=? and gid=?";
  pool.query(sql,[uid,gid],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1})
    }else{
      res.send({code:0})
    }
  })
})

//8:华语歌手列表
router.get("/singerZH",(req,res)=>{
  var sql = "SELECT gid,name,fans,avatar FROM singer where category=0";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,msg:result});
    }else{
      res.send({code:0})
    }
  })
})

//9:欧美歌手列表
router.get("/singerUSA",(req,res)=>{
  var sql = "SELECT gid,name,fans,avatar FROM singer where category=1";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,msg:result});
    }else{
      res.send({code:0})
    }
  })
})

//10:日韩歌手列表
router.get("/singerK",(req,res)=>{
  var sql = "SELECT gid,name,fans,avatar FROM singer where category=2";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,msg:result});
    }else{
      res.send({code:0})
    }
  })
})


//将路由对象导出
module.exports = router;