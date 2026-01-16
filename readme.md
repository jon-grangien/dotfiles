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

## nvim dependencies
- Patched nerd font set in terminal https://www.nerdfonts.com
- `npm i -g vim-language-server`
- `npm i -g @tailwindcss/language-server`
- `npm i -g tree-sitter-cli`
- `npm i -g vscode-langservers-extracted`
- `npm i -g @vue/typescript-plugin`
- `npm i -g volar`
- `npm i -g @volar/vue-language-server`
- `npm i -g typescript typescript-language-server`
- `brew install lua-language-server`
- `brew install stylua`

## Some commands on linux
Soft symlink linux:   
`ln -rs targetFile newTargetDir`

Xkb conf file:   
`sudo cp 00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf` (careful)

Or set xkb international us layout non-persistent:  
`setxkbmap -layout us -variant altgr-intl -option nodeadkeys &`
