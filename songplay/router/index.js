//1.引入模块 express
const express = require("express");
//2.创建对象 router 引入连接池
const pool = require("../pool.js");
var router = express.Router();


//图片轮播查询列表
router.get("/list",(req,res)=>{
  //参数 无参数
  //sql 
  var sql = `SELECT cid,pic_url,title from carousel_pic`;
  //返回数据格式
  
  pool.query(sql,[],(err,result)=>{
    if(err) throw err;
    if(result==null)
      res.send({code: -1})
    else
      res.send({code:1,msg:result}); //将结果返回给客户端
  })
});

//图片信息列表
router.get("/menuinfo",(req,res)=>{
  var sql = "SELECT sid,title,playcount,img_url FROM songmenu";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    if(result!=null)
      res.send({code:1,msg:result}); 
    else
      res.send({code:0})
  })
})

//4.导出模块
module.exports = router;