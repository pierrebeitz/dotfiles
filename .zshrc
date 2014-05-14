# oh-my-zsh config and init
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
plugins=(capistrano cp git git-extras git-flow git-remote-branch gitignore nvm symfony2 z zsh_reload)
. $ZSH/oh-my-zsh.sh

# change prompt: add machine's name, remove repo-information, since we get it from the git-prompt-plugin
PROMPT='%{$fg_bold[white]%}%M ${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

# By default, zsh considers many characters part of a word (e.g., _ and -).
# Narrow that down to allow easier skipping through words via M-f and M-b.
export WORDCHARS='*?[]~&;!$%^<>'

# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{exports,extra,bash_prompt,aliases,functions}; do
  [ -r "$file" ] && source "$file"
done
unset file

[[ -a ~/.rvm/scripts/rvm ]] && . ~/.rvm/scripts/rvm
