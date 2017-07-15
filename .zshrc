# oh-my-zsh config and init
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
plugins=(alias-tips cp docker docker-compose fasd git git-extras git-flow mina mix mix-fast pass yarn z)
# git-extras

# custom completions
fpath=(~/.zsh/completions $fpath)

source $ZSH/oh-my-zsh.sh

# By default, zsh considers many characters part of a word (e.g., _ and -).
# Narrow that down to allow easier skipping through words via M-f and M-b.
export WORDCHARS='*?[]~&;!$%^<>'

source ~/.aliases
source ~/.secret_stuff
function f() {
  find . -name "$1"
}

bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

export VISUAL=vim
export EDITOR="$VISUAL"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="~/.sdkman"
[[ -s "~/.sdkman/bin/sdkman-init.sh" ]] && source "~/.sdkman/bin/sdkman-init.sh"


stty -ixon # disable flow control for vim ctrl+s

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# tmux standy-fix
echo $DISPLAY > ~/.display.txt
alias up_disp='export DISPLAY=`cat ~/.display.txt`'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"


#
# fzf
#
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"


# cut the `$1`st element
function c() {
  local i="${1:-1}"
  tr -s " " | cut -f$i -d' '
}

# select a git-rev. e.g. git rebase -i `rev`
function rev() {
  git log --oneline "$@" |
  fzf | c 1
}

# select a docker-container
function dps() {
  docker ps "$@" |
  fzf | c 1
}

function drmi() {
  docker rmi $(docker images | fzf |  c 3)
}
function drm() {
  docker rm $(docker ps -a | fzf | c 1)
}

# fb - checkout git branch
function gfco() {
  git checkout $(git branch --all | grep -v HEAD | fzf | c 2 | sed 's/remotes\/origin\///')
}

# git commit browser (fzf log)
unalias glog
function glog() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --toggle-sort=\` \
      --preview "echo {} | grep -o '[a-f0-9]\{7\}' | head -1 |
                 xargs -I % sh -c 'git show --color=always % | head -$LINES'" \
      --bind 'ctrl-m:execute:
                echo {} | grep -o "[a-f0-9]\{7\}" |
                xargs -I % sh -c "git show --color=always % | less -R"'
}

unalias gl
function gl() {
  glog --all "$@"
}
