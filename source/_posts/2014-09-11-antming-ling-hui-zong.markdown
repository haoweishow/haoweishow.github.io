---
layout: post
title: "Ant命令汇总"
date: 2014-09-11 14:49:43 +0800
comments: true
categories: ant
---
## 更新zip包
```
<target name="zip">
    <zip destFile="111.zip" basedir="." includes="123.txt" update="true" />
</target>
```

## 调用target
* 方法1  
```
<target name="war.import" depends="svn.task,war.name">
    <echo>A: ${war.name}</echo>
</target>
```
* 方法2  
```
<target name="war.import" depends="svn.task">
    <antcall target="war.name"/>
    <echo>B: ${war.name}</echo>
</target>
```

## copy命令
* 拷贝单个文件  
```
<copy todir="/home/esb" file="/tmp/config/build.xml"/>
```
* 拷贝文件夹  
```
<copy todir="/home/esb" includeEmptyDirs="yes" overwrite=“true” verbose="true">
    <fileset dir="/test/config">
        <include name="aaa/**"/>
        <exclude name="bbb/**"/>
    </fileset>
</copy>
```

## 文件移动
* 文件改名  
```
<move file="src1/test.txt" tofile="src/test.txt"/>
```
* 单个文件移动  
```
<move file="src1/test.txt" todir="src"/>
```
* 文件夹移动  
```
<move todir="src"> 
    <fileset dir="src1"/>
</move>
```

## javac设置classpath
* 方法1  
```
<javac srcdir="${src}" destdir="${classes}">
    <classpath>
        <fileset dir="lib">
            <include name="*.jar"/>
        </fileset>
        <path locaiton="build/classes" />
    </classpath>
</javac>
```
* 方法2  
``` 
<javac srcdir="${src}" destdir="${classes}">
    <classpath>
        <fileset dir="build/lib/" includes="*.jar" />
        <dirset dir="build/classes/" />
    </classpath>
</javac>
```

## javac参数
```
<javac srcdir="${common.src.dir}" destdir="${build.temp.common.classes.dir}" debug="on" memoryMaximumSize="256m" fork="true" deprecation="off" failonerror="false">
    <!--给编译器指定编码，防止出现："警告： 编码 GBK 的不可映射字符"-->
    <compilerarg line="-encoding UTF-8"/>
    <classpath refid="common.lib.path"/>
    <include name="**"/>
</javac>
```

## jar参数
```
<jar destfile="${dest.jar.name}">
    <fileset dir="${dest.classes.dir}">
        <include name="com/**/**/*.class" />
    </fileset>
    <manifest>
        <!-- 增加MF的参数信息 --> 
        <attribute name="Main-class" value="${mainclass}"/>
        <attribute name="Class-Path" value="${mf.classpath}"/>
    </manifest>
</jar>
```

## 文件转路径

```
<!-- Create a property containing all .jar files, prefix lib/, and seperated with a space -->
<pathconvert property="mf.classpath" pathsep=" ">  
    <mapper>  
        <chainedmapper>  
            <!-- jar包文件只留文件名，去掉目录信息 -->  
            <flattenmapper/>  
            <!-- add lib/ prefix -->  
            <globmapper from="*" to="lib/*"/>  
        </chainedmapper>  
    </mapper>  
    <path refid="lib-classpath"/>  
</pathconvert>
```

## 执行java程序
```
<target name="test-crawl1">
    <java classname="org.apache.nutch.crawl.Crawl">
        <classpath>
            <path location="build/classes"></path>
        </classpath>
        <classpath>
            <fileset dir="lib" includes="**/*.jar"></fileset>
        </classpath>
        <arg value="multiurls1.txt"/>
        <arg value="-dir"/>
        <arg value="crawed1"/>
        <arg value="-depth"/>
        <arg value="7"/>
        <arg value="-threads"/>
        <arg value="7"/>
        <arg value="-topN"/>
        <arg value="-100"/>
    </java>
</target>
```