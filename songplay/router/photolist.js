const express = require("express");
const pool = require("../pool");
var router = express.Router();

router.get("/list",(req,res)=>{
  var sql = "SELECT tid,title,path FROM t_photo";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    if(result!=null)
      res.send({code:1,msg:result})
    else
      res.send({code:0})
  })
})



module.exports = router;
