const express = require("express");
var router = express.Router();
const pool = require("../pool.js");

//功能一：新闻列表
router.get("/list",(req,res)=>{
  var sql = `SELECT nid,title,add_time,click,img_url,content FROM newslist`;
  pool.query(sql,[],(err,result)=>{
    if(err) throw err;
    if(result!=null){
      res.send({code:1,msg:result})
    }else
      res.send({code:-1});
  })
});

//功能二：新闻详细信息
router.get("/details",(req,res)=>{
  var $nid = req.query.nid;
  var sql = `SELECT nid,title,add_time,click,img_url,content FROM newslist WHERE nid=?`;
  pool.query(sql,[$nid],(err,result)=>{
    if(err) throw err;
    if(result!=null)
      res.send({code:1,msg:result})
    else
      res.send({code:-1});
  })
})

module.exports = router;