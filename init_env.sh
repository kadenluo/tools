cp ~/.vimrc ~/.vimrc_bak
cp .vimrc ~/.vimrc -f

username=kaden
if [ ! -d "/home/$kaden" ];then
    useradd kaden
    passwd kaden
fi

grep -q "${username}[ \t]*ALL=" /etc/sudoers
if [ $? -ne 0 ];then
    sed '/^root[ \t]*ALL=.*ALL$/a${username}   ALL=(ALL)    NOPASSWD: ALL' -i /etc/sudoers
fi

sudo yum -y install lrzsz
sudo yum -y install gcc
sudo yum -y install gcc-c++
sudo yum -y install gdb

sudo yum -y install git
git config --global user.name 'kadenluo'
git config --global color.diff auto
git config --global color.interactive auto
git config --global color.status auto
git config --global color.branch auto
git config --global credential.helper store

sudo yum -y install mariadb mariadb-server
sudo systemctl start mariadb 
sudo systemctl enable mariadb

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "set rtp+=~/.vim/bundle/Vundle.vim" >> ~/.vimrc
echo "call vundle#begin()" >> ~/.vimrc
echo "Plugin 'gmarik/Vundle.vim" >> ~/.vimrc
echo "Plugin 'wxnacy/vim-mysql'" >> ~/.vimrc
echo "Plugin 'pangloss/vim-javascript'" >> ~/.vimrc
echo "call vundle#end()" >> ~/.vimrc
