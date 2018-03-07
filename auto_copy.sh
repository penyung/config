#!/bin/bash


case $1 in
install)
  git clone https://github.com/VundleVim/Vundle.vim $HOME/.vim/bundle/Vundle.vim
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ln -s `pwd`/.bash_aliases ~/.bash_aliases
  ln -s `pwd`/.gitconfig ~/.gitconfig
  ln -s `pwd`/.tmux.conf ~/.tmux.conf
  ln -s `pwd`/.vimrc ~/.vimrc
  mkdir -p ~/.vim/colors/
  ln -s `pwd`/.vim/colors/256-jungle.vim  ~/.vim/colors/
  cp -r .vim/syntax/ ~/.vim/syntax/
  cp -r .vim/localvimrc/ ~/.vim/localvimrc/
  mkdir -p ~/local/
  cp -r script/ ~/local/
  ;;
back)
  cp ~/.vim/localvimrc/* .vim/localvimrc/
  cp ~/.vim/syntax/* .vim/syntax/
  cp ~/local/script/* ./script/
  ;;
*)
  echo "./auto_copy.sh <install|back>"
  exit
  ;;
esac
