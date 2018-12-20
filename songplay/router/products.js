const express = require("express");
const pool = require("../pool");
var router = express.Router();

//1:分页查询商品的列表
router.get("/list",(req,res)=>{
  var pno = parseInt(req.query.pno);   //当前页码
  var pageSize = parseInt(req.query.pageSize);   //页大小
  if(!pno)
    pno = 1;
  if(!pageSize)
    pageSize = 3;
  
  var sql = "SELECT lid,title,price_old,price_new,lname,stock,img_url FROM products LIMIT ?,?";
  pool.query(sql,[pageSize*(pno-1),pageSize],(err,result)=>{
    if(err) throw err;
    if(result!=null)
      res.send({code:1,msg:result})
    else
      res.send({code:0})
  })
});

//2:依据指定商品编号查询商品详细信息
router.get('/find',(req,res)=>{
  var lid = req.query.lid;
  var sql = "select lid,title,price_old,price_new,lname,stock,img_url,(select img1 from carousel_pic where products.lid=carousel_pic.lid limit 1) as img1,(select img2 from carousel_pic where products.lid=carousel_pic.lid limit 1) as img2,(select img3 from carousel_pic where products.lid=carousel_pic.lid limit 1) as img3,(select img4 from carousel_pic where products.lid=carousel_pic.lid limit 1) as img4 from products  where lid=?";
  pool.query(sql,[lid],(err,result)=>{
    if(err) throw err;
    if(result!=null)
      res.send({code:1,msg:result})
    else
      res.send({code:0})
  })
})


module.exports = router;