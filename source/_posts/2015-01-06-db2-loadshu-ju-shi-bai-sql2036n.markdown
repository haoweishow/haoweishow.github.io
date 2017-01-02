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
* userA执行load命令,导入ixf格式的数据,导入失败;   
```
SQL2036N  The path for the file or device
"/home/esb/batch/data/tmp_xxxx_20141101.ixf" is not valid.
```

## 解决
* 数据库实例用户userA对文件**/home/esb/batch/data/tmp_xxxx_20141101.ixf**没有访问权限.   
* 给userA授权对该文件的访问权限,即可使用load导入数据.

## 更新
2016年12月31日更新   
距离这篇文章发布两年,有网友遇到同样的问题,回过头来再看这篇文章,只是涉及到表象,没有深入原理.   
目前的工作环境中已经不再使用 DB2 , 所以排查过程中我也只能提各种方法而已.  

### 现象:
* userA导出的文件X userB无法导入.
  
### 排查
* userB对导出的文件X有读写的权限.
* 两个用户都是属于同一个组.
* 存放文件X的文件夹的属主是 userA  

### 解决
* 如果将文件拷贝到 userB 属主的文件夹中, userB 可以导入成功.  
* 该问题的分析至此结束.

