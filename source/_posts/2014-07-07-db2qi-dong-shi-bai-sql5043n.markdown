---
layout: post
title: "DB2启动失败(SQL5043N)"
date: 2014-07-07 16:41:11 +0800
comments: true
categories: db2
---
## 背景
***
操作系统：  CentOS 6   
数据库版本：db2_v101_linuxia32_expc   
数据库实例名称：esbinst  
实例用户名称：esbinst   
数据库安装成功   
数据库实例创建成功

## 问题
***
执行***db2start***命令，启动数据库报错如下：  
    SQL5043N  Support for one or more communications protocols failed to start successfully. However, core database manager functionality started successfully.   
执行***netstat -na|grep 50000***，返回空。

## 排查
***
在实例用户的目录中查看日志  
    home/esbinst/sqllib/db2dump/db2diag.0.log  
存在如下的内容：  
    2014-07-07-11.45.59.454360-240 E365892G529          LEVEL: Error  
    PID     : 25807                TID : 3025136496     PROC : db2sysc  
    INSTANCE: esbinst              NODE : 000  
    HOSTNAME: localhost.localdomain  
    EDUID   : 1                    EDUNAME: db2sysc  
    FUNCTION: DB2 UDB, common communication, sqlcctcpconnmgr, probe:50  
    MESSAGE : ADM7006E  The SVCENAME DBM configuration parameter was not configured.  Update the SVCENAME configuration parameter using the service name defined in the TCP/IP services file.  

## 解决
***    
Step1:  
    db2 update dbm cfg using SVCENAME esbinst  
Step2: 在文件/etc/services的末尾添加，或者修改为下面的格式：
    esbinst     50000/tcp  
