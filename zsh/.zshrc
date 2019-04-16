bindkey -e
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fpath=(~/.zsh/completion $fpath)

export ZPLUG_HOME=$HOME/.zplug
source $ZPLUG_HOME/init.zsh

zplug zsh-users/zsh-syntax-highlighting
zplug zsh-users/zsh-autosuggestions, defer:2  
zplug zsh-users/zsh-completions
zplug migutw42/zsh-fzf-ghq
zplug themes/simple, from:oh-my-zsh

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load --verbose

export EDITOR=nvim
alias vi=nvim
alias vim=nvim

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

source ~/.config/shell/*.sh

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
