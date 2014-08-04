# generic stuff
autoload -U compinit && compinit
autoload -U colors && colors
autoload -U run-help && unalias run-help

# aliases, aur helpers, git helpers, and keybindings
source $HOME/.zsh/aliases.zsh
source $HOME/.zsh/aur.zsh
source $HOME/.zsh/git.zsh
source $HOME/.zsh/keybindings.zsh

# env variables for interactive sessions
HISTSIZE=1000
SAVEHIST=$HISTSIZE
HISTFILE=$HOME/.zsh_history
EDITOR=nano
PAGER=less
