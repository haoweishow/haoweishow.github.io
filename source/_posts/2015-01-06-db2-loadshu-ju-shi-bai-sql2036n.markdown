---
layout: post
title: "DB2 load数据失败(SQL2036N)"
date: 2015-01-06 17:38:09 +0800
comments: true
categories: db2
---
## 背景
* 数据库实例用户:  userA   
* 数据操作用户:    userB

## 操作
* userB执行export命令,导出ixf格式的数据;   
* userB执行import命令,导入ixf格式的数据,正常导入;   
* userB执行load命令,导入ixf格式的数据,导入失败;   
```
SQL2036N  The path for the file or device
"/home/esb/batch/data/tmp_xxxx_20141101.ixf" is not valid.
```

## 解决
* 数据库实例用户userA对文件**/home/esb/batch/data/tmp_xxxx_20141101.ixf**没有访问权限.   
* 给userA授权对该文件的访问权限,即可使用load导入数据.
