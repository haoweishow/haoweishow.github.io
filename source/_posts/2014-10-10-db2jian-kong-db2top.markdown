---
layout: post
title: "DB2监控-db2top"
date: 2014-10-10 11:18:41 +0800
comments: true
categories: db2
---
### db2top命令使用
* **db2top -d <dbname>**  该命令的面板  
{% img /images/postImage/20141010-db2top1.png %}
* **shift+d** 查看SQL执行情况,包括SQL的调用次数,执行时间等  
  通常可以根据SQL的**执行次数**以及**执行时间**可以判断数据库当前的处理能力
{% img /images/postImage/20141010-db2top2.png %}
* 每条sql都有对应的HashValue,**shift+l**可以根据该sql的HashValue查看完整的sql语句  
{% img /images/postImage/20141010-db2top3.png %}
