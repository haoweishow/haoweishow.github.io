---
layout: post
title: "部署octopress"
date: 2014-07-07 17:52:56 +0800
comments: true
categories: octopress
---
## 背景
***
* 操作系统：MacOS 10.9.4  
* 已有域名：haoweishow.com

## 安装
***
### 安装octopress
```
    cd /Users/haoweishow/Documents   
    git clone git://github.com/imathis/octopress.git octopress
    cd /Users/haoweishow/Documents/octopress  
    bundle update
    rake install
```
### 设置github信息
```
    rake setup_github_pages
    输入：git@github.com:haoweishow/haoweishow.github.io.git
```
### 设置域名信息
```
    echo ‘haoweishow.com' >> source/CNAME
```

## 发布
***
### 创建文章
```  
    alias rake='noglob rake'  #使rake命令支持[和]符号
    rake new_post['title']
```
### 提交文章
```
    rake generate
    rake deploy               #将文章部署到github服务器上
```
### 提交源码
```
    git add .
    git commit -m "xxxx"
    git push origin source    #将本地代码提交至github
```

## 测试
***
* 在本地服务器上预览页面  
* 启动本地服务  
    ```rake preview ``` 
* 访问本地页面  
    ```http://localhost:4000```


