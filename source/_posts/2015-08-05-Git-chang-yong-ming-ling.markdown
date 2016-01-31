---
layout: post
title: "Git常用命令"
date: 2015-08-05 23:18:00 +0800
comments: true
categories: git
---
## 数据库维护
* 查看数据库的使用统计`git count-objects -v`
* 数据库垃圾回收`git gc`
## 恢复分支
* 查看最近访问的sha1数(版本号)`git reflog`
* 重新创建删去的分支`git branch experimental SHA1_OF_HASH`
## 基本命令
* 添加文件到暂存区`git add .`
* 提交并添加注释`git commit -a -m "xx"`
* 修改文件名称`git mv oldname newname`
* 删除文件`git rm file`
* 删除文件夹`git rm -r dir`
* 停止跟踪文件但不删除`git rm --cached file`
## 合并
* 把dev分支合并到当前分支`git merge dev`
* `git rebase branch`
## 分支
* 创建并切换到新分支`git checkout -b dev`
* 切换分支`git checkout dev`
* 以某个版本创建分支`git checkout -b dev commitid`
* 在主分支的基础上创建分支`git checkout -b dev master`
* 创建分支`git branch dev`
* 删除分支`git branch -d dev`
* 强制删除`git branch -D dev`
* 查看分支`git branch`
* 修改分支名称`git branch -m oldname newname`
## 标签
* 抽取某个tag的版本`git archive --format=zip --output=v1.0.zip v1.0`
* 列出所有本地tag`git tag`
* 创建标签,基于已经提交的版本`git tag tagname`
* 删除标签`git tag -d tagname`

