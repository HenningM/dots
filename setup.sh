#!/usr/bin/env sh

echo -n "" > $PWD/setup.log

echo -n "Cloning/updating submodules..."
git submodule update --init --recursive >> $PWD/setup.log 2>&1
echo "OK"


# backup old files
echo -n "Storing old configuration files..."
backupPath="$PWD/backup"
dateStr=`date +%d%m%Y-%H%M%S`

curBackup="$backupPath/$dateStr/"
mkdir -p $curBackup

mv ../.bin $curBackup
mv ../.vim ../.vimrc $curBackup
mv ../.profile $curBackup
mv ../.zsh ../.zshrc $curBackup
echo "OK"


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
echo "OK"
