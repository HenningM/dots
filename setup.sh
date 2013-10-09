#!/usr/bin/env sh

git submodule update --init --recursive

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
