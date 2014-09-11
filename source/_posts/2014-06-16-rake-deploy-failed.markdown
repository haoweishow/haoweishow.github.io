---
layout: post
title: "rake deploy failed"
date: 2014-06-16 17:20:04 +0800
comments: true
categories: [octopress]
---
## 过程
***
1.按照[octopress.org](http://www.octopress.org)网站上的说明，本地安装完成，并成功部署到github上;  
2. 访问[http://haoweishow.com](http://haoweishow.com)可以看到部署的页面;
3. 但是在通过safari访问[repo](https://github.com/haoweishow/haoweishow.github.io),在网页上增加了README.md的文件，提交成功；  
4. 然后本地修改其它配置，通过reke deploy的时候出现下面的错误
    To git@github.com:haoweishow/haoweishow.github.io.git  
    ! [rejected]        master -> master (non-fast-forward)  
    error: failed to push some refs to 'git@github.com:haoweishow/ haoweishow.github.io.git'  
    hint: Updates were rejected because the tip of your current branch is behind  
    hint: its remote counterpart. Integrate the remote changes (e.g.  
    hint: 'git pull ...') before pushing again.  
    hint: See the 'Note about fast-forwards' in 'git push --help' for details.  


## 解决
***
在stackoverflow.com上找到[解决方法](http://stackoverflow.com/questions/17609453/rake-gen-deploy-rejected-in-octopress);  
    需要修改项目中Rakefile文件的内容：  
    原始内容：system "git push origin #{deploy_branch}"  
    改后内容：system "git push origin +#{deploy_branch}"  多个+号；  
    再次执行rake deploy，至此，我的问题解决，项目可以deploy到github，回头再将+号去掉；  
