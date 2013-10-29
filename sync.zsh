#!/bin/zsh
cd "$(dirname "$0")"
git pull
function doIt() {
	rsync --exclude ".git/" --exclude "sync.sh" --exclude "README.md" --exclude "install-deps.sh" -av . ~
}
if [[ "$1" = "--force" || "$1" = "-f" ]]; then
	doIt
else
    echo -n "This may overwrite existing files in your home directory. Are you sure? (y/n) "
	read -q REPLY
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt
source ~/.zshrc