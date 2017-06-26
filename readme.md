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
