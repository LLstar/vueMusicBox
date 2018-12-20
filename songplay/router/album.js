const express = require("express");
var router = express.Router();
const pool = require("../pool.js");

//功能一：专辑的列表
router.get("/list",(req,res)=>{
  var gid = req.query.gid;
  var sql = 'SELECT aid,title,time,album_url,gid FROM album WHERE gid=?';
  pool.query(sql,[gid],(err,result)=>{
    if(err) throw err;
    if(result.length>0)
      res.send({code:1,msg:result});
    else
      res.send({code:0});
  })
});


module.exports = router;