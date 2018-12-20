const express = require("express");
var router = express.Router();
const pool = require("../pool.js");
const multer = require("multer");
const fs = require("fs");


//功能一：注册
router.post("/register",(req,res)=>{
  var uname = req.body.uname;
  var upwd = req.body.upwd;
  var avatar = 'img/person/'+req.body.avatar;

  var sql = 'INSERT INTO user VALUES(NULL,?,?,?)';
  pool.query(sql,[uname,upwd,avatar],(err,result)=>{
    if(result!=null){
      res.send({code:1})
    }else{
      res.send({code:-1})
    }
  })
});

//功能二：登录
router.post("/login",(req,res)=>{
  var uname = req.body.uname;
  var upwd = req.body.upwd;
  var sql = `SELECT uid,uname,upwd,avatar FROM user WHERE uname=?`;
  pool.query(sql,[uname],(err,result)=>{
    if(err) throw err;
    if(result!=null)
      res.send({code:1,msg:result})
    else
      res.send({code:-1});
  })
})

//功能三：是否登录成功
router.post("/signin",(req,res)=>{
  var uid = req.body.uid;
  var sql = "SELECT uid,uname,upwd,avatar FROM user WHERE uid=?";
  pool.query(sql,[uid],(err,result)=>{
    if(err) throw err;
    if(result!=null)
      res.send({code:1,msg:result})
    else
      res.send({code:-1})
  })
})

//创建上传文件对象，并确定保存的目录
var upload = multer({dest: './public/img/person/'});

//功能四：当改变图片时，保存在服务器端
router.post("/upload",upload.single("mypic"),(req,res)=>{
  var file = req.file; 
  console.log(req.file);
  //创建新文件名
    //获取原有文件名后缀 1.jpg
    var srcFile = file.originalname;
    var i1 = srcFile.lastIndexOf(".");
    var len = srcFile.length;
    var suffix = srcFile.substring(i1,len);
    // //时间戳+随机数+后缀
    var fileName = new Date().getTime()+Math.floor(Math.random()*9999)+suffix
    var newFileName = './public/img/person/'+fileName;
  //将临时文件移动upload目录
    //fs.renameSync() 阻塞(同步)
    fs.renameSync(file.path,newFileName);
    res.send({code:1,msg:fileName});
})


module.exports = router;