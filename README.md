## Dependencies
1. Neovim 
2. Git
3. Tmux
4. Ripgrep
6. Fzf

**Example Installation**
*brew install neovim git tmux ripgrep fzf*  

## Directory Locations
Place **nvim**, **tmux** directories your **~/.config** or equivalent.
However, the zsh config file needs to be in **~** not **~/.config**
Also create / update **undodir** directory for undotree save history.  
```lua
vim.o.undodir = os.getenv("HOME") .. "/Documents/code/undodir" --set where you want undodir
```

## Terminal preferences
**ZSH,oh-my-zsh, Alacritty**  
*brew install --no-quarantine alacritty zsh*  
*sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
*chsh -s $(which zsh)* 

## Other Good Installs
1. bat (homebrew, alternative to cat w. syntax highlighting)
2. jqp (good JSON reader)
