source $HOME/local/script/util.sh
alias cls='clear'
alias tmux='tmux -2'
alias ls='ls --color=auto'
alias ll='ls -al'
alias grep='grep --color'

export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u@\h\[\033[00m\]:\[\033[01;31m\]\w\[\033[00m\]\$ '
export PATH="$HOME/local/script/:$HOME/local/bin/:$PATH"
export LD_LIBRARY_PATH="$HOME/local/lib:$LD_LIBRARY_PATH"
shopt -s checkwinsize

if [ -f "config/ondir/scripts.sh" ]; then
  source config/ondir/scripts.sh
fi
