# up to you (me) if you want to run this as a file or copy paste at your leisure

# https://github.com/jamiew/git-friendly
# the `push` command which copies the github compare URL to my clipboard is heaven
bash < <( curl https://raw.github.com/jamiew/git-friendly/master/install.sh)

# https://rvm.io
curl -L https://get.rvm.io | bash -s stable --ruby

# https://github.com/creationix/nvm
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# https://github.com/robbyrussell/oh-my-zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
chsh -s /bin/zsh

# https://github.com/rupa/z
# z, oh how i love you
cd ~/code
git clone https://github.com/rupa/z.git
chmod +x ~/code/z/z.sh
# zsh-completions
git clone git://github.com/zsh-users/zsh-completions.git


# also consider moving over your current .z file if possible. it's painful to rebuild :)
