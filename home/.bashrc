#!/bin/bash
export BASH_CONF="bashrc"

path_includes() {
	local -r DIR=$1
	echo "${PATH}" | grep -Eq "(^|:)${DIR}(:|$)"
}

append_to_path() {
	local -r DIR=$1
	path_includes "${DIR}" || export PATH=${PATH}:${DIR}
}

prepend_to_path() {
	local -r DIR=$1
	path_includes "${DIR}" || export PATH=${DIR}:${PATH}
}

path_remove ()  {
  export PATH=`echo -n $PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' | sed 's/:$//'`;
}

source "${HOME}/.homesick/repos/homeshick/homeshick.sh"

export ANDROID_HOME=${HOME}/Library/Android/sdk

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

# git to hub alias
alias git=hub


PS1='\[\033[01;33m\]\w\n\[\033[00m\]\$ '

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
	source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

git config --global alias.pushf "push --force-with-lease"

#enable shell history in ELixir iex
export ERL_AFLAGS="-kernel shell_history enabled"

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "${HOME}/.gvm/bin/gvm-init.sh" ]] && source "${HOME}/.gvm/bin/gvm-init.sh"


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
prepend_to_path '/usr/local/sbin'
prepend_to_path '/usr/local/bin'

export IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')

prepend_to_path "$HOME/bin"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash
