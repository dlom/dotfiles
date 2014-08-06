#!/usr/bin/env zsh

function dotfiles() {
	rsync --exclude ".git/" --exclude "bootstrap.sh" --exclude "README.md" --exclude "LICENSE" --no-perms --archive --verbose --human-readable "$@" ./ $HOME/
}

echo "--> Getting the hottest dotfiles, right off the press"
git pull origin master

if [[ "$1" == "--force" || "$1" == "-f" ]]; then
	echo "--> You forced my hand, man"
	dotfiles
else
	echo "--> Here's what's gonna happen: "
	dotfiles --dry-run
	read "REPLY?--> You really wanna do this? "
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		dotfiles
		echo "--> Job's done"
		echo "--> do a \"source ~/.zshrc\"!"
	else
		echo "--> Nothing happened!"
	fi
fi
