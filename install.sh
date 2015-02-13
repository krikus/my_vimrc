#!/bin/bash
DIR=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)

if [ ! -e $HOME/.vimrc ]; then
  CMD="+:PlugInstall"
else
  CMD="+:PlugUpdate"
fi

ln -sf $DIR/.vimrc $HOME/.vimrc
ln -sf $DIR/.vim $HOME/.vim
vim $CMD

echo "Installation completed - now you can run your vim"
