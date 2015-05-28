---
layout: post
title: "端口占用查询"
date: 2015-05-28 17:04:46 +0800
comments: true
categories: diag
---
 
 **根据端口号,查找对应的进程**
 
## Win系统
* 查找pid: `C:\>netstat -aon|findstr "1088"`
* 查找进程名称: `C:\>tasklist|findstr "<pid>"`

## Linux系统
* 查找pid: `lsof -i :8388`

## Aix系统
* step1: `netstat -Aan|grep 6200|grep LISTEN`
* step2: `rmsock f1000e0000307bb0 tcpcb`
* step3: `ps -ef|grep <pid>`

