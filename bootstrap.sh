git pull origin master
rsync --exclude ".git/" --exclude "bootstrap.sh" --exclude "README.md" --exclude "install-deps.sh" -av --no-perms . $HOME