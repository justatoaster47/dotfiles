## Dependencies
1. Neovim 
2. Git
4. Ripgrep
6. Fzf

**Example Installation**  
*brew install neovim git ripgrep fzf*  

## Directory Locations
Place **nvim** to **~/.config** or equivalent.
Place **.zshrc** to **~/** or equivalent.
Also create / update location of **undodir** directory for undotree save history. 

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
3. tmux (multiple terminals)
