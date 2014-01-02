#!/usr/bin/env sh

echo "Dependencies"
echo "------------"
set -ex
sudo apt-get update
sudo apt-get install git mosh zsh
set +x
echo ""

. lib/gitconfig.sh
. lib/backup.sh

echo -n "" > $PWD/setup.log

echo -n "Cloning/updating submodules..."
git submodule update --init --recursive >> $PWD/setup.log 2>&1
echo "OK"
echo ""


# backup old files
echo "Backup"
echo "------"
backup_file ../.bin
backup_file ../.vim
backup_file ../.vimrc
backup_file ../.profile
backup_file ../.zsh
backup_file ../.zshrc
backup_file ../.gitconfig
backup_file ../.tmux.conf
echo ""

configure_git

echo "Misc configuration"
echo "-------------"
echo -n "Installing new configuration files..."
# bin
ln -s $PWD/bin ../.bin

# vim
ln -s $PWD/vim ../.vim
ln -s $PWD/vim/vimrc ../.vimrc

# profile
ln -s $PWD/profile ../.profile

# zsh
ln -s $PWD/zsh ../.zsh
ln -s $PWD/zsh/zshrc ../.zshrc

# git
ln -s $PWD/gitconfig.local ../.gitconfig

# tmux
ln -s $PWD/tmux.conf ../.tmux.conf
echo "OK"
