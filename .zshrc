# includes
autoload -U compinit && compinit
autoload -U colors && colors
autoload -U zkbd
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# gnome-terminal tries to be xterm and it breaks things
[[ $COLORTERM == "gnome-terminal" ]] && export TERM=rxvt-unicode

# keybindings
[[ ! -e ~/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE} ]] && zkbd
source ~/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE}

[[ -n "${key[Home]}" ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n "${key[End]}" ]] && bindkey "${key[End]}" end-of-line
[[ -n "${key[Insert]}" ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n "${key[Delete]}" ]] && bindkey "${key[Delete]}" delete-char
[[ -n "${key[Up]}" ]] && bindkey "${key[Up]}" up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" down-line-or-beginning-search
[[ -n "${key[Left]}" ]] && bindkey "${key[Left]}" backward-char
[[ -n "${key[Right]}" ]] && bindkey "${key[Right]}" forward-char
[[ -n "${key[PageUp]}" ]] && bindkey "${key[PageUp]}" beginning-of-buffer-or-history
[[ -n "${key[PageDwn]}" ]] && bindkey "${key[PageDwn]}" end-of-buffer-or-history

# env variables
HISTSIZE=1000
HISTFILE=$HOME/.zhistory
SAVEHIST=$HISTSIZE
EDITOR=nano

# aliases
alias poweroff="systemctl poweroff"
alias reboot="systemctl reboot"
alias halt="systemctl halt"
alias suspend="systemctl suspend"
alias hibernate="systemctl hibernate"

# aur helpers
function auri() {
	pushd -q `mktemp -d`
	bash <(curl aur.sh --silent) --syncdeps --install "$@"
	popd -q
}

function auru() {
	pushd -q `mktemp -d`
	pacman --query --quiet --foreign | xargs bash <(curl aur.sh --silent) --syncdeps --install --needed
	popd -q
}
