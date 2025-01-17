# Dotfiles and personal config
A lot of legacy

## Setup if unix
Symlink everything to ~/ or ~/.config/  

```bash
cd dotfiles
ln -s $(pwd)/program/.example_dotfile ~/.config/program/.example_dotfile
```

Global git config:  
`git config --global core.excludesfile '~/dotfiles/git/.gitignore'`

## nvim plugin dependencies
...

## Some commands on linux
Soft symlink linux:   
`ln -rs targetFile newTargetDir`

Xkb conf file:   
`sudo cp 00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf` (careful)

Or set xkb international us layout non-persistent:  
`setxkbmap -layout us -variant altgr-intl -option nodeadkeys &`
