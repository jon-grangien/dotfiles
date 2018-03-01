redshift -l 19:58 &
dropbox &
# setxkbmap -layout us -variant altgr-intl -option nodeadkeys
# xmodmap ~/.Xmodmap &
# xcape -e 'Control_L=Escape' &

export $(gnome-keyring-daemon -s)

# dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK
