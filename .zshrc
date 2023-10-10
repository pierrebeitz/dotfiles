# oh-my-zsh config and init
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
# DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
plugins=(cp fasd git git-extras git-auto-fetch npm yarn z zsh-autosuggestions zsh-syntax-highlighting)
# git-extras

# custom completions
fpath=(~/.zsh/completions $fpath)

source $ZSH/oh-my-zsh.sh

# By default, zsh considers many characters part of a word (e.g., _ and -).
# Narrow that down to allow easier skipping through words via M-f and M-b.
export WORDCHARS='*?[]~&;!$%^<>'

source ~/.aliases
source ~/.secret_stuff

bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

export VISUAL=nvim
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
  docker image ls | fzf -m | tr -s " " | cut -f 3 -d' ' | xargs -n1 docker image rm -f
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

# GIT heart FZF
# -------------

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1 || echo "This_is_not_a_git_repository"
}

fzf-down() {
  fzf --height 50% "$@" --border
}

FZF_PREFIX="fzf-git"

function "${FZF_PREFIX}gf" () {
  is_in_git_repo || return
  git -c color.status=always status --short |
  fzf-down -m --ansi --nth 2..,.. \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' |
  cut -c4- | sed 's/.* -> //'
}

function "${FZF_PREFIX}gb" () {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
  fzf-down --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) -- | head -'$LINES |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/##'
}

# git tag
function "${FZF_PREFIX}gt" () {
  is_in_git_repo || return
  git tag --sort -version:refname |
  fzf-down --multi --preview-window right:70% \
    --preview 'git show --color=always {} | head -'$LINES
}

function "${FZF_PREFIX}gh" () {
  is_in_git_repo || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | head -1 | xargs git show --color=always | head -' |
  grep -o "[a-f0-9]\{7,\}" | head -1
}

function "${FZF_PREFIX}gr" () {
  is_in_git_repo || return
  git remote -v | awk '{print $1 "\t" $2}' | uniq |
  fzf-down --tac \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" --remotes={1} | head -200' |
  cut -d$'\t' -f1
}


join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

bind-git-helper() {
  local char
  for c in $@; do
    eval "fzf-g$c-widget() { local result=\$(${FZF_PREFIX}g$c | join-lines); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf-g$c-widget"
    eval "bindkey '^g^$c' fzf-g$c-widget"
  done
}
bind-git-helper f b t r h


. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

export HUSKY_SKIP_HOOKS=1

export PATH="$PATH:$HOME/.cargo/bin:$HOME/.platformio/penv/bin"
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"


function b() {
  git checkout `git branch | fzf -f $1 | head -n1`
}
# export MV3=1

# bun completions
[ -s "/Users/pierre/.bun/_bun" ] && source "/Users/pierre/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

alias gcm='[[ $(git branch | grep main) ]] && git checkout main || git checkout master'

alias prByAuthor="gh pr list -L 100 --json author,title --jq '. | group_by(.author.login) | map(.[0] + {\"count\": length}) | sort_by(.count) | reverse | .[] | \"\(.count) \(.author.login)\"'"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/pierre/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/pierre/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/pierre/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/pierre/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

