#!/bin/bash

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

append_to_path "${HOME}/bin"
append_to_path "${HOME}/.rvm/bin"

export NVM_DIR="/Users/mholtman/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "/Users/mholtman/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/mholtman/.sdkman/bin/sdkman-init.sh"

alias mount-cas="sshfs mine-all-mine:/home/myh29/git-repos /Volumes/CAS/myh29 -o defer_permissions -o volname=CasMyh29"
alias unmount-cas="umount /Volumes/CAS/myh29"
