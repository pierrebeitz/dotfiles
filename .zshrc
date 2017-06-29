# oh-my-zsh config and init
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
plugins=(pass gulp mix-fast mix cp git-remote-branch gitignore mina nvm z zsh_reload git git-flow alias-tips docker docker-compose fasd)
# git-extras

# custom completions
fpath=(~/.zsh/completions $fpath)

source $ZSH/oh-my-zsh.sh

# By default, zsh considers many characters part of a word (e.g., _ and -).
# Narrow that down to allow easier skipping through words via M-f and M-b.
export WORDCHARS='*?[]~&;!$%^<>'

source ~/.aliases_and_stuff
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


