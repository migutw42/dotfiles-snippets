bindkey -e
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

fpath=(~/.zsh/completion $fpath)

export ZPLUG_HOME=$HOME/.zplug
source $ZPLUG_HOME/init.zsh

zplug zsh-users/zsh-syntax-highlighting
zplug zsh-users/zsh-autosuggestions, defer:2  
zplug zsh-users/zsh-completions
zplug themes/simple, from:oh-my-zsh
zplug mattberther/zsh-pyenv


if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load --verbose

function ghq-fzf() {
  local selected_dir=$(ghq list -p | fzf --query="$LBUFFER")

  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi

  zle reset-prompt
}

zle -N ghq-fzf
bindkey "^g" ghq-fzf

export EDITOR=vim

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

export PATH=$(go env GOPATH)/bin:$PATH
export PATH="/usr/local/sbin:$PATH"
