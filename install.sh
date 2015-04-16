#!/bin/bash
DIR=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)

if [ ! -e $HOME/.vimrc ]; then
  CMD="+:PlugInstall +qall"
else
  CMD="+:PlugUpdate +qall"
fi

ln -sf $DIR/.vimrc $HOME/.vimrc
ln -sf $DIR/.vim $HOME/.vim
vim $CMD

read -p "Do you want to install other dependencies? (y/n)" -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
  echo "We will omit installation of dependencies"
else
  sudo apt-get install exuberant-ctags git build-essential cmake python-dev fonts-mplus silversearcher-ag
  sudo npm install -g js-beautify
  sudo git clone https://github.com/mozilla/doctorjs.git /usr/src/doctorjs
  cd /usr/src/doctorjs
  sudo git submodule update --init --recursive
  sudo make install
  cd ~/.vim/plugged/YouCompleteMe
  ./install.sh --clang-completer
  cd ~/.vim/plugged/tern_for_vim
  npm install
  mkdir ~/.vim/undo
fi
