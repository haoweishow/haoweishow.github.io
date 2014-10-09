---
layout: post
title: "性能问题排查"
date: 2014-10-09 14:09:46 +0800
comments: true
categories: 性能
---
### Linux系统
* 定位占用cpu高的java线程   
```
top -H -p <pid> -d 1 -n3
```
* 查看该线程的执行时间  
```
ps -mp <pid> -o THREAD,tid,time
```
* 通过pstack查看进程的栈信息  
```
pstack <pid>
```

### Aix系统
* 定位占用cpu高的java线程   
```
ps -mp <pid> -o THREAD
结果显示格式：线程十进制的ID 状态:(R/S/Z) CPU占用百分比 其它...
```
* 将十进制线程ID转换为十六进制  
```
printf "%x\n" 131268965
```
* 查找线程  
```
kill -3 <pid>
根据十六进制的线程ID，可以定位到占用CPU高的线程
```