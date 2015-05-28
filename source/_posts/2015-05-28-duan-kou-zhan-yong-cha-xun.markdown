---
layout: post
title: "端口占用查询"
date: 2015-05-28 17:04:46 +0800
comments: true
categories: diag
---
 
 **(根据端口号,查找对应的进程)**
 
## Win系统
* 查找pid: `C:\>netstat -aon|findstr "1088"`
* 查找进程名称: `C:\>tasklist|findstr "<pid>"`

## Linux系统
* 方法1: `lsof -i :8388`
* 方法2: `netstat -ntlp`
```
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      868/sshd
tcp6       0      0 :::22                   :::*                    LISTEN      868/sshd
```

## Aix系统
* step1: `netstat -Aan|grep 6200|grep LISTEN`
* step2: `rmsock f1000e0000307bb0 tcpcb`
* step3: `ps -ef|grep <pid>`

