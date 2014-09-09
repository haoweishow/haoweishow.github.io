---
layout: post
title: "格式化Java代码"
date: 2014-09-05 10:55:16 +0800
comments: true
categories: java
---
## 背景
***
* 产品中一个核心模块，会根据配置文件生成运行时的java代码（一个完整的java类）。  
* 自动生成的java类，没有对其进行格式化。   
* 排错时不方便阅读，代码量小还好，代码多的话，很难看清楚里面的逻辑，因此每次都是把代码拷贝到eclipse里面格式之后再看。  

## 过程
***
* 搜索到这个文章,[How to use the eclipse code formatter from your code](http://ssscripting.wordpress.com/2009/06/10/how-to-use-the-eclipse-code-formatter-from-your-code/),自备梯子.<!-- more -->  
* 作者是通过eclipse的formatter组件实现代码的格式化.   
* 按照文章的描述逐步实现,引入eclipse的10个jar包,可以实现代码的格式化.   
* 但是引入10个jar到项目中,过于复杂.   
* 该文章的评论中有人提到[jastyle](http://sourceforge.net/projects/jastyle/).    

## 实现
* 下载jastyle的源码,并导入到eclipse工程中,当然也可以直接下载jar包使用.下图是导入到ecipse里的源码,可以看到代码还是很精简独立的.      
{% img /images/postImage/20140905-1.png %} 
* 该模块的Main.java是格式化java代码的入口类.    
* 从中抽取出格式化单个java文件函数,测试代码:   
``` java TestJavaFormat.java 
package net.barenca.jastyle;import java.io.BufferedReader;import java.io.BufferedWriter;import java.io.File;import java.io.FileReader;import java.io.FileWriter;import java.io.IOException;import java.io.PrintWriter;import java.io.Reader;public class TestJavaFormat {	public static void main(String[] args) throws IOException {		String fileName = "C:/share/javaworkspace/jar/src/Test.java";		Reader in = new BufferedReader(new FileReader(fileName));		String tmpFileName = fileName + ".tmp";		File file = new File(tmpFileName);		file.delete();		PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(tmpFileName)));
				//开始对文件进行格式化		ASFormatter formatter = new ASFormatter();		formatter.setJavaStyle();		ASStreamIterator streamIterator = new ASStreamIterator(in);		formatter.init(streamIterator);		while (formatter.hasMoreLines()) {			out.println(formatter.nextLine().toString());		}
				out.flush();		out.close();		in.close();
				new File(fileName).renameTo(new File(fileName + ".orig"));		new File(tmpFileName).renameTo(new File(fileName));	}}
```
