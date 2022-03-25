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
export CC=clang
export BROWSER=firefox-nightly
export MARKDOWN=cmark-gfm
export GEM_HOME="$(ruby -e 'print Gem.user_dir')"
export CARGO_HOME="$HOME/.cargo"
export PATH="$GEM_HOME/bin:$(yarn global bin --offline):$(go env GOPATH)/bin:$CARGO_HOME/bin:$PATH"
export GOPRIVATE="github.com/Kochava,git.dev.kochava.com"

export GITHUB_TOKEN=''
export GITHUB_USERNAME='dlom'

# aliases, aur helpers, git helpers, and keybindings
source $HOME/.zsh/aliases.zsh
source $HOME/.zsh/aur.zsh
source $HOME/.zsh/functions.zsh
source $HOME/.zsh/git.zsh
source $HOME/.zsh/keybindings.zsh

# ssh-agent and gpg-agent
eval $(keychain --eval --quiet --agents ssh,gpg id_rsa_personal id_rsa_alt id_rsa_work dlom234@gmail.com)

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/mark/google-cloud-sdk/path.zsh.inc' ]; then . '/home/mark/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/mark/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/mark/google-cloud-sdk/completion.zsh.inc'; fi
