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

#fuzzy finder source
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

