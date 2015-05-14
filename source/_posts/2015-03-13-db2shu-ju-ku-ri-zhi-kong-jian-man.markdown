---
layout: post
title: "DB2数据库日志空间满"
date: 2015-03-13 11:14:36 +0800
comments: true
categories: db2
---
DB2数据库日志空间满

##错误:
```
SQL0964C The transaction log for the database is full. SQLSTATE=57011
```

##检查数据库日志配置
```
db2 connect to esbdbfe user esbinst using esbinst 
db2 get db cfg for esbdbfe show detail |grep -i log
Log buffer size(4KB)  (LOGBUFSZ) = 8192      8192
Log file size(4KB)   (LOGFILSIZ) = 655       655   #单个日志文件size太小
```

##更新数据库日志配置
```
db2 connect to esbdbfe user esbinst using esbinst
db2 update db cfg using LOGFILSIZ 10240  
db2stop force 
db2start
```

