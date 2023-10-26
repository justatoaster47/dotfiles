# Dependencies
1. Neovim 
2. Git
3. Tmux
4. Ripgrep
5. Fzf

*Example Installation using Homebrew*  
**brew install neovim git tmux ripgrep fzf**

# Directory Locations
Place **nvim** and **tmux** directories your **~/.config** or equivalent.  
Also create / update **undodir** directory for undotree save history.  
Make sure to update location in init.lua (found in preferences section).
```lua
vim.o.undodir = os.getenv("HOME") .. "/Desktop/code/undodir" --set where you want undodir
```
