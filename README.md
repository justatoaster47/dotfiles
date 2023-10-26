## Dependencies
1. Neovim 
2. Git
3. Tmux
4. Ripgrep
5. Fzf
6. MdPdf

**Example Installation**  
*brew install neovim git tmux ripgrep fzf*  
*pip install mdpdf*  


## Directory Locations
Place **nvim** and **tmux** directories your **~/.config** or equivalent.  
Also create / update **undodir** directory for undotree save history.  
```lua
vim.o.undodir = os.getenv("HOME") .. "/Desktop/code/undodir" --set where you want undodir
```
