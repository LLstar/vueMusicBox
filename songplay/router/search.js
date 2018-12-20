const express = require("express");
const pool = require("../pool");
var router = express.Router();

//查询
router.get("/",(req,res)=>{
  var kw = req.query.kw;
  //小酒窝 林俊杰
  var kws = kw.split(" ");
  //["小酒窝","林俊杰"]
  kws.forEach((el,i,arr)=>{
    arr[i] = `song_url like '%${el}%'`;
  })

  /*[
      song_url like %小酒窝%,
      song_url like %林俊杰%
  ]*/
  //join(" and ")
  var where = kws.join(" and ");
  //song_url like %小酒窝% and song_url like %林俊杰%
  var sql = `SELECT sid,songtitle,songsubtitle,song_url,gid,playcount FROM songs WHERE ${where}`;
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,msg:result});
    }else{
      res.send({code:0})
    }
  })
})


module.exports = router;