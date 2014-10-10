---
layout: post
title: "我的zsh配置"
date: 2014-09-11 11:20:34 +0800
comments: true
categories: shell
---
``` java .zshrc  
#################### trace zsh time step 1/2 ######################################
#### set the trace prompt to include seconds, nanoseconds, script name and line number
#PS4='+$(date "+%s:%N") %N:%i> '

#### save file stderr to file descriptor 3 and redirect stderr (including trace 
#### output) to a file with the script's PID as an extension
#exec 3>&2 2>/tmp/startlog.$$

#### set options to turn on tracing and expansion of commands contained in the prompt
#setopt xtrace prompt_subst
#################### trace zsh time step 1/2 ######################################

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"

ZSH_THEME="af-magic"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/local/go/bin:/Users/haoweishow/Downloads/software/software.mac/apache-ant-1.8.4/bin:/opt/local/bin:"
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
export CLICOLOR=1
export LSCOLORS=gxfxaxdxcxegedabagacad

add_alias(){

}
alias dl='cd /Users/haoweishow/Downloads;pwd;echo "**************** Downloads ******************"'
alias dt='cd /Users/haoweishow/Desktop;pwd;echo "***************** Desktop ******************"'
alias dp='cd /Users/haoweishow/Dropbox;pwd;echo "***************** Dropbox ******************"'
alias doc='cd /Users/haoweishow/Documents;pwd;echo "***************** Documents ******************"'
alias tmp='cd /tmp;pwd;echo "**************** tmp ****************"'

alias wps='cd /Users/haoweishow/Documents/workspace;pwd'
alias jvm='cd /Users/haoweishow/Documents/code.jvm/openjdk.7u6'

#alias cp='cp -i'
#alias mv='mv -i'
#alias rm='rm -i'
alias ls='ls -FG'
alias ll='ls -l'
alias lr='ls -lrt'
alias grep='grep --color=auto'
alias vi='vim'
alias ds='du -sh *'
alias km='kill -9 `pgrep mobilepartner`'
alias vm='nohup /System/Library/Frameworks/JavaVM.framework/Versions/Current/Commands/jvisualvm &'

alias cls='clear'
alias clss='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
alias cc='top -l 1 -ncols 1|head -7|grep -E "CPU usage|PhysMem"'
alias cafe='cd /Users/haoweishow/Documents/code.gitcafe;pwd'
alias cdbin='cd /Users/haoweishow/Dropbox/code/java_workspace/SmartESB/bin;pwd'
alias cdmm='cd /Users/haoweishow/Dropbox/code/java_workspace/SmartMOM;pwd'
alias cdbl='cd /Users/haoweishow/Documents/blog/haoweishow.github.io;pwd'

alias eclipse='cd /Applications/eclipse/Eclipse.app/Contents/MacOS;sh 1_start.sh'

alias rp='rake preview'
alias rd='rake generate;rake deploy'
alias rake='noglob rake'

alias gs='git status'
alias gpush='git push origin master'
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"

hh()
{
    h1
    h3
    hgit
}

h1()
{
    echo "*******************************************************************************************************"
    echo "共享服务"
    echo "      sudo -s launchctl load -w /System/Library/LaunchDaemons/ftp.plist    #启动FTP服务"
    echo "      sudo -s launchctl unload -w /System/Library/LaunchDaemons/ftp.plist  #关闭FTP服务"
    echo "      python -m SimpleHTTPServer 8888                                      #启动Http服务"
    echo "环境变量"
    echo "      JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/Current/Commands"
    echo "系统优化"
    echo "      sudo periodic daily weekly monthly                  #系统维护"
    echo "      sudo xcode-select -switch /Applications/Xcode.app   #更新Xcode"
    echo "保持唤醒"
    echo "      pmset noidle"
    echo "程序配置"
    echo "      open -a GoShell —args config                             #GoShell程序配置"
    echo "      defaults write com.apple.finder AppleShowAllFiles TRUE   #Finder显示隐藏文件"
    echo "      defaults write com.apple.finder AppleShowAllFiles FALSE  #Finder不显示隐藏文件"
    echo "*******************************************************************************************************"
    echo "博客发布"
    echo "      rake new_post['title']          #创建一篇新的文章"
    echo "      rp = rake preview               #启动本地服务,预览博客"
    echo "      rd = rake generate;rake deploy  #发布文章到github"
    echo "      git push origin source          #提交本地代码到github的远程仓库的source分支"
}

hgit()
{
    echo "*******************************************************************************************************"
    echo "git操作"
    echo "      git remote update"
    echo "      git add ."
    echo "      git commit -m xxx"
    echo "      git push origin source"
    echo "      git rm --cache <file>"
    echo "      git status"
    echo "      git log"
    echo "      git diff <file>      #比较文件的历史版本"
}

h2()
{
    echo "*******************************************************************************************************"
    echo "软件下载"
    echo "      aria2c http://example.org/mylinux.iso"
    echo "      aria2c http://a/f.iso ftp://b/f.iso"
    echo "      aria2c http://example.org/mylinux.torrent"
    echo "      aria2c 'magnet:?xt=urn:btih:248D0A1CD08284299DE78D5C1ED359BB46717D8C'"
    echo "      aria2c -i uri.txt"
    echo "      aria2c -S bit.torrent #显示种子中包含了哪些文件"
}

h3()
{
    echo "******************************************************************************************************"
    echo "软件管理"
    echo "       brew search           #搜索软件"
    echo "       brew info xxxx        #软件检查"
    echo "       brew list             #安装列表"
    echo "       brew update           #软件更新"
    echo "       brew upgrade          #全部更新"
    echo "       brew install xxxx     #安装软件"
    echo "       brew remove xxxx      #软件删除"
    echo "       brew deps xxxx        #软件依赖"
    echo "       brew outdated         #过期软件"
}

#################### trace zsh time step 2/2 ######################################
#### 关闭 zsh tracing
#unsetopt xtrace
#restore stderr to the value saved in FD 3
#exec 2>&3 3>&-
#################### trace zsh time step 2/2 ######################################
```
