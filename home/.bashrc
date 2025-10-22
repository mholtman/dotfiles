#!/bin/bash
export BASH_CONF="bashrc"

source "${HOME}/.common-bash-funcs"
source "$(brew --prefix)/opt/homeshick/homeshick.sh"

append_to_path "${HOME}/bin"
append_to_path "${HOME}/.rvm/bin"

export NVM_DIR="${HOME}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

prepend_to_path '/opt/local/bin:/opt/local/sbin'

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias git_prune_local="git fetch -p ; git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d"
alias most_changed="git log --format=format: --name-only | egrep -v '^$' | sort | uniq -c | sort -r | head -20"

PS1='\[\033[01;33m\]\w\n\[\033[00m\]\$ '

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
[[ -s "${HOME}/beam-bashrc" ]] && source "${HOME}/beam-bashrc"

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
	source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

if [ -f "${HOME}/.git-completion.bash" ]; then
  . "${HOME}/.git-completion.bash"
fi

#enable shell history in ELixir iex
export ERL_AFLAGS="-kernel shell_history enabled"

prepend_to_path '/usr/local/sbin'
prepend_to_path '/usr/local/bin'

export IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')

prepend_to_path "$HOME/bin"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"

. /usr/local/opt/asdf/asdf.sh
. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

