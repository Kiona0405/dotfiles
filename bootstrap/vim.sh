# /bin/bash

script=$(readlink -f $0)
here=$(dirname $script)


echo "before installing, you need to install python3!!!!!!!!!!"

# put vimrc
rm ~/.vimrc
ln -s $here/.vimrc ~

# install dein
tmp=iranai.sh
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $iranai
# For example, we just use `~/.cache/dein` as installation directory
sh $tmp ~/.cache/dein
rm $tmp

# install neovim
nstall -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install -y neovim python3-neovim

# transit from vim to neovim
init_file=~/.config/nvim/init.vim
touch $init_file
echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after" >> $init_file
echo "&packpath = &runtimepath" >> $init_file
echo "source ~/.vimrc" >> $init_file

echo "-----------task01-----------"
echo "please add alias at .bash_profile"
echo "alias vim='nvim'"
echo "-----------task02-----------"
echo "please install vim plugin with following commands"
echo "vim ."
echo ":call dein#install()"


