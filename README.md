## Nvim Dependencies
Install with brew, apt, etc  
Place **init.lua** to **~/.config**  
1. Neovim 
2. Ripgrep
3. Fzf  

## Terminal installs (Mac)  
Place **.zshrc** to **~/**  
Change shell to zsh ```chsh -s $(which zsh)```
1. ZSH  
2. oh-my-zsh  
3. Alacritty  

## Other Good Installs
1. bat (homebrew, alternative to cat w. syntax highlighting)
2. jqp (good JSON reader)
3. tmux (multiple terminals)
4. git (its git)


## Sometimes the OS doesn't support new neovim
**this gets bare minimum nvim up and running**
*using curl to install neovim*  
```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
```
**run with**
```./nvim.appimage```
