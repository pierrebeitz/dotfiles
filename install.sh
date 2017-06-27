#!/bin/sh

if [[ "$OSTYPE" == "linux-gnu" ]]; then

  # let's see when i put down that new mac...

elif [[ "$OSTYPE" == "darwin"* ]]; then

	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew tap Homebrew/bundle
	brew bundle

	defaults write -g InitialKeyRepeat -int 10 		        # normal minimum is 15 (225 ms)
	defaults write -g KeyRepeat -int 1 			              # normal minimum is 2 (30 ms)
	defaults write com.apple.finder AppleShowAllFiles YES	# display hidden files in Finder

else

  # Unknown.

fi

# set zsh as a default shell for the current user
sudo chsh -s $(which zsh) $USER

# Vim Plugin-Manager
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# fzf
/usr/local/opt/fzf/install
