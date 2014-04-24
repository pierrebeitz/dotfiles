#!/bin/bash
# up to you (me) if you want to run this as a file or copy paste at your leisure


# https://rvm.io
curl -L https://get.rvm.io | bash -s stable --ruby

# https://github.com/creationix/nvm
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# https://github.com/robbyrussell/oh-my-zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
chsh -s /bin/zsh

cd ~/code
# zsh-completions
git clone git://github.com/zsh-users/zsh-completions.git
