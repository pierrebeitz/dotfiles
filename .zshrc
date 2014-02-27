# oh-my-zsh config and init
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true" # Uncomment following line if you want red dots to be displayed while waiting for completion
plugins=(cp git git-flow gitignore git-remote-branch nvm z)
. $ZSH/oh-my-zsh.sh

for file in ~/.{exports,extra,bash_prompt,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file

# init zsh-completions
fpath=(~/code/zsh-completions/src $fpath)
# init rvm
[[ -a ~/.rvm/scripts/rvm ]] && . ~/.rvm/scripts/rvm
