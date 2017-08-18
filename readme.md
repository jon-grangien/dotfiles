# Dotfiles and personal config
Mainly arch based system

## Setup
Symlink everything  
root dotfiles in ~/    
Pretty much everything else in ~/.config/ on arch   

## Commands
Soft symlink:   
`ln -rs targetFile newTargetDir`

Global git config:  
`git config --global core.excludesfile '~/dotfiles/git/.gitignore'`

Xkb conf file:   
`sudo cp 00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf` (careful)

Or set xkb international us layout non-persistent:  
`setxkbmap -layout us -variant altgr-intl -option nodeadkeys &`
