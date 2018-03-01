#!/bin/bash


case $1 in
install)
  git clone https://github.com/VundleVim/Vundle.vim $HOME/.vim/bundle/Vundle.vim
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  cp .bash_aliases ~/.bash_aliases
  cp .gitconfig ~/.gitconfig
  cp .tmux.conf ~/.tmux.conf
  cp .vimrc ~/.vimrc
  mkdir -p ~/.vim/
  cp -r .vim/colors/ ~/.vim/colors/
  cp -r .vim/syntax/ ~/.vim/syntax/
  cp -r .vim/localvimrc/ ~/.vim/localvimrc/
  mkdir -p ~/local/
  cp -r script/ ~/local/
  ;;
back)
  cp ~/.bash_aliases .bash_aliases
  cp ~/.gitconfig .gitconfig
  cp ~/.tmux.conf .tmux.conf
  cp ~/.vimrc .vimrc
  cp ~/.vim/colors/256-jungle.vim .vim/colors/256-jungle.vim
  cp ~/.vim/localvimrc/* .vim/localvimrc/
  cp ~/.vim/syntax/* .vim/syntax/
  cp ~/local/script/* ./script/
  ;;
*)
  echo "./auto_copy.sh <install|back>"
  exit
  ;;
esac
