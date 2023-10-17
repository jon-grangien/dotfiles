# scripts

## cd shortcuts with fzf
Requires fzf: https://github.com/junegunn/fzf  
From [https://dmitryfrank.com/articles/shell_shortcuts](https://dmitryfrank.com/articles/shell_shortcuts)  

Softlink `cdscuts_glob_echo` and `cdscuts_list_echo` into `/usr/local/bin`  
```bash
# if write privileges not kept:
sudo chmod a+x /usr/bin/cdscuts_glob_echo
sudo chmod a+x /usr/bin/cdscuts_list_echo

# then
cd /usr/local/bin
sudo ln -s /Users/jonathangrangien/dotfiles/unix_scripts/cdscuts_glob_echo cdscuts_glob_echo
sudo ln -s /Users/jonathangrangien/dotfiles/unix_scripts/cdscuts_list_echo cdscuts_list_echo
```

Then create the shortcut file `~/.cdg_paths` and will it with bookmarks e.g.  
```bash
/Users/jonathangrangien/code
/Users/jonathangrangien/dotfiles
```

Then make sure .zshrc has a function to use it:
```bash
# .zshrc
unalias cdg 2> /dev/null
cdg() {
   local dest_dir=$(cdscuts_glob_echo | fzf )
   if [[ $dest_dir != '' ]]; then
      cd "$dest_dir"
   fi
}
export -f cdg > /dev/null
```

