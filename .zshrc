# oh-my-zsh config and init
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
plugins=(pass cp git git-remote-branch gitignore mina nvm z zsh_reload git-extras git-extra-commands git-flow alias-tips)
source $ZSH/oh-my-zsh.sh

# By default, zsh considers many characters part of a word (e.g., _ and -).
# Narrow that down to allow easier skipping through words via M-f and M-b.
export WORDCHARS='*?[]~&;!$%^<>'

source ~/.aliases
function f() {
  find . -name "$1"
}

bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

export PATH=/usr/local/sbin:$PATH
