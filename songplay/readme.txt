学子商城vue版本后台程序
目录结构
  xuezi  --   保存所有后台项目使用程序
    app.js  项目入口程序
    public  静态资源项目
    node_modules(express;mysql)
    pool.js 连接池
    db.sql  数据库脚本文件
    router  路由模块
      图片轮播 imagelist.js
      新闻  newslist.js

功能一：用户发送请求获取图片轮播内容
        get /imagelist JSON  图片轮播对象
功能二：用户发送请求获取新闻列表
        get /newslist JSON   新闻列表对象
功能三：用户发送请求获取新闻详细
        get /newslist/details?i=1  JSON  新闻列表