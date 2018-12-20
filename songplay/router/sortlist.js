const express = require("express");
var router = express.Router();
const pool = require("../pool.js");

//功能一：按播放量分页查询
router.get("/list",(req,res)=>{
  var pno=req.query.pno;
  var pageSize = req.query.pageSize;
  if(!pno){
    pno=1;
  }
  pno = parseInt(pno);
  if(!pageSize){
    pageSize = 16;
  }
  pageSize = parseInt(pageSize);
  offset = parseInt((pno-1)*pageSize);
  var sql = 'SELECT sid,songtitle,songsubtitle,song_url,gid,playcount FROM songs ORDER BY playcount desc LIMIT ?,?';
  pool.query(sql,[offset,pageSize],(err,result)=>{
    if(err) throw err;
    if(result.length>0)
      res.send({code:1,msg:result});
    else
      res.send({code:0});
  })
});


module.exports = router;