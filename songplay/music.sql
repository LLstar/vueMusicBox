/*db.sql*/
SET NAMES UTF8;
/*1.创建自定数据库 music*/
DROP DATABASE IF EXISTS music;
CREATE DATABASE music CHARSET=UTF8;
/*2.进入 music库中*/
USE music;
/*3.创建 用户表*/
CREATE TABLE user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(25),
  upwd VARCHAR(32)
);
/*4.创建 图片轮播表*/
CREATE TABLE carousel_pic(
  cid INT PRIMARY KEY AUTO_INCREMENT, 
  pic_url VARCHAR(255),
  title VARCHAR(255)
);

INSERT INTO carousel_pic VALUES(null,'http://localhost:3001/img/index/banner1.jpg','轮播广告商品1');
INSERT INTO carousel_pic VALUES(null,'http://localhost:3001/img/index/banner2.jpg','轮播广告商品2');
INSERT INTO carousel_pic VALUES(null,'http://localhost:3001/img/index/banner3.jpg','轮播广告商品3');
INSERT INTO carousel_pic VALUES(null,'http://localhost:3001/img/index/banner4.jpg','轮播广告商品4');
/*5.创建一张表 热门歌单*/
CREATE TABLE songmenu(
  sid INT(4) PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255),
  playcount FLOAT,
  img_url VARCHAR(255)
);

INSERT INTO songmenu VALUES(null,'林俊杰|梦想的声音合集',"4.9",'http://localhost:3001/img/index/menu1.jpg');
INSERT INTO songmenu VALUES(null,'明日之子 第二季',"2.3",'http://localhost:3001/img/index/menu2.jpg');
INSERT INTO songmenu VALUES(null,'【中国风】那一抹美如画的诗篇',"1.5",'http://localhost:3001/img/index/menu3.jpg');

