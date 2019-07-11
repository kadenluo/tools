#!/bin/sh
# 配置
git_user="kadenluo"
mariadb_user="test"
mariadb_passwd="123456"

function init_system()
{
    sudo yum -y install lrzsz
    sudo yum -y install gcc
    sudo yum -y install gcc-c++
    sudo yum -y install gdb
}

function init_vim()
{
    config_path=~/.vimrc
    if [ -f ${config_path} ];then
        cp -f "${config_path}" "${config_path}.bak"
    fi

    cp -f .vimrc ${config_path}

    if [ ! -d ~/.vim/bundle/Vundle.vim ];then
	    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    fi

    if [ -f "${config_path}" ];then
        echo "set rtp+=~/.vim/bundle/Vundle.vim" >> ${config_path}
        echo "call vundle#begin()" >> ${config_path}
        echo "Plugin 'gmarik/Vundle.vim'" >> ${config_path}
        echo "Plugin 'wxnacy/vim-mysql'" >> ${config_path}
        echo "Plugin 'pangloss/vim-javascript'" >> ${config_path}
        echo "call vundle#end()" >> ${config_path}
    fi
}

function init_git()
{
    which git
    if [ $? -ne 0 ];then
        return
        sudo yum -y install git
    fi

    git config --global user.name "${git_user}"
    git config --global color.diff auto
    git config --global color.interactive auto
    git config --global color.status auto
    git config --global color.branch auto
    git config --global credential.helper store
}

function init_mariadb()
{
    which mysql
    if [ $? -ne 0 ];then
        sudo yum -y install mariadb mariadb-server
        sudo systemctl start mariadb 
        sudo systemctl enable mariadb
    fi

    ret=$(mysql -uroot -e "select * from mysql.user where user='${mariadb_user}'" | wc -l)
    if [ $ret -ne 0 ];then
        mysql -uroot -e "create user '${mariadb_user}'@'localhost' identified by '${mariadb_passwd}'"
        mysql -uroot -e "create user 'flush privileges'"
    fi

    if [ -f "./init_db.sql" ];then
        mysql -uroot < ./init_db.sql
    fi
}

init_system
init_git
init_vim
init_mariadb

