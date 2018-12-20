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
  upwd VARCHAR(32),
  avatar VARCHAR(255)
);

INSERT INTO user VALUES(null,"dingding","123456","http://localhost:3001/person1.jpg");
INSERT INTO user VALUES(null,"dangdang","123456","http://localhost:3001/person2.jpg");
INSERT INTO user VALUES(null,"xiaoming","123456","http://localhost:3001/person3.jpg");

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

/*6.创建一张表 歌手列表*/
CREATE TABLE singer(
  gid INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(32),
  fans float(8,2),
  avatar VARCHAR(255),
  category TINYINT
)

INSERT INTO singer VALUES(null,"林俊杰","38.8","http://localhost:3001/img/singer/singer1.jpg",0);
INSERT INTO singer VALUES(null,"薛之谦","96.6","http://localhost:3001/img/singer/singer2.jpg",0);
INSERT INTO singer VALUES(null,"周杰伦","23.3","http://localhost:3001/img/singer/singer3.jpg",0);
INSERT INTO singer VALUES(null,"陈奕迅","45.1","http://localhost:3001/img/singer/singer4.jpg",0);
INSERT INTO singer VALUES(null,"邓紫棋","22.3","http://localhost:3001/img/singer/singer5.jpg",0);

/*7.创建一张表，连接歌手列表，用户表和收藏列表 id,gid,uid*/
CREATE TABLE isLove(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  gid INT,
  FOREIGN KEY(gid) references singer(gid),
  uid INT,
  FOREIGN KEY(uid) references user(uid)
);

INSERT isLove VALUES(null,1,1);
INSERT isLove VALUES(null,2,1);
INSERT isLove VALUES(null,3,1);

/*8.创建一张表，歌手歌曲详情表*/
CREATE TABLE songs(
  sid INT PRIMARY KEY AUTO_INCREMENT,
  songtitle VARCHAR(255),
  songsubtitle VARCHAR(255),
  song_url VARCHAR(255),
  gid INT,
  FOREIGN KEY(gid) references singer(gid)
);

INSERT INTO songs VALUES(null,"小酒窝","林俊杰&蔡卓妍 - JJ陆","http://localhost:3001/songs/林俊杰&蔡卓妍-小酒窝.mp3",1);
INSERT INTO songs VALUES(null,"Always Online","林俊杰 - JJ陆","http://localhost:3001/songs/林俊杰-AlwaysOnline(单曲版).mp3",1);
INSERT INTO songs VALUES(null,"被风吹过的夏天","林俊杰&金莎 - 海蝶夯之唱响世界","http://localhost:3001/songs/林俊杰-被风吹过的夏天.mp3",1);
INSERT INTO songs VALUES(null,"第几个一百天","林俊杰 - 100天","http://localhost:3001/songs/林俊杰-第几个一百天.mp3",1);
INSERT INTO songs VALUES(null,"记得 (《爱情睡醒了》插曲)","林俊杰 - 爱情睡醒了 合辑","http://localhost:3001/songs/林俊杰-记得 (《爱情睡醒了》插曲).mp3",1);
INSERT INTO songs VALUES(null,"我还想她","林俊杰 - JJ陆","http://localhost:3001/songs/林俊杰-我还想她.mp3",1);



/*9.创建一张表 我的歌单*/
CREATE TABLE mymenu (
  mid INT PRIMARY KEY AUTO_INCREMENT,
  sid INT,
  FOREIGN KEY(sid) references songs(sid),
  uid INT,
  FOREIGN KEY(uid) references user(uid)
);

INSERT mymenu VALUES(null,1,1);
INSERT mymenu VALUES(null,2,1);
INSERT mymenu VALUES(null,3,1);

/*10.创建一张表 歌手简介*/
CREATE TABLE introduce (
  iid INT PRIMARY KEY AUTO_INCREMENT,
  gname VARCHAR(32),
  sex TINYINT,
  alias VARCHAR(32),
  nation VARCHAR(32),
  language VARCHAR(255),
  homeplace VARCHAR(32),
  birthday BIGINT,
  xingzuo VARCHAR(32),
  height SMALLINT,
  weight TINYINT,
  details VARCHAR(255),
  symbol VARCHAR(255),
  gid INT,
  FOREIGN KEY(gid) references singer(gid)
);

INSERT INTO introduce VALUES(null,"林俊杰",1,"JJLin","新加坡","英语，国语","新加坡",354499200000,"白羊座",172,61,"简介：林俊杰（JJ Lin），新加坡人，流行歌手、词曲创作者、音乐制作人。2003年发行首张创作专辑《乐行者》 ，2004年凭《江南》一曲成名 。2014年以专辑《因你而在 Stories Untold》夺得第25届台湾金曲奖最佳国语男歌手奖 。","代表作：《江南》、《曹操》、《发现爱》、《编号89757》等",1);


/*11.创建一张表 歌手专辑*/
CREATE TABLE album (
  aid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(32),
  time BIGINT,
  album_url VARCHAR(255),
  gid INT,
  FOREIGN KEY(gid) references singer(gid) 
);

INSERT INTO album VALUES(null,"新地球",1419638400000,"http://localhost:3001/img/singer/song-demo01.jpg",15);
INSERT INTO album VALUES(null,"因你而在",1363132800000,"http://localhost:3001/img/singer/song-demo02.jpg",15);
INSERT INTO album VALUES(null,"iTunes Session",1405641600000,"http://localhost:3001/img/singer/song-demo03.jpg",15);
INSERT INTO album VALUES(null,"JJ陆",1224288000000,"http://localhost:3001/img/singer/song-demo04.jpg",15);
INSERT INTO album VALUES(null,"和自己对话",1451001600000,"http://localhost:3001/img/singer/song-demo05.jpg",15);
INSERT INTO album VALUES(null,"黑夜问白天",1514160000000,"http://localhost:3001/img/singer/song-demo06.jpg",15);

/*12.创建一张表 MV视频播放列表*/
CREATE TABLE MV(
  mid INT PRIMARY KEY AUTO_INCREMENT,
  mv_url VARCHAR(255),
  poster VARCHAR(255),
  gid INT,
  FOREIGN KEY(gid) references singer(gid),
  title VARCHAR(255),
  zan INT
);
INSERT INTO MV VALUES(null,"http://localhost:3001/video/mv-01.mp4","http://localhost:3001/img/MV/poster-1.jpg",12,"修炼爱情");
INSERT INTO MV VALUES(null,"http://localhost:3001/video/mv-02.mp4","http://localhost:3001/img/MV/poster-2.jpg",12,"零度的亲吻");
INSERT INTO MV VALUES(null,"http://localhost:3001/video/mv-03.mp4","http://localhost:3001/img/MV/poster-3.jpg",12,"崇拜(梦想的声音)");

INSERT INTO MV VALUES(null,"http://localhost:3001/video/mv-01.mp4","http://localhost:3001/img/MV/poster-4.jpg",14,"你还要我怎样");
INSERT INTO MV VALUES(null,"http://localhost:3001/video/mv-02.mp4","http://localhost:3001/img/MV/poster-5.jpg",14,"绅士");
INSERT INTO MV VALUES(null,"http://localhost:3001/video/mv-03.mp4","http://localhost:3001/img/MV/poster-6.jpg",14,"认真的雪");

INSERT INTO MV VALUES(null,"http://localhost:3001/video/mv-01.mp4","http://localhost:3001/img/MV/poster-7.jpg",15,"算什么男人");
INSERT INTO MV VALUES(null,"http://localhost:3001/video/mv-02.mp4","http://localhost:3001/img/MV/poster-8.jpg",15,"告白气球");
INSERT INTO MV VALUES(null,"http://localhost:3001/video/mv-03.mp4","http://localhost:3001/img/MV/poster-9.jpg",15,"等你下课");

INSERT INTO MV VALUES(null,"http://localhost:3001/video/mv-01.mp4","http://localhost:3001/img/MV/poster-10.jpg",11,"我们(《后来的我们》主题曲)");
INSERT INTO MV VALUES(null,"http://localhost:3001/video/mv-02.mp4","http://localhost:3001/img/MV/poster-11.jpg",11,"陪你度过漫长岁月");
INSERT INTO MV VALUES(null,"http://localhost:3001/video/mv-03.mp4","http://localhost:3001/img/MV/poster-12.jpg",11,"单车(KTV版)");

INSERT INTO MV VALUES(null,"http://localhost:3001/video/mv-01.mp4","http://localhost:3001/img/MV/poster-13.jpg",13,"光年之外");
INSERT INTO MV VALUES(null,"http://localhost:3001/video/mv-02.mp4","http://localhost:3001/img/MV/poster-14.jpg",13,"单行的轨道");
INSERT INTO MV VALUES(null,"http://localhost:3001/video/mv-03.mp4","http://localhost:3001/img/MV/poster-15.jpg",13,"倒数");


/*13.创建一张表 保存已经播放过的歌曲*/
CREATE TABLE playsong(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  sid INT,
  FOREIGN KEY(sid) references songs(sid)
);

/*14.创建一张表 保存已经播放过的视频*/
CREATE TABLE playvedio(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  mid INT,
  FOREIGN KEY(mid) references mv(mid)
);

INSERT INTO playvedio VALUES(null,2);
