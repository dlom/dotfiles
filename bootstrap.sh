#!/usr/bin/env zsh

function dotfiles() {
	git ls-files | rsync --files-from=- --exclude ".gitmodules" --exclude "bootstrap.sh" --exclude "README.md" --exclude "LICENSE" --no-perms --archive --verbose --checksum --human-readable --prune-empty-dirs "$@" ./ $HOME/
}

if [[ "$1" == "--yes" || "$1" == "-y" ]]; then
	echo "--> The computer is always smarter than the human..."
	git pull origin master
	dotfiles
else
	read "REPLY?--> Do you want the latest, greatest dotfiles? "
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		echo "--> Getting the hottest dotfiles, right off the press"
		git pull origin master
	fi
	echo "--> Okay, here's what's gonna happen: "
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
