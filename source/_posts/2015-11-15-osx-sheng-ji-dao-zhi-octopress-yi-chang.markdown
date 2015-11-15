---
layout: post
title: "OSX 升级导致 octopress 异常"
date: 2015-11-15 08:57:31 +0800
comments: true
categories: octopress 
---
## 现象
octopress创建文章,本地测试,上传等命令都无法使用.
## 解决
```
ruby -v   #ruby 版本异常
brew update
brew install rbenv ruby-build
rbenv install 2.2.3 #这个之后只是安装了2.2.3版本,但并未在环境变量中生效
在.bash_profile 中增加 export PATH=/Users/haoweishow/.rbenv/versions/2.2.3/bin:$PATH
gem install bundler
rbenv rehash
bundle install  #进入博客的目录执行该命令(需要 Gemfiles,在2.2.3中在重新安装一次 octopress 依赖的组件,2.0.0的 ruby 目录/Library/Ruby/Gems/2.0.0)
```
## 参考
* http://www.jianshu.com/p/dff042c2d10d
* http://schalkneethling.github.io/blog/2015/10/16/errno-enoent-no-such-file-or-directory-jekyll-octopress-el-capitan/

