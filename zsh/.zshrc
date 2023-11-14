# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/alexpetro/.oh-my-zsh"
export EDITOR=nvim



ZSH_THEME='eastwood'

touch .hushlogin

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias v="nvim"
alias d="cd ~/Desktop/code"
alias c="clear"
alias x="exit"
alias p="cat"
alias P="bat"
alias o="g++ -o" 

alias ga="git add"
alias gc="git commit -m"
alias gcs="git commit -m 'standard commit statement'"
alias gb="git branch"
alias gk="git checkout"
alias gs="git status"
alias gp="git push"


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

