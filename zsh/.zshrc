# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/alexpetro/.oh-my-zsh"
export EDITOR=nvim

ZSH_THEME='eastwood'

touch .hushlogin

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias v="nvim"
alias c="clear"
alias x="exit"
alias t="tmux" 
alias k="killall tmux"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/alexpetro/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/alexpetro/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/alexpetro/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/alexpetro/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#fuzzy finder source
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

