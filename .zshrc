# oh-my-zsh config and init
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true" # Uncomment following line if you want red dots to be displayed while waiting for completion
plugins=(git git-flow symfony2)
. $ZSH/oh-my-zsh.sh

# init zsh-completions
fpath=(~/code/zsh-completions/src $fpath)
# init rvm
. ~/.rvm/scripts/rvm
# init nvm
. ~/.nvm/nvm.sh
# init z
. ~/code/z/z.sh

for file in ~/.{exports,extra,bash_prompt,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file
