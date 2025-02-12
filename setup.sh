#!/usr/bin/env sh

echo "Dependencies"
echo "------------"
set -ex
sudo apt-get update
sudo apt-get install git mosh zsh stow zsh-autocomplete zsh-syntax-highlighting
set +x
echo ""

. lib/gitconfig.sh

echo -n "" > $PWD/setup.log

echo -n "Cloning/updating submodules..."
git submodule update --init --recursive >> $PWD/setup.log 2>&1
echo "OK"
echo ""


# Fill templates
configure_git

echo "Misc configuration"
echo "-------------"
echo -n "Installing new configuration files..."

cd stow
stow -t $HOME *
echo "OK"
