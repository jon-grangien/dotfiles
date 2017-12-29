#!/usr/bin/sh

cd ~
xmodmap ~/.Xmodmap
xcape -e 'Control_L=Escape' &
alias setus="setxkbmap -layout us -variant altgr-intl -option nodeadkeys"

