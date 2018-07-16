[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
source /usr/local/opt/asdf/asdf.sh

alias ls='gls --color=auto'
alias ll='ls -al'
alias less='less -R'

alias settings_edit='nvim ~/.bashrc'
alias settings_reload='exec $SHELL -l'
alias reload='settings_reload'

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export EDITOR=nvim
export PS1='\[\033[1;32m\]\u\[\033[00m\]:\[\033[1;34m\]\w\[\033[1;31m\]$(__git_ps1)\[\033[00m\] \$ '

