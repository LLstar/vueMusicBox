const express = require("express");
const pool=require("../pool");
var router = express.Router();

//用户的收藏列表
router.get("/list",(req,res)=>{
  var uid = req.query.uid;
  var list=[];
  var sql = "SELECT gid FROM islove WHERE uid=?";
  pool.query(sql,[uid],(err,result)=>{
    if(err) throw err;
    //获取该用户下共收藏了几个歌手，将查询到的结果赋值给一个数组
    var arr1 = result;
    result.forEach((el,i,arr)=>{
      var gid = el.gid;
      var sql = "SELECT name,fans,avatar,gid FROM singer where gid=?";
      pool.query(sql,[gid],(err,result)=>{
        if(err) throw err;
        //创建一个数组用来接收遍历到的数据，当gid为当前数组中的最后一个gid时把数据返回
        list.push(result[0]);
        //判断该用户收藏的歌手跟拼接的数组长度是否相等，如果相等就把数据发送过去
        if(arr1.length == list.length){
          //将获取到的数据截取一下，返回一个新的数组返回
          //console.log(list);
          res.send({code:1,msg:list});
        }
      })
    })
  })
})

//获取用户收藏的数量
router.get("/favoriteCount",(req,res)=>{
  var uid = req.query.uid;
  var sql = "SELECT count(gid) as count FROM islove WHERE uid=?";
  pool.query(sql,[uid],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,msg:result});
    }else{
      res.send({code:0});
    }
  })
})

module.exports = router;
