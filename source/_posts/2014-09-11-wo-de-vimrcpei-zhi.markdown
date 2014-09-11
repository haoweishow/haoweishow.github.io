---
layout: post
title: "我的vimrc配置"
date: 2014-09-11 11:11:27 +0800
comments: true
categories: vim shell
---

``` java .vimrc  
"== 
"Author :haoweishow
"Website:haoweishow.com
"Version:1.0 
"==

"语法高亮
syntax enable
syntax on

"显示行号
set number

"******************状态栏*******************
"打开状态栏的坐标信息
set ruler
"取消底部状态栏显示。1为关闭，2为开启。
set laststatus=2
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
"******************状态栏*******************

"将输入的命令显示出来，便于查看当前输入的信息
set showcmd
"设置vim存储的历史命令记录的条数
set history=200
"下划线高亮显示光标所在行
set cursorline
"插入右括号时会短暂地跳转到匹配的左括号 
set showmatch
"不对匹配的括号进行高亮显示 
let loaded_matchparen=1 
"在执行宏命令时，不进行显示重绘；在宏命令执行完成后，一次性重绘，以便提高性能。 
set lazyredraw
"设置一个tab对应4个空格 
set tabstop=4 
"在按退格键时，如果前面有4个空格，则会统一清除 
set softtabstop=4
"最基本的自动缩进 
set autoindent shiftwidth=4
"高亮显示搜索匹配到的字符串 
set hlsearch
"在搜索模式下，随着搜索字符的逐个输入，实时进行字符串匹配，并对首个匹配到的字符串高亮显示 
set incsearch

"自动设置目录为正在编辑的文件所在的目录
set autochdir
```