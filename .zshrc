# oh-my-zsh config and init
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"

plugins=(capistrano cp git git-extras git-flow git-remote-branch gitignore nvm z)

. $ZSH/oh-my-zsh.sh

for file in ~/.{exports,extra,bash_prompt,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done

unset file

# init zsh-completions
fpath=(~/code/zsh-completions/src $fpath)

[[ -a ~/.rvm/scripts/rvm ]] && . ~/.rvm/scripts/rvm
[[ -a ~/.nvm/nvm.sh ]] && . ~/.nvm/nvm.sh
