## Nvim Dependencies
1. Neovim 
2. Ripgrep
3. Fzf  

*install with brew, apt, etc*  

Place **init.lua** to **~/.config**

## Terminal installs (Mac)  
1. ZSH  
2. oh-my-zsh  
3. Alacritty  

Place **.zshrc** to **~/** or equivalent.

```
brew install --no-quarantine alacritty zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"  
chsh -s $(which zsh)
```


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
