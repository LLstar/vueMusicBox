const express = require("express");
const pool = require("../pool");
var router = express.Router();

//获得mv列表
router.get("/mvlist",(req,res)=>{
  var pno = parseInt(req.query.pno);
  var pageSize = parseInt(req.query.pageSize);
  if(!pno){
    pno = 1;
  }
  if(!pageSize){
    pageSize = 8;
  }

  var offset = parseInt((pno-1)*pageSize);

  var sql = 'SELECT mid,mv_url,poster,mv.gid,title,zan,(SELECT name FROM singer where singer.gid=mv.gid limit 1) as name,(SELECT avatar FROM singer where singer.gid=mv.gid limit 1) as avatar FROM mv inner join singer on mv.gid=singer.gid order by zan desc limit ?,?';
  pool.query(sql,[offset,pageSize],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,msg:result});
    }else{
      res.send({code:0});
    }
  })
})


module.exports = router;