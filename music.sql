-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018-10-17 04:47:36
-- 服务器版本： 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `music`
--

-- --------------------------------------------------------

--
-- 表的结构 `album`
--

CREATE TABLE `album` (
  `aid` int(11) NOT NULL,
  `title` varchar(32) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `album_url` varchar(255) DEFAULT NULL,
  `gid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `album`
--

INSERT INTO `album` (`aid`, `title`, `time`, `album_url`, `gid`) VALUES
(1, '新地球', 1419638400000, 'img/singer/song-demo01.jpg', 1),
(2, '因你而在', 1363132800000, 'img/singer/song-demo02.jpg', 1),
(3, 'iTunes Session', 1405641600000, 'img/singer/song-demo03.jpg', 1),
(4, 'JJ陆', 1224288000000, 'img/singer/song-demo04.jpg', 1),
(5, '和自己对话', 1451001600000, 'img/singer/song-demo05.jpg', 1),
(6, '黑夜问白天', 1514160000000, 'img/singer/song-demo06.jpg', 1),
(7, '新地球', 1419638400000, 'img/singer/song-demo01.jpg', 2),
(8, '因你而在', 1363132800000, 'img/singer/song-demo02.jpg', 2),
(9, 'iTunes Session', 1405641600000, 'img/singer/song-demo03.jpg', 2),
(10, 'JJ陆', 1224288000000, 'img/singer/song-demo04.jpg', 2),
(11, '和自己对话', 1451001600000, 'img/singer/song-demo05.jpg', 2),
(12, '黑夜问白天', 1514160000000, 'img/singer/song-demo06.jpg', 2),
(13, '新地球', 1419638400000, 'img/singer/song-demo01.jpg', 3),
(14, '因你而在', 1363132800000, 'img/singer/song-demo02.jpg', 3),
(15, 'iTunes Session', 1405641600000, 'img/singer/song-demo03.jpg', 3),
(16, 'JJ陆', 1224288000000, 'img/singer/song-demo04.jpg', 3),
(17, '和自己对话', 1451001600000, 'img/singer/song-demo05.jpg', 3),
(18, '黑夜问白天', 1514160000000, 'img/singer/song-demo06.jpg', 3),
(19, '新地球', 1419638400000, 'img/singer/song-demo01.jpg', 4),
(20, '因你而在', 1363132800000, 'img/singer/song-demo02.jpg', 4),
(21, 'iTunes Session', 1405641600000, 'img/singer/song-demo03.jpg', 4),
(22, 'JJ陆', 1224288000000, 'img/singer/song-demo04.jpg', 4),
(23, '和自己对话', 1451001600000, 'img/singer/song-demo05.jpg', 4),
(24, '黑夜问白天', 1514160000000, 'img/singer/song-demo06.jpg', 4),
(25, '新地球', 1419638400000, 'img/singer/song-demo01.jpg', 5),
(26, '因你而在', 1363132800000, 'img/singer/song-demo02.jpg', 5),
(27, 'iTunes Session', 1405641600000, 'img/singer/song-demo03.jpg', 5),
(28, 'JJ陆', 1224288000000, 'img/singer/song-demo04.jpg', 5),
(29, '和自己对话', 1451001600000, 'img/singer/song-demo05.jpg', 5),
(30, '黑夜问白天', 1514160000000, 'img/singer/song-demo06.jpg', 5),
(31, '新地球', 1419638400000, 'img/singer/song-demo01.jpg', 6),
(32, '因你而在', 1363132800000, 'img/singer/song-demo02.jpg', 6),
(33, 'iTunes Session', 1405641600000, 'img/singer/song-demo03.jpg', 6),
(34, 'JJ陆', 1224288000000, 'img/singer/song-demo04.jpg', 6),
(35, '和自己对话', 1451001600000, 'img/singer/song-demo05.jpg', 6),
(36, '黑夜问白天', 1514160000000, 'img/singer/song-demo06.jpg', 6),
(37, '新地球', 1419638400000, 'img/singer/song-demo01.jpg', 7),
(38, '因你而在', 1363132800000, 'img/singer/song-demo02.jpg', 7),
(39, 'iTunes Session', 1405641600000, 'img/singer/song-demo03.jpg', 7),
(40, 'JJ陆', 1224288000000, 'img/singer/song-demo04.jpg', 7),
(41, '和自己对话', 1451001600000, 'img/singer/song-demo05.jpg', 7),
(42, '黑夜问白天', 1514160000000, 'img/singer/song-demo06.jpg', 7),
(43, '新地球', 1419638400000, 'img/singer/song-demo01.jpg', 8),
(44, '因你而在', 1363132800000, 'img/singer/song-demo02.jpg', 8),
(45, 'iTunes Session', 1405641600000, 'img/singer/song-demo03.jpg', 8),
(46, 'JJ陆', 1224288000000, 'img/singer/song-demo04.jpg', 8),
(47, '和自己对话', 1451001600000, 'img/singer/song-demo05.jpg', 8),
(48, '黑夜问白天', 1514160000000, 'img/singer/song-demo06.jpg', 8),
(49, '新地球', 1419638400000, 'img/singer/song-demo01.jpg', 9),
(50, '因你而在', 1363132800000, 'img/singer/song-demo02.jpg', 9),
(51, 'iTunes Session', 1405641600000, 'img/singer/song-demo03.jpg', 9),
(52, 'JJ陆', 1224288000000, 'img/singer/song-demo04.jpg', 9),
(53, '和自己对话', 1451001600000, 'img/singer/song-demo05.jpg', 9),
(54, '黑夜问白天', 1514160000000, 'img/singer/song-demo06.jpg', 9),
(55, '新地球', 1419638400000, 'img/singer/song-demo01.jpg', 10),
(56, '因你而在', 1363132800000, 'img/singer/song-demo02.jpg', 10),
(57, 'iTunes Session', 1405641600000, 'img/singer/song-demo03.jpg', 10),
(58, 'JJ陆', 1224288000000, 'img/singer/song-demo04.jpg', 10),
(59, '和自己对话', 1451001600000, 'img/singer/song-demo05.jpg', 10),
(60, '黑夜问白天', 1514160000000, 'img/singer/song-demo06.jpg', 10),
(61, '新地球', 1419638400000, 'img/singer/song-demo01.jpg', 11),
(62, '因你而在', 1363132800000, 'img/singer/song-demo02.jpg', 11),
(63, 'iTunes Session', 1405641600000, 'img/singer/song-demo03.jpg', 11),
(64, 'JJ陆', 1224288000000, 'img/singer/song-demo04.jpg', 11),
(65, '和自己对话', 1451001600000, 'img/singer/song-demo05.jpg', 11),
(66, '黑夜问白天', 1514160000000, 'img/singer/song-demo06.jpg', 11),
(67, '新地球', 1419638400000, 'img/singer/song-demo01.jpg', 12),
(68, '因你而在', 1363132800000, 'img/singer/song-demo02.jpg', 12),
(69, 'iTunes Session', 1405641600000, 'img/singer/song-demo03.jpg', 12),
(70, 'JJ陆', 1224288000000, 'img/singer/song-demo04.jpg', 12),
(71, '和自己对话', 1451001600000, 'img/singer/song-demo05.jpg', 12),
(72, '黑夜问白天', 1514160000000, 'img/singer/song-demo06.jpg', 12),
(73, '新地球', 1419638400000, 'img/singer/song-demo01.jpg', 13),
(74, '因你而在', 1363132800000, 'img/singer/song-demo02.jpg', 13),
(75, 'iTunes Session', 1405641600000, 'img/singer/song-demo03.jpg', 13),
(76, 'JJ陆', 1224288000000, 'img/singer/song-demo04.jpg', 13),
(77, '和自己对话', 1451001600000, 'img/singer/song-demo05.jpg', 13),
(78, '黑夜问白天', 1514160000000, 'img/singer/song-demo06.jpg', 13),
(79, '新地球', 1419638400000, 'img/singer/song-demo01.jpg', 14),
(80, '因你而在', 1363132800000, 'img/singer/song-demo02.jpg', 14),
(81, 'iTunes Session', 1405641600000, 'img/singer/song-demo03.jpg', 14),
(82, 'JJ陆', 1224288000000, 'img/singer/song-demo04.jpg', 14),
(83, '和自己对话', 1451001600000, 'img/singer/song-demo05.jpg', 14),
(84, '黑夜问白天', 1514160000000, 'img/singer/song-demo06.jpg', 14),
(85, '新地球', 1419638400000, 'img/singer/song-demo01.jpg', 15),
(86, '因你而在', 1363132800000, 'img/singer/song-demo02.jpg', 15),
(87, 'iTunes Session', 1405641600000, 'img/singer/song-demo03.jpg', 15),
(88, 'JJ陆', 1224288000000, 'img/singer/song-demo04.jpg', 15),
(89, '和自己对话', 1451001600000, 'img/singer/song-demo05.jpg', 15),
(90, '黑夜问白天', 1514160000000, 'img/singer/song-demo06.jpg', 15);

-- --------------------------------------------------------

--
-- 表的结构 `carousel_pic`
--

CREATE TABLE `carousel_pic` (
  `cid` int(11) NOT NULL,
  `pic_url` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `carousel_pic`
--

INSERT INTO `carousel_pic` (`cid`, `pic_url`, `title`) VALUES
(1, 'img/index/banner1.jpg', '轮播广告商品1'),
(2, 'img/index/banner2.jpg', '轮播广告商品2'),
(3, 'img/index/banner3.jpg', '轮播广告商品3'),
(4, 'img/index/banner4.jpg', '轮播广告商品4');

-- --------------------------------------------------------

--
-- 表的结构 `introduce`
--

CREATE TABLE `introduce` (
  `iid` int(11) NOT NULL,
  `gname` varchar(32) DEFAULT NULL,
  `sex` tinyint(4) DEFAULT NULL,
  `alias` varchar(32) DEFAULT NULL,
  `nation` varchar(32) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `homeplace` varchar(32) DEFAULT NULL,
  `birthday` bigint(20) DEFAULT NULL,
  `xingzuo` varchar(32) DEFAULT NULL,
  `height` varchar(32) DEFAULT NULL,
  `weight` varchar(32) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `gid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `introduce`
--

INSERT INTO `introduce` (`iid`, `gname`, `sex`, `alias`, `nation`, `language`, `homeplace`, `birthday`, `xingzuo`, `height`, `weight`, `details`, `symbol`, `gid`) VALUES
(1, '林俊杰', 1, 'JJLin', '新加坡', '英语，国语', '新加坡', 354499200000, '白羊座', '172cm', '61kg', '简介：林俊杰（JJ Lin），新加坡人，流行歌手、词曲创作者、音乐制作人。2003年发行首张创作专辑《乐行者》 ，2004年凭《江南》一曲成名 。2014年以专辑《因你而在 Stories Untold》夺得第25届台湾金曲奖最佳国语男歌手奖 。', '代表作：《江南》、《曹操》、《发现爱》、《编号89757》等', 1),
(2, '薛之谦', 1, 'Joker', '中国', '国语', '中国上海', 427248000000, '巨蟹座', '172cm', '55kg', '简介：薛之谦，1983年7月17日出生于上海市，中国内地男歌手。2008雪碧中国原创音乐流行榜最具潜质歌手大奖、2009MusicRadio中国TOP排行榜年度最佳舞台演绎奖、第二十届华语榜中榜最受欢迎唱作歌手  。', '代表作：《认真的雪》《演员》《丑八怪》《绅士》等', 2),
(3, '周杰伦', 1, 'Jay Chou', '中国台湾', '国语', '台湾新北市', 285465600000, '摩羯座', '173cm', '60kg', '简介：周杰伦（Jay Chou），1979年1月18日出生于台湾省新北市，华语流行男歌手、演员、词曲创作人、MV及电影导演、编剧及制作人。2000年被吴宗宪发掘，发行首张个人专辑《Jay》。2001年发行专辑《范特西》。2002年在中国、新加坡、马来西亚、美国等地举办首场个人世界巡回演唱会。', '代表作：《龙卷风》、《菊花台》、《青花瓷》、《晴天》', 3),
(4, '陈奕迅', 1, 'Eason Chan', '中国香港', '国语，粤语', '香港', 144115200000, '狮子座', '173cm', '72kg', '简介：陈奕迅（Eason Chan），1974年7月27日出生于香港，中国香港男歌手、演员，毕业于英国金斯顿大学。获得香港十大劲歌金曲最受欢迎男歌手，香港十大中文金曲全国最佳男歌手，全球华语歌曲排行榜最佳男歌手。', '代表作：《爱情转移》、《十年》、《浮夸》、《k歌之王》', 4),
(5, '邓紫棋', 0, 'G.E.M.', '中国香港', '国语，粤语', '上海', 682300800000, '狮子座', '160cm', '45kg', '简介：邓紫棋（Gloria Tang Tsz-Kei），又名G.E.M.，原名邓诗颖，1991年8月16日生于中国上海，4岁移居香港，中国香港创作型女歌手。2008年7月10日以16岁之龄出道。同年10月16日发行首张EP《G.E.M.》，取得香港各大乐坛颁奖礼新人金奖。2011年5月，以19岁之龄在香港红馆举行5场个人演唱会。', '代表作：《睡公主》、《回忆的沙漏》、《A.I.N.Y.》、《我的秘密》、《泡沫》、《奇迹》、《偶尔》', 5),
(6, '魔力红乐队', 2, 'Maroon 5', '美国', '英语', '美国洛杉矶', 0, '—', '—', '—', '简介：魔力红（英语：Maroon 5）是一个来自美国加利福尼亚州洛杉矶的流行摇滚乐队。1994年，各成员在读高中时以‘卡拉之花’（英语：Kara\'s Flowers）的名字成立乐队，创始成员包括亚当·莱文、 杰西·卡迈克尔、米基·麦登和莱恩·度赛克。', '代表作：《Moves Like Jagger》 《Misery》 《Payphone》', 6),
(7, '林肯公园', 2, 'Linkin Park', '美国', '英语', '美国加州', 0, '-', '-', '-', '简介：林肯公园（英语：Linkin Park）是一组来自美国加州的摇滚乐队，也被认为是新金属最成功的乐团。林肯公园在2000年以首张专辑《混合理论》在主流音乐市场上获得成功，该专辑销售量超过2,400万张，乐队接下来发行的《天空之城-美特拉》专辑也取得成功，在2003年的美国公告牌二百强专辑榜上排名第一。', '代表作：《In The End》、《Numb》、《What I\'Ve Done》、《Iridescent》等', 7),
(8, '清洁盗贼', 2, 'Clean Bandit', '英国', '英语', '英国', 0, '-', '-', '-', '简介：Clean Bandit是一支英国电子乐队，成立于2009年，成员有Jack Patterson, Grace Chatto, Milan Neil Amin-Smith 和 Luke Patterson。他们的音乐被称为‘融合’音乐，混合了电子音乐和古典音乐。他们自己创作音乐然后邀请其他艺人来演唱他们的歌曲。2015全英音乐奖中，Clean bandit获得英国最佳乐队(British Group)提名。其中Clean Bandit feat. Jess Glynne获得最佳英国制作人(Briti', '代表作：《Rather Be》\r\n', 8),
(9, '贾斯汀·比伯', 1, 'Justin Bieber', '加拿大', '英语', '加拿大', 762480000000, '双鱼座', '176cm', '53kg', '简介：Justin Bieber（贾斯汀·比伯 ,1994年3月1日），加拿大歌手。早期因为在YouTube翻唱其他人的歌曲而出名，被Usher赏识，与小岛唱片签约，并居住在美国洛杉矶，并于2009年11月17日发行他的第一张专辑《MY WORLDS》的第一部分《MY WORLD》。 ', '代表作：《Baby》《One Time》《Never Say Never》《Boyfriend》\r\n', 9),
(10, '赛琳娜·戈麦斯', 0, 'Selena Gomez', '美国', '英语', '美国', 711763200000, '巨蟹座', '168cm', '48kg', '简介：赛琳娜·戈麦斯（Selena Gomez），1992年7月22日出生于美国得克萨斯州，美国女演员、歌手。\n在2004年的迪士尼全球才艺计划中，赛琳娜被迪士尼相中并签约。2007年主演原创魔幻喜剧《少年魔法师》，一举成名。2008年主演三部迪士尼原创电影《灰姑娘之舞动奇迹》、《公主保护计划》与《少年魔法师电影: 神秘魔法石》', '代表作：迪士尼热门原创剧集《公主保护计划》、《少年魔法师》、《灰姑娘之舞动奇迹》、《Who Says》、《Come & Get It》\n', 10),
(11, '权志龙', 1, 'G-Dragon', '韩国', '韩语', '韩国', 587865600000, '狮子座', '178cm', '58kg', '简介：G-DRAGON(权志龙)，1988年8月18日出生于韩国首尔，韩国男歌手，男子演唱组合BIGBANG队长。现今为韩国YG Entertainment公司主要制作人之一。获得2007年MKMF最佳编曲赏、2008年韩国十大作曲家、2008年最佳魅力先生、2009年MAMA年度最佳专辑、2009年Melon年度最佳专辑、2009年Melon Top10、2009年CY音乐颁奖礼年度最佳歌手。', '代表作：《Heartbreaker》、《One Of A Kind》、《COUP D\'ETAT》、《Crooked》、《Crayon》、《Good Boy》\n', 11),
(12, 'Winner', 2, 'Winner', '韩国', '韩语', '韩国', 0, '-', '-', '-', '简介：WINNER为YG Entertainment在2013年透过生存节目《WIN》推出的五人男子团体，是继在2006年推出的BIGBANG的第一个新男子团体。成员有金秦禹、李昇勋、宋旻浩、姜昇润、南太铉5名。2014年8月12日发行首张正规专辑《2014 S/S》，在8月15日YG家族演唱会上公开新曲舞台，正式出道。 YG Entertainment公布WINNER的Fans官方名称为‘INNER CIRCLE’。', '代表作：《Better World》\n', 12),
(13, '李知恩', 0, 'IU', '韩国', '韩语', '韩国京畿道', 737510400000, '金牛座', '162cm', '43kg', '简介：???(IU)，原名为李知恩。1993年5月16日出生于韩国首尔，韩国女歌手、演员、主持人。\nIU在2007年加入Loen Entertainment 成为练习生。15岁的时候， IU发行首张迷你专辑《Lost and Found》正式出道。而让她成为大势的是2010年的《好日子》。除了音乐生涯外，IU还涉足主持电台、电视节目以及表演领域。在饰演电视剧《梦想高飞》的配角以及在几个电视剧客串演出后，她主演了《最佳李纯信》、《漂亮男人》、《制作人》及《步步惊心：丽》，并曾主持2012年和2015年SBS', '代表作：《迷儿》、《Boo》、《好日子》、《你和我》、《粉红色高跟鞋》、《星期五见面》、《你的意义》\n', 13),
(14, '朴灿烈', 1, '-', '韩国', '韩语', '韩国首尔', 722822400000, '射手座', '178cm', '58kg', '简介：朴灿烈（Park Chan Yeol），1992年11月27日出生于韩国首尔，在中韩及海外多面发展的韩国籍男歌手。 \n2008年通过参加S.M.Casting System进入S.M Entertainment公司成为练习生，2012年4月8日以EXO/EXO-K组合成员身份正式出道，是队内的RAPPER、atmosphere、reaction和门面担当。1992年11月27日出生于韩国首尔，高中就读于首尔市江南区现代高中。2008年通过S.M.Casting System进入S.M Enterta', '代表作：《Outsider》、《Let Me Love You》、《Stay With Me》\n', 14),
(15, '行星团', 2, 'EXO', '韩国', '韩语', '韩国首尔', 0, '-', '-', '-', '简介：EXO(??)，是韩国SM娱乐有限公司于2012年4月8日正式推出的12人男子流行演唱团体。现以9名成员的形式展开活动，分别为金珉锡(XIU MIN)、金俊勉(SUHO)、张艺兴(LAY)、边伯贤(BAEKHYUN)、金钟大(CHEN)、朴灿烈(CHANYEOL)、都暻秀(D.O.)、金钟仁(KAI)、吴世勋(SEHUN)，其中张艺兴为中国籍成员，已退队成员有鹿晗(2014年10月)、吴亦凡(2014年5月)、黄子韬(2015年4月)。2012年4月8日，推出首张迷你专辑《MAMA》正式出道，11月', '代表作：《MAMA》、《LOVE ME RIGHT》、《CALL ME BABY》、《Dancing King》、《Monster》\n', 15);

-- --------------------------------------------------------

--
-- 表的结构 `islove`
--

CREATE TABLE `islove` (
  `iid` int(11) NOT NULL,
  `gid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `islove`
--

INSERT INTO `islove` (`iid`, `gid`, `uid`) VALUES
(4, 1, 2),
(28, 1, 1),
(29, 2, 1),
(31, 2, 2),
(34, 3, 3),
(35, 5, 3),
(176, 5, 2),
(178, 4, 1),
(180, 13, 1),
(184, 8, 1),
(186, 3, 1);

-- --------------------------------------------------------

--
-- 表的结构 `mv`
--

CREATE TABLE `mv` (
  `mid` int(11) NOT NULL,
  `mv_url` varchar(255) DEFAULT NULL,
  `poster` varchar(255) DEFAULT NULL,
  `gid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `zan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mv`
--

INSERT INTO `mv` (`mid`, `mv_url`, `poster`, `gid`, `title`, `zan`) VALUES
(1, 'video/mv-01.mp4', 'img/MV/poster-01.jpg', 1, '修炼爱情', 1354),
(2, 'video/mv-02.mp4', 'img/MV/poster-02.jpg', 1, '零度的亲吻', 6642),
(3, 'video/mv-03.mp4', 'img/MV/poster-03.jpg', 1, '崇拜(梦想的声音)', 7798),
(4, 'video/mv-01.mp4', 'img/MV/poster-04.jpg', 2, '你还要我怎样', 1465),
(5, 'video/mv-02.mp4', 'img/MV/poster-05.jpg', 2, '绅士', 773),
(6, 'video/mv-03.mp4', 'img/MV/poster-06.jpg', 2, '认真的雪', 4879),
(7, 'video/mv-01.mp4', 'img/MV/poster-07.jpg', 3, '算什么男人', 6643),
(8, 'video/mv-02.mp4', 'img/MV/poster-08.jpg', 3, '告白气球', 2275),
(9, 'video/mv-03.mp4', 'img/MV/poster-09.jpg', 3, '等你下课', 7665),
(10, 'video/mv-01.mp4', 'img/MV/poster-10.jpg', 4, '我们(《后来的我们》主题曲)', 3324),
(11, 'video/mv-02.mp4', 'img/MV/poster-11.jpg', 4, '陪你度过漫长岁月', 128),
(12, 'video/mv-03.mp4', 'img/MV/poster-12.jpg', 4, '单车(KTV版)', 554),
(13, 'video/mv-01.mp4', 'img/MV/poster-13.jpg', 5, '光年之外', 3215),
(14, 'video/mv-02.mp4', 'img/MV/poster-14.jpg', 5, '单行的轨道', 214),
(15, 'video/mv-03.mp4', 'img/MV/poster-15.jpg', 5, '倒数', 765),
(16, 'video/mv-01.mp4', 'img/MV/poster-10.jpg', 6, '我们(《后来的我们》主题曲)', 1235),
(17, 'video/mv-02.mp4', 'img/MV/poster-11.jpg', 6, '陪你度过漫长岁月', 754),
(18, 'video/mv-03.mp4', 'img/MV/poster-12.jpg', 6, '单车(KTV版)', 3415),
(19, 'video/mv-01.mp4', 'img/MV/poster-01.jpg', 7, '修炼爱情', 3522),
(20, 'video/mv-02.mp4', 'img/MV/poster-02.jpg', 7, '零度的亲吻', 214),
(21, 'video/mv-03.mp4', 'img/MV/poster-03.jpg', 7, '崇拜(梦想的声音)', 1426),
(22, 'video/mv-01.mp4', 'img/MV/poster-04.jpg', 8, '你还要我怎样', 431),
(23, 'video/mv-02.mp4', 'img/MV/poster-05.jpg', 8, '绅士', 643),
(24, 'video/mv-03.mp4', 'img/MV/poster-06.jpg', 8, '认真的雪', 1236),
(25, 'video/mv-01.mp4', 'img/MV/poster-07.jpg', 9, '算什么男人', 1642),
(26, 'video/mv-02.mp4', 'img/MV/poster-08.jpg', 9, '告白气球', 647),
(27, 'video/mv-03.mp4', 'img/MV/poster-09.jpg', 9, '等你下课', 5643),
(28, 'video/mv-01.mp4', 'img/MV/poster-13.jpg', 10, '光年之外', 7521),
(29, 'video/mv-02.mp4', 'img/MV/poster-14.jpg', 10, '单行的轨道', 876),
(30, 'video/mv-03.mp4', 'img/MV/poster-15.jpg', 10, '倒数', 1356),
(31, 'video/mv-01.mp4', 'img/MV/poster-10.jpg', 11, '我们(《后来的我们》主题曲)', 5431),
(32, 'video/mv-02.mp4', 'img/MV/poster-11.jpg', 11, '陪你度过漫长岁月', 3217),
(33, 'video/mv-03.mp4', 'img/MV/poster-12.jpg', 11, '单车(KTV版)', 2261),
(34, 'video/mv-01.mp4', 'img/MV/poster-01.jpg', 12, '修炼爱情', 5438),
(35, 'video/mv-02.mp4', 'img/MV/poster-02.jpg', 12, '零度的亲吻', 987),
(36, 'video/mv-03.mp4', 'img/MV/poster-03.jpg', 12, '崇拜(梦想的声音)', 675),
(37, 'video/mv-01.mp4', 'img/MV/poster-13.jpg', 13, '光年之外', 2216),
(38, 'video/mv-02.mp4', 'img/MV/poster-14.jpg', 13, '单行的轨道', 5525),
(39, 'video/mv-03.mp4', 'img/MV/poster-15.jpg', 13, '倒数', 2654),
(40, 'video/mv-01.mp4', 'img/MV/poster-04.jpg', 14, '你还要我怎样', 1146),
(41, 'video/mv-02.mp4', 'img/MV/poster-05.jpg', 14, '绅士', 3321),
(42, 'video/mv-03.mp4', 'img/MV/poster-06.jpg', 14, '认真的雪', 1177),
(43, 'video/mv-01.mp4', 'img/MV/poster-07.jpg', 15, '算什么男人', 1364),
(44, 'video/mv-02.mp4', 'img/MV/poster-08.jpg', 15, '告白气球', 784),
(45, 'video/mv-03.mp4', 'img/MV/poster-09.jpg', 15, '等你下课', 731);

-- --------------------------------------------------------

--
-- 表的结构 `mymenu`
--

CREATE TABLE `mymenu` (
  `mid` int(11) NOT NULL,
  `sid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `mymenu`
--

INSERT INTO `mymenu` (`mid`, `sid`, `uid`) VALUES
(2, 2, 1),
(6, 5, 1),
(7, 9, 1),
(8, 11, 1),
(9, 16, 1),
(10, 13, 1),
(11, 23, 1),
(13, 24, 1),
(16, 7, 1),
(21, 20, 1),
(22, 12, 1),
(23, 6, 1),
(24, 14, 1),
(29, 74, 1),
(31, 60, 1);

-- --------------------------------------------------------

--
-- 表的结构 `playsong`
--

CREATE TABLE `playsong` (
  `lid` int(11) NOT NULL,
  `sid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `playsong`
--

INSERT INTO `playsong` (`lid`, `sid`) VALUES
(9, NULL),
(10, NULL),
(11, NULL),
(1, 1),
(3, 2),
(2, 3),
(12, 4),
(6, 12),
(8, 16),
(5, 21),
(7, 24),
(17, 28),
(14, 51),
(4, 53),
(16, 57),
(15, 69),
(13, 74);

-- --------------------------------------------------------

--
-- 表的结构 `playvedio`
--

CREATE TABLE `playvedio` (
  `lid` int(11) NOT NULL,
  `mid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `playvedio`
--

INSERT INTO `playvedio` (`lid`, `mid`) VALUES
(1, 1),
(2, 2),
(3, 3),
(7, 9),
(9, 28);

-- --------------------------------------------------------

--
-- 表的结构 `singer`
--

CREATE TABLE `singer` (
  `gid` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `fans` float(8,2) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `category` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `singer`
--

INSERT INTO `singer` (`gid`, `name`, `fans`, `avatar`, `category`) VALUES
(1, '林俊杰', 38.80, 'img/singer/singer1.jpg', 0),
(2, '薛之谦', 96.60, 'img/singer/singer2.jpg', 0),
(3, '周杰伦', 23.30, 'img/singer/singer3.jpg', 0),
(4, '陈奕迅', 45.10, 'img/singer/singer4.jpg', 0),
(5, '邓紫棋', 22.30, 'img/singer/singer5.jpg', 0),
(6, 'Maroon 5 (魔力红)', 12.80, 'img/singer/singer6.jpg', 1),
(7, 'Linkin Park (林肯公园)', 5.60, 'img/singer/singer7.jpg', 1),
(8, 'Clean Bandit (清洁盗贼)', 2.30, 'img/singer/singer8.jpg', 1),
(9, 'Justin Bieber (贾斯汀·比伯)', 18.10, 'img/singer/singer9.jpg', 1),
(10, 'Selena Gomez (赛琳娜·戈麦斯)', 22.30, 'img/singer/singer10.jpg', 1),
(11, 'G-DRAGON (权志龙)', 58.30, 'img/singer/singer11.jpg', 2),
(12, 'WINNER (위너)', 20.00, 'img/singer/singer12.jpg', 2),
(13, '아이유 (IU)', 21.50, 'img/singer/singer13.jpg', 2),
(14, '찬열 (灿烈)', 32.10, 'img/singer/singer14.jpg', 2),
(15, 'EXO (엑소)', 16.30, 'img/singer/singer15.jpg', 2);

-- --------------------------------------------------------

--
-- 表的结构 `songmenu`
--

CREATE TABLE `songmenu` (
  `sid` int(4) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `playcount` float DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `songmenu`
--

INSERT INTO `songmenu` (`sid`, `title`, `playcount`, `img_url`) VALUES
(1, '谈什么未来，没有什么不可取代', 98.6, 'img/index/future.jpg'),
(2, '下午茶时间来杯爵士味儿咖啡吧', 7.6, 'img/index/coffee.jpg'),
(3, 'Ambient : 秋色染遍心间', 9.7, 'img/index/fall.jpg'),
(4, '夜班车上听的华语温润歌声', 150.8, 'img/index/huayu.jpg'),
(5, '加班必备 · 提神电子', 115.4, 'img/index/tishen.jpg'),
(6, '情绪净化站 · 韩系抒情', 33.4, 'img/index/hanxi2.jpg'),
(7, '站内评论999+网络伤感情歌', 146.5, 'img/index/beishang.jpg'),
(8, '缓解压力 • 轻快华语', 463.3, 'img/index/huayu2.jpg'),
(9, '如果结局不好，我宁选孤独终老', 194.8, 'img/index/lonely.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `songs`
--

CREATE TABLE `songs` (
  `sid` int(11) NOT NULL,
  `songtitle` varchar(255) DEFAULT NULL,
  `songsubtitle` varchar(255) DEFAULT NULL,
  `song_url` varchar(255) DEFAULT NULL,
  `gid` int(11) DEFAULT NULL,
  `playcount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `songs`
--

INSERT INTO `songs` (`sid`, `songtitle`, `songsubtitle`, `song_url`, `gid`, `playcount`) VALUES
(1, '小酒窝', '林俊杰&蔡卓妍 - JJ陆', 'songs/林俊杰&蔡卓妍-小酒窝.mp3', 1, 887645),
(2, 'Always Online', '林俊杰 - JJ陆', 'songs/林俊杰-AlwaysOnline(单曲版).mp3', 1, 54323),
(3, '被风吹过的夏天', '林俊杰&金莎 - 海蝶夯之唱响世界', 'songs/林俊杰-被风吹过的夏天.mp3', 1, 316564),
(4, '第几个一百天', '林俊杰 - 100天', 'songs/林俊杰-第几个一百天.mp3', 1, 54387),
(5, '记得 (《爱情睡醒了》插曲)', '林俊杰 - 爱情睡醒了 合辑', 'songs/林俊杰-记得 (《爱情睡醒了》插曲).mp3', 1, 876543),
(6, '我还想她', '林俊杰 - JJ陆', 'songs/林俊杰-我还想她.mp3', 1, 1237543),
(7, '暧昧', '薛之谦 - 暧昧', 'songs/薛之谦-暧昧.mp3', 2, 9776232),
(8, '丑八怪', '薛之谦 - 意外', 'songs/薛之谦-丑八怪.mp3', 2, 876542),
(9, '动物世界', '薛之谦 - 动物世界', 'songs/薛之谦-动物世界.mp3', 2, 87234),
(10, '绅士', '薛之谦 - 绅士', 'songs/薛之谦-绅士-(电视剧《职场是个技术活》片尾曲).mp3', 2, 22345),
(11, '一半', '薛之谦 - 一半', 'songs/薛之谦-一半.mp3', 2, 432354),
(12, '布拉格广场', '周杰伦&徐熙娣', 'songs/周杰伦&徐熙娣-布拉格广场.mp3', 3, 3131755),
(13, '屋顶(Live)', '周杰伦&张惠妹', 'songs/周杰伦&张惠妹-屋顶(Live).mp3', 3, 868756),
(14, '稻香(Live)', '周杰伦 - Will Jay', 'songs/周杰伦-稻香(Live).mp3', 3, 1230987),
(15, '东风破', '周杰伦', 'songs/周杰伦-东风破.mp3', 3, 65423),
(16, '你怎么说', '周杰伦', 'songs/周杰伦-你怎么说.mp3', 3, 127654),
(17, '淘汰', '陈奕迅&周杰伦', 'songs/陈奕迅&周杰伦-淘汰.mp3', 4, 76733),
(18, '爱情转移(Live版)', '陈奕迅', 'songs/陈奕迅-爱情转移(Live版).mp3', 4, 541154),
(19, '稳稳的幸福', '陈奕迅', 'songs/陈奕迅-稳稳的幸福.mp3', 4, 876532),
(20, 'A.I.N.Y', 'G.E.M.邓紫棋', 'songs/G.E.M.邓紫棋-A.I.N.Y.mp3', 5, 4123657),
(21, '后会无期', 'G.E.M.邓紫棋', 'songs/G.E.M.邓紫棋-后会无期-(电影《后会无期》同名主题歌).mp3', 5, 87664321),
(22, '我的秘密', 'G.E.M.邓紫棋', 'songs/G.E.M.邓紫棋-我的秘密.mp3', 5, 543321),
(23, '喜欢你', 'G.E.M.邓紫棋', 'songs/G.E.M.邓紫棋-喜欢你 (原唱： Beyond).mp3', 5, 76422),
(24, '简单爱', '陈奕迅&周杰伦', 'songs/陈奕迅&周杰伦-简单爱.mp3', 4, 543211),
(25, '梦想天空分外蓝', '陈奕迅', 'songs/陈奕迅-梦想天空分外蓝.mp3', 4, 553176),
(26, '光年之外', 'G.E.M.邓紫棋', 'songs/G.E.M.邓紫棋-光年之外-(电影《太空旅客》中文主题曲).mp3', 5, 22775),
(27, 'Map', 'Maroon 5', 'songs/Maroon 5-Map.mp3', 6, 76123),
(28, 'Myself', 'Maroon 5', 'songs/Maroon 5-Myself.mp3', 6, 76542),
(29, 'Shut Up And Dance', 'Maroon 5', 'songs/Maroon 5-Shut Up And Dance.mp3', 6, 12387),
(30, 'Story - Non-LP', 'Maroon 5', 'songs/Maroon 5-Story - Non-LP Version.mp3', 6, 87643),
(31, 'Tickets - Explicit', 'Maroon 5', 'songs/Maroon 5-Tickets - Explicit Version.mp3', 6, 547871),
(32, 'Faint(《变形金刚》电影插曲)', 'Linkin Park', 'songs/Linkin Park-Faint(《变形金刚》电影插曲).mp3', 7, 65412),
(33, 'remember the name', 'Linkin Park', 'songs/Linkin Park-remember the name.mp3', 7, 76128),
(34, 'Rolling In The Deep(Live)', 'Linkin Park', 'songs/Linkin Park-Rolling In The Deep(Live).mp3', 7, 77148),
(35, 'we made it', 'Linkin Park', 'songs/Linkin Park-we made it(林肯公园 clean).mp3', 7, 126543),
(36, '林肯公园', 'Linkin Park', 'songs/Linkin Park-林肯公园.mp3', 7, 88216),
(37, 'Symphony', 'Clean Bandit', 'songs/Clean Bandit&Cash Cash&Zara Larsson-Symphony (Cash Cash Remix).mp3', 8, 12856),
(38, 'Real Love', 'Clean Bandit', 'songs/Clean Bandit&Jess Glynne&The Chainsmokers-Real Love(Remix).mp3', 8, 8664),
(39, 'A+E', 'Clean Bandit', 'songs/Clean Bandit-A+E.mp3', 8, 97854),
(40, 'Disconnect(单曲版)', 'Clean Bandit', 'songs/Clean Bandit-Disconnect(单曲版).mp3', 8, 52123),
(41, 'Stronger Clean Bandit', 'Clean Bandit', 'songs/Clean Bandit-Stronger Clean Bandit.mp3', 8, 22874),
(42, 'Despacito', 'Justin Bieber', 'songs/Justin Bieber&Daddy Yankee&Luis Fonsi-Despacito (Bootlegs).mp3', 9, 866234),
(43, 'Alone', 'Justin Bieber', 'songs/Justin Bieber-Alone.mp3', 9, 64132),
(44, 'Latin Girl', 'Justin Bieber', 'songs/Justin Bieber-Latin Girl.mp3', 9, 987665),
(45, 'Pick Me', 'Justin Bieber', 'songs/Justin Bieber-Pick Me.mp3', 9, 98754),
(46, 'Where Are You Now？', 'Justin Bieber', 'songs/Justin Bieber-Where Are You Now？.mp3', 9, 987321),
(47, 'Set Fire To The Love Song', 'Selena Gomez', 'songs/Selena Gomez&The Scene&Adele-Set Fire To The Love Song.mp3', 10, 42654),
(48, 'Bang Bang Bang', 'Selena Gomez', 'songs/Selena Gomez-Bang Bang Bang.mp3', 10, 76512),
(49, 'Trust Nobody', 'Selena Gomez', 'songs/Selena Gomez&Cashmere Cat&Tory Lanez-Trust Nobody.mp3', 10, 25982),
(50, 'Hit the Lights', 'Selena Gomez', 'songs/Selena Gomez-Hit the Lights.mp3', 10, 65321),
(51, 'The Zing-(电影《精灵旅社》片尾曲)', 'Selena Gomez', 'songs/Selena Gomez-The Zing-(电影《精灵旅社》片尾曲).mp3', 10, 55821),
(52, 'R.O', 'G-Dragon&Lydia Paek', 'songs/G-Dragon&Lydia Paek-R.O.mp3', 11, 98741),
(53, 'Baauer-Temple', 'G-Dragon&M.I.A.&Baauer', 'songs/G-Dragon&M.I.A.&Baauer-Temple.mp3', 11, 16538),
(54, 'Missing You', 'G-Dragon&金妍儿', 'songs/G-Dragon&金妍儿-Missing You.mp3', 11, 653132),
(55, 'Fantastic Baby', 'G-Dragon&太阳', 'songs/G-Dragon&太阳-Fantastic Baby(2014MAMA In HK).mp3', 11, 76125),
(56, 'Without You', 'G-Dragon', 'songs/G-Dragon-Without You.mp3', 11, 765125),
(57, 'Better World', 'Winner', 'songs/Winner-Better World.mp3', 12, 87149),
(58, 'I\'m Him(现场版)', 'Winner', 'songs/Winner-I\'m Him(现场版).mp3', 12, 6428),
(59, 'Lesa Wandi', 'Winner', 'songs/Winner-Lesa Wandi.mp3', 12, 53198),
(60, 'Victory Yeah!', 'Winner', 'songs/Winner-Victory Yeah!.mp3', 12, 18631),
(61, '空虚 (Empty)', 'Winner', 'songs/Winner-空虚 (Empty) (2014MAMA In HK).mp3', 12, 4476),
(62, 'leon', 'IU&朴明秀', 'songs/IU&朴明秀-leon.mp3', 13, 65238),
(63, 'Good Day', 'IU', 'songs/IU-Good Day.mp3', 13, 98342),
(64, 'If You(现场版)', 'IU', 'songs/IU-If You(现场版).mp3', 13, 108754),
(65, 'Someday', 'IU', 'songs/IU-Someday.mp3', 13, 325471),
(66, '谎言', 'IU', 'songs/IU-谎言.mp3', 13, 76935),
(67, '该死的家伙', '朴灿烈&D.O.&吴亦凡', 'songs/朴灿烈&D.O.&吴亦凡-该死的家伙.mp3', 14, 76127),
(68, 'All Of Me', '朴灿烈', 'songs/朴灿烈-All Of Me.mp3', 14, 12886),
(69, 'Young Street Logo Song', '朴灿烈', 'songs/朴灿烈-Young Street Logo Song.mp3', 14, 87129),
(70, '听到的信', '朴灿烈', 'songs/朴灿烈-听到的信.mp3', 14, 71279),
(71, '拥抱', '朴灿烈', 'songs/朴灿烈-拥抱.mp3', 14, 7634),
(72, 'Drop That', 'EXO', 'songs/EXO-Drop That.mp3', 15, 8763),
(73, 'First Love(初恋)', 'EXO', 'songs/EXO-First Love(初恋).mp3', 15, 86549),
(74, '告白', 'EXO', 'songs/EXO-告白.mp3', 15, 21347),
(75, '无法说爱你', 'EXO', 'songs/EXO-无法说爱你.mp3', 15, 65218),
(76, '一起吃苦的幸福 (Live)', 'EXO', 'songs/EXO-一起吃苦的幸福 (Live).mp3', 15, 7527);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `uid` int(11) NOT NULL,
  `uname` varchar(25) DEFAULT NULL,
  `upwd` varchar(32) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`uid`, `uname`, `upwd`, `avatar`) VALUES
(1, 'dingding', '123456', 'img/person/person1.jpg'),
(2, 'dangdang', '123456', 'img/person/person2.jpg'),
(3, 'xiaoming', '123456', 'img/person/person3.jpg'),
(4, '123', '123456', 'img/person/person1.jpg'),
(5, '123', '123456', 'img/person/person1.jpg'),
(6, '123454', '42344234', 'img/person/person1.jpg'),
(7, 'zhangsan', '123456', 'img/person/person1.jpg'),
(8, 'tom', 'qwerty', 'img/person/person1.jpg'),
(9, 'jerry', '123456', 'img/person/person1.jpg'),
(10, 'rose', 'aaaaaa', 'img/person/person1.jpg'),
(11, 'www', 'qqqqqq', 'img/person/person1.jpg'),
(12, 'qqq', 'qqqqqq', 'img/person/person1.jpg'),
(13, 'huahua', 'rreeqq', 'img/person/person1.jpg'),
(14, 'qinming', '123456', 'img/person/person1.jpg'),
(15, 'r43aa', '123456', 'img/person/person1.jpg'),
(16, 'taotao', '123123', 'img/person/person1.jpg'),
(18, 'dangdang112', '123456', 'img/person/person1.jpg'),
(19, '张思', '112233', 'img/person/1539608777369.jpg'),
(20, '马丁', '112233', 'img/person/1539609016745.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`aid`),
  ADD KEY `gid` (`gid`);

--
-- Indexes for table `carousel_pic`
--
ALTER TABLE `carousel_pic`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `introduce`
--
ALTER TABLE `introduce`
  ADD PRIMARY KEY (`iid`),
  ADD KEY `gid` (`gid`);

--
-- Indexes for table `islove`
--
ALTER TABLE `islove`
  ADD PRIMARY KEY (`iid`),
  ADD KEY `gid` (`gid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `mv`
--
ALTER TABLE `mv`
  ADD PRIMARY KEY (`mid`),
  ADD KEY `gid` (`gid`);

--
-- Indexes for table `mymenu`
--
ALTER TABLE `mymenu`
  ADD PRIMARY KEY (`mid`),
  ADD KEY `sid` (`sid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `playsong`
--
ALTER TABLE `playsong`
  ADD PRIMARY KEY (`lid`),
  ADD KEY `sid` (`sid`);

--
-- Indexes for table `playvedio`
--
ALTER TABLE `playvedio`
  ADD PRIMARY KEY (`lid`),
  ADD KEY `mid` (`mid`);

--
-- Indexes for table `singer`
--
ALTER TABLE `singer`
  ADD PRIMARY KEY (`gid`);

--
-- Indexes for table `songmenu`
--
ALTER TABLE `songmenu`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `gid` (`gid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `album`
--
ALTER TABLE `album`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- 使用表AUTO_INCREMENT `carousel_pic`
--
ALTER TABLE `carousel_pic`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `introduce`
--
ALTER TABLE `introduce`
  MODIFY `iid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- 使用表AUTO_INCREMENT `islove`
--
ALTER TABLE `islove`
  MODIFY `iid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;

--
-- 使用表AUTO_INCREMENT `mv`
--
ALTER TABLE `mv`
  MODIFY `mid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- 使用表AUTO_INCREMENT `mymenu`
--
ALTER TABLE `mymenu`
  MODIFY `mid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- 使用表AUTO_INCREMENT `playsong`
--
ALTER TABLE `playsong`
  MODIFY `lid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- 使用表AUTO_INCREMENT `playvedio`
--
ALTER TABLE `playvedio`
  MODIFY `lid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用表AUTO_INCREMENT `singer`
--
ALTER TABLE `singer`
  MODIFY `gid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- 使用表AUTO_INCREMENT `songmenu`
--
ALTER TABLE `songmenu`
  MODIFY `sid` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用表AUTO_INCREMENT `songs`
--
ALTER TABLE `songs`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- 限制导出的表
--

--
-- 限制表 `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`gid`) REFERENCES `singer` (`gid`);

--
-- 限制表 `introduce`
--
ALTER TABLE `introduce`
  ADD CONSTRAINT `introduce_ibfk_1` FOREIGN KEY (`gid`) REFERENCES `singer` (`gid`);

--
-- 限制表 `islove`
--
ALTER TABLE `islove`
  ADD CONSTRAINT `islove_ibfk_1` FOREIGN KEY (`gid`) REFERENCES `singer` (`gid`),
  ADD CONSTRAINT `islove_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`);

--
-- 限制表 `mv`
--
ALTER TABLE `mv`
  ADD CONSTRAINT `mv_ibfk_1` FOREIGN KEY (`gid`) REFERENCES `singer` (`gid`);

--
-- 限制表 `mymenu`
--
ALTER TABLE `mymenu`
  ADD CONSTRAINT `mymenu_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `songs` (`sid`),
  ADD CONSTRAINT `mymenu_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`);

--
-- 限制表 `playsong`
--
ALTER TABLE `playsong`
  ADD CONSTRAINT `playsong_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `songs` (`sid`);

--
-- 限制表 `playvedio`
--
ALTER TABLE `playvedio`
  ADD CONSTRAINT `playvedio_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `mv` (`mid`);

--
-- 限制表 `songs`
--
ALTER TABLE `songs`
  ADD CONSTRAINT `songs_ibfk_1` FOREIGN KEY (`gid`) REFERENCES `singer` (`gid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
