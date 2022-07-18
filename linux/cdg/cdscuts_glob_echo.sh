#!/bin/bash

system_wide_filelist=''
user_filelist=''

if [ -r /etc/cdg_paths ]; then
system_wide_filelist=$(~/dotfiles/cdg/cdscuts_list_echo.sh /etc/cdg_paths)
fi
if [ -r ~/.cdg_paths ]; then
user_filelist=$(~/dotfiles/cdg/cdscuts_list_echo.sh ~/.cdg_paths)
fi

echo -e "$system_wide_filelist\n$user_filelist" | sed '/^\s*$/d'

