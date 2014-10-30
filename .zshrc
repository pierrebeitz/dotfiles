# oh-my-zsh config and init
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
plugins=(cp git git-extras git-flow git-remote-branch gitignore nvm z zsh_reload)
source $ZSH/oh-my-zsh.sh

unsetopt RM_STAR_SILENT
setopt RM_STAR_WAIT

# By default, zsh considers many characters part of a word (e.g., _ and -).
# Narrow that down to allow easier skipping through words via M-f and M-b.
export WORDCHARS='*?[]~&;!$%^<>'

source ~/.aliases
function f() {
  find . -name "$1"
}

export PATH=/usr/local/sbin:$PATH
