# aliases
alias reload="source ~/.zshrc"

alias poweroff="systemctl poweroff"
alias reboot="systemctl reboot"
alias halt="systemctl halt"
alias suspend="systemctl suspend"
alias hibernate="systemctl hibernate"

alias run-help="run-help" # fixes zsh complaints
alias help="run-help"

alias sudo="sudo "

alias mkdir="mkdir -p"
alias q="exit"
alias :q="exit"
alias c="clear"

alias xclip="xclip -sel clip"
alias copy="xclip"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias ls="ls --color=auto"
alias la="ls -lah"
alias ll="ls -lh"

alias grep="grep --color=auto"

alias vim="vim -p"
alias less="less -N"

alias edit="$EDITOR"
alias pager="$PAGER"
# alias browser="$BROWSER" (see functions.zsh)
