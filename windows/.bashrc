env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    ssh-add
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add
fi

unset env

export EDITOR="nvim"

export SSH_KEY_PATH="~/.ssh/id_rsa"

export PROMPT_COMMAND='history -a;history -r'

export HISTSIZE=1000
export HISTFILESIZE=1000
HISTTIMEFORMAT="%d-%m-%y %T "
HISTCONTROL=ignoredups:ignorespace  
shopt -s histappend     # Append to the history instead of overwriting 

# append to and reload history file after each command
# PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# ripgrep
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
bind -x '"\C-p": vim $(fzf);'

# cd fzf bookmarks
unalias cdg 2> /dev/null
cdg() {
   local dest_dir=$(~/dotfiles/cdg/cdscuts_glob_echo.sh | fzf --height 40%)
   if [[ $dest_dir != '' ]]; then
      cd "$dest_dir"
   fi
}
export -f cdg > /dev/null

increment_topic() {
    BRANCH_NAME="$(git rev-parse --abbrev-ref HEAD)"
    MATCH_PATTERN='^Topics\/([0-9]+)'
    [[ "$BRANCH_NAME" =~ $MATCH_PATTERN ]]
    BRANCH_TOPIC=${BASH_REMATCH[1]}

    BRANCH_ITERATION=$(echo "$BRANCH_NAME" | grep -Eo '[0-9]+$')
    NEW_ITERATION=$((BRANCH_ITERATION+1))
    git checkout -b "Topics/$BRANCH_TOPIC/$NEW_ITERATION"
}

# aliases
alias n="nvim"
alias c="clear"
alias rm="rm -I"
alias l="ls -lXhA"
alias p="pwd"

alias gst="git status"
alias ggl="git pull origin \$(git rev-parse --abbrev-ref HEAD)"
alias ggp="git push origin \$(git rev-parse --abbrev-ref HEAD)"
alias gc="git commit"
alias gd="git diff"
alias gaa="git add --all"
alias glog="git log --oneline --decorate --color --graph"
alias glogf="git log --name-only --decorate --color"
# alias wtf="HISTTIMEFORMAT=\"%d/%m/%y %T \" && history"

