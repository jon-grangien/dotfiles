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
- `npm install -g vim-language-server`
- `npm install -g @tailwindcss/language-server`
- `brew install lua-language-server`
- `npm i -g vscode-langservers-extracted`
- `npm i -g @vue/typescript-plugin`
- `npm i -g volar`
- `npm install -g typescript typescript-language-server`
- `npm install -g tree-sitter-cli`
- `brew install stylua`

## Some commands on linux
Soft symlink linux:   
`ln -rs targetFile newTargetDir`

Xkb conf file:   
`sudo cp 00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf` (careful)

Or set xkb international us layout non-persistent:  
`setxkbmap -layout us -variant altgr-intl -option nodeadkeys &`
