#!/usr/bin/zsh

ERROR_PROMPT=""
ERROR_PROMPT+="%(?"
ERROR_PROMPT+="."
ERROR_PROMPT+=""
ERROR_PROMPT+="."
ERROR_PROMPT+="%K{red}%F{black}%B"
ERROR_PROMPT+="%?"
ERROR_PROMPT+="%b%f%k"
ERROR_PROMPT+=$'\n'")"

#SSH
SSH_PROMPT=""
USING_SSH=false
if [ -n "${SSH_CLIENT}" ] || [ -n "${SSH_TTY}" ]; then
    SSH_PROMPT="%K{magenta}%F{black} SSH %k%f"
    USING_SSH=true
fi

#GIT
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' formats "%K{yellow}%F{black} %b %k%f"
zstyle ':vcs_info:*' actionformats "%K{yellow}%F{black} %b (%a) %k%f"
#zstyle ':vcs_info:*' check-for-changes true

#User
if [[ -o login ]]; then
    LOGIN_NAME=$USER
    LOGIN_HOST=$HOST
fi

#Dir prompt
DIR_PROMPT="%K{blue}%F{black} %~ %f%k "

PS2="$_>"
PS3="?# "
PS4="+ "

RPS1=""
RPS2=""
RPS3=""
RPS4=""

precmd() {
    #USERNAME
    USER_PROMPT=""
    if $USING_SSH || [ "${HOST}" != "${LOGIN_HOST}" ]; then
        USER_PROMPT="%n@%M"
    fi
    if [ "${USER}" != "${LOGIN_NAME}" ] && [ -n "${USER_PROMPT}" ]; then
        USER_PROMPT="%n"
    fi
    if [ -n "${USER_PROMPT}" ]; then
        USER_PROMPT="%K{cyan}%F{black} ${USER_PROMPT} %f%k"
    fi

    #GIT
    vcs_info

    PS1="${ERROR_PROMPT}${SSH_PROMPT}${vcs_info_msg_0_}${USER_PROMPT}${DIR_PROMPT}"
}




