//留言列表
//1:引入需要的模块
const express = require("express");
const pool = require("../pool");
//2:创建路由对象
var router = express.Router();

//3:分页查询留言列表
router.get("/list",(req,res)=>{
  //3.1:获取参数：nid新闻编号，pno页码
  var nid = parseInt(req.query.nid);
  var pno = req.query.pno;
  //3.1.1:为页码设置一个默认值
  if(!pno){
    pno = 1;
  }
  
  var pageSize = 3;
  var offset = (pno-1)*pageSize;

  //3.2:创建正则表达式验证参数是否正确  阻止危险字符进入数据库
  var reg = /^[0-9]+$/i;
  if(!reg.test(pno)){
    res.send({code:-1,msg:"页码格式有误"});
    return;
  }
  if(!reg.test(nid)){
    res.send({code:-1,msg:"用户id有误"});
    return;
  }

  
  //3.3:创建sql语句
  var sql = "SELECT cid,user_name,add_time,content,nid FROM comment WHERE nid=? LIMIT ?,?";
  pool.query(sql,[nid,offset,pageSize],(err,result)=>{
    if(err) throw err;
    if(result!=null)
      res.send({code:1,msg:result});
    else
      res.send({code:0});
  });
})

//4:发表留言
router.get("/postcomment",(req,res)=>{
  //1:参数 nid content user_name
  var nid = req.query.nid;
  var content = req.query.content;
  var user_name = req.query.user_name;

  var sql = "INSERT INTO comment (user_name,add_time,content,nid) VALUES(?,now(),?,?)";
  pool.query(sql,[user_name,content,nid],(err,result)=>{
    if(err) throw err;
    res.send({code:1,msg: "发表成功"});
  })
})

router.get("/test",(req,res)=>{

})

//5:将路由对象导出
module.exports = router;