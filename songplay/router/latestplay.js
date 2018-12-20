const express = require("express");
var router = express.Router();
const pool = require("../pool.js");

//功能一：添加播放的歌曲
router.get("/add",(req,res)=>{
  var sid = req.query.sid;
  var sql = 'INSERT INTO playsong VALUES(null,?)';
  pool.query(sql,[sid],(err,result)=>{
    if(err) throw err;
    res.send({code:1});
  })
});

//功能二：查找是否存在该歌曲
router.get('/isexists',(req,res)=>{
  var sid = req.query.sid;
  var sql = "SELECT lid,sid FROM playsong WHERE sid=?";
  pool.query(sql,[sid],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,msg:result})
    }else{
      res.send({code:0})
    }
  })
})

//功能三：查询歌曲列表
router.get('/songlist',(req,res)=>{
  var sql = "SELECT lid,playsong.sid,(SELECT songtitle FROM songs WHERE songs.sid=playsong.sid limit 1) as songtitle,(SELECT songsubtitle FROM songs WHERE songs.sid=playsong.sid limit 1) as songsubtitle,(SELECT song_url FROM songs WHERE songs.sid=playsong.sid limit 1) as song_url FROM playsong inner join songs on songs.sid=playsong.sid";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,msg:result});
    }else{
      res.send({code:0})
    }
  })
})

//功能四：添加播放的视频
router.get("/addvedio",(req,res)=>{
  var mid = req.query.mid;
  var sql = 'INSERT INTO playvedio VALUES(null,?)';
  pool.query(sql,[mid],(err,result)=>{
    if(err) throw err;
    res.send({code:1});
  })
});

//功能五：查找是否存在该视频
router.get('/isvedio',(req,res)=>{
  var mid = req.query.mid;
  var sql = "SELECT lid,mid FROM playvedio WHERE mid=?";
  pool.query(sql,[mid],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,msg:result})
    }else{
      res.send({code:0})
    }
  })
})

//功能六：查找已经存在的视频列表
router.get('/vediolist',(req,res)=>{
  var sql = "SELECT lid,playvedio.mid,(SELECT mv_url FROM mv WHERE mv.mid=playvedio.mid limit 1) as mv_url,(SELECT poster FROM mv WHERE mv.mid=playvedio.mid limit 1) as poster,(SELECT mv.gid FROM mv WHERE mv.mid=playvedio.mid limit 1) as gid,(SELECT name FROM singer WHERE singer.gid = mv.gid limit 1) as name,(SELECT avatar FROM singer WHERE singer.gid = mv.gid limit 1) as avatar,(SELECT title FROM mv WHERE mv.mid=playvedio.mid limit 1) as title,(SELECT zan FROM mv WHERE mv.mid=playvedio.mid limit 1) as zan FROM playvedio inner join mv on playvedio.mid=mv.mid";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,msg:result});
    }else{
      res.send({code:0})
    }
  })
})


//功能七：查询最近播放的视频跟歌曲的数量
router.get('/count',(req,res)=>{
  var sql = 'SELECT count(lid) as songcount FROM playsong';
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    var count = 0;
    if(result.length>0){
      count += result[0].songcount;
      var sql = 'SELECT count(lid) as vediocount FROM playvedio';
      pool.query(sql,(err,result)=>{
        count += result[0].vediocount;
        res.send({code:1,msg:count})
      })
    }
    else
      res.send({code:0})
  })
})


module.exports = router;