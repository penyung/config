#!/bin/bash


case $1 in
install)
  cp .bash_aliases ~/.bash_aliases
  cp .gitconfig ~/.gitconfig
  cp .tmux.conf ~/.tmux.conf
  cp .vimrc ~/.vimrc
  mkdir -p ~/.vim/colors/
  cp .vim/colors/256-jungle.vim ~/.vim/colors/256-jungle.vim
  mkdir -p ~/local/
  cp -r script/ ~/local/
  ;;
back)
  cp ~/.bash_aliases .bash_aliases
  cp ~/.gitconfig .gitconfig
  cp ~/.tmux.conf .tmux.conf
  cp ~/.vimrc .vimrc
  cp ~/.vim/colors/256-jungle.vim .vim/colors/256-jungle.vim
  cp ~/local/script/* ./script/
  ;;
*)
  echo "./auto_copy.sh <install|back>"
  exit
  ;;
esac
