---
layout: post
title: "DB2数据库同步"
date: 2015-04-08 14:03:52 +0800
comments: true
categories: db2
---
# 背景
* 在进行第二轮UAT测试的时候,需要进行版本重新部署,该部署过程要与上线一致(即验证投产的程序和SQL版本的正确性,验证部署说明的可操作性),因此需要将该UAT环境与准生产环境初始化成一致的状态.
* 应用程序直接拷贝过来即可.
* 数据库需要进行同步,来保证UAT环境的数据库和准生产环境的数据库一致.

# 前提
* 数据库: DB2 V9.7
* 准生产环境: 简称PRD 
* 准生产数据库名称: prddb
* UAT环境: 简称UAT
* UAT数据库名称名称: uatdb
* 数据库实例用户: db2inst
* 数据库应用用户: db2app
* 注:两个环境的数据库表结构/表空间等信息一致
* 注:导入导出涉及两个用户,下述步骤忽略用户操作的目录和权限相关内容,在实际操作中请自行处理

# 导出
## 导出DDL
* db2app用户登录PRD环境
* 连接数据库: `db2 connect to prddb`
* 导出DDL: `db2look -d prddb -e -o ddl.sql`
* 关闭连接: `db2 connect reset`
* 注:上述命令会导出db2app用户相关的所有表/视图/存储过程等

## 导出数据
* db2inst用户登录PRD环境
* 创建目录: `mkdir prddb.ixf;cd prddb.ixf`
* 导出ixf: `db2move prddb export`

# 数据迁移
* 将db2db.sql文件从PRD环境传输到UAT环境
* 将prddb.ixf文件夹从PRD环境传输到UAT环境

# 导入
## 创建表
* db2app用户登录UAT环境
* 删除uatdb库中的全部表/视图/存储过程等,该步骤需要手动执行
* 修改db2db.sql文件中的数据库名称为uatdb
* 连接数据库: `db2 connect to uatdb`
* 执行命令`db2 -tvf db2db.sql`重新创建表/视图/存储过程等
* 关闭连接: `db2 connect reset`

## 导入数据
* db2inst用户登录UAT环境
* 进入文件夹: `cd prddb.ixf`
* 导入ixf:`db2move uatdb load -u db2app -p db2app`
* 注:-u 对应数据库用户名称;-p 是该用户的密码;此处采用load参数,所有的ixf文件的数据是insert到表中的.

