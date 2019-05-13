# setup
autoload -U compinit && compinit
autoload -U colors && colors
autoload -U run-help && unalias run-help
setopt PROMPT_SUBST # very important for prompt
setopt interactivecomments
zstyle ":completion:*" rehash true

# env variables for interactive sessions
HISTSIZE=1000000
SAVEHIST=$HISTSIZE
HISTFILE=$HOME/.zsh_history
export EDITOR="nvim"
PAGER="less -N"
export CC=clang
BROWSER=firefox-nightly
MARKDOWN=cmark-gfm
GOPATH=$HOME/go
PATH="$(ruby -e 'print Gem.user_dir')/bin:$(yarn global bin --offline):$(go env GOPATH)/bin:$PATH"
GEM_HOME="$(ruby -e 'print Gem.user_dir')"

# aliases, aur helpers, git helpers, and keybindings
source $HOME/.zsh/aliases.zsh
source $HOME/.zsh/aur.zsh
source $HOME/.zsh/functions.zsh
source $HOME/.zsh/git.zsh
source $HOME/.zsh/keybindings.zsh

# ssh-agent and gpg-agent
eval $(keychain --eval --quiet --agents ssh,gpg id_rsa_work id_rsa_personal dlom234@gmail.com)

function prompt_char() {
	[[ $(whoami) == "root" ]] && echo "#" && return
	git branch >/dev/null 2>/dev/null && echo "±" && return
	hg root >/dev/null 2>/dev/null && echo "☿" && return
	svn info >/dev/null 2>/dev/null && echo "⑆" && return
	echo "$"
}

# prompt
ZSH_THEME_GIT_PROMPT_PREFIX="on %{$fg_bold[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[blue]%}]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" [%{$fg_no_bold[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" [%{$fg_no_bold[green]%}✓"
# must be single quotes for prompt expansion
PROMPT='%{$fg_bold[red]%}%n%{$reset_color%} at %{$fg_bold[yellow]%}%m%{$reset_color%} in %{$fg_bold[green]%}%~%{$reset_color%} $(git_prompt_info)%{$fg_bold[white]%}$(prompt_char)%{$reset_color%} '

# set terminal title
title "Terminal"
