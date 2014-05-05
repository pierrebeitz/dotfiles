#!/bin/bash
set -e
files=(
  ".ackrc"
  ".aliases"
  ".bash_profile"
  ".bashrc"
  ".exports"
  ".functions"
  ".gemrc"
  ".gitconfig"
  ".githelpers"
  ".gitignore"
  ".zshrc"
)

function exists_in_home_dir() {
  [ -f ~/$1 ]
}

function linked_correctly() {
  [[ `readlink ~/$1` == "$PWD/$1" ]]
}

function ask() {
  read -p "$1 (y/n) "
  [ "$REPLY" == y ]
}

function link() {
  ln -s $PWD/$1 ~/$1
  echo "linked $1"
}

function main(){
  for f in "${files[@]}"; do
    if exists_in_home_dir $f; then
      if ! linked_correctly $f; then
        if ask "overwrite ~/$f?"; then
          rm ~/$1
          link $f
        fi
      fi
    else
      link $f
    fi
  done

  if ask "install rvm?"; then
    curl -L https://get.rvm.io | bash -s stable --ruby
  fi
  if ask "install n via npm?"; then
    npm install -g n
  fi
  if ask "install oh-my-zsh?"; then
    curl -L http://install.ohmyz.sh | sh
  fi

}
main
