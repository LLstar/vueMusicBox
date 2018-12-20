const express = require("express");
const bodyParser = require("body-parser");
//引入解决跨域的模块
const cors = require("cors");
//加载路由模块   路由：请求方式+请求地址+处理函数
var index = require("./router/index");
var user = require("./router/user");
var singer = require("./router/singer");
var favorite = require("./router/favorite");
var songs = require("./router/songs");
var mymenu = require("./router/mymenu");
var album = require("./router/album");
var sortlist = require("./router/sortlist");
var mvlist = require("./router/mvlist");
var latestplay = require("./router/latestplay");
var search = require("./router/search");

var app = express();
app.listen(3001);

//利用cors模块解决跨域问题
app.use(cors({
  origin:["http://localhost:8080","http://127.0.0.1:8080","http://172.242.10.36:8080","http://localhost:8081","http://172.242.10.58:8080"],
  credentials: true
}))
app.use(bodyParser.urlencoded({extended:false}));
app.use(express.static(__dirname+"/public"));

//挂载路由模块
app.use("/index",index);
app.use("/user",user);
app.use("/singer",singer);
app.use("/favorite",favorite);
app.use("/songs",songs);
app.use("/mymenu",mymenu);
app.use("/album",album);
app.use("/sortlist",sortlist);
app.use("/mvlist",mvlist);
app.use("/latestplay",latestplay);
app.use("/search",search);