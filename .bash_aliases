source $HOME/local/script/util.sh
alias cls='clear'
alias tmux='tmux -2'
alias ll='ls -al'
alias grep='grep --color'

export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u@\h\[\033[00m\]:\[\033[01;31m\]\w\[\033[00m\]\$ '
export PATH="$HOME/local/script/:$HOME/local/bin/:$PATH"
shopt -s checkwinsize
