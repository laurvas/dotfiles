# If not running interactively, don't do anything!
[[ $- != *i* ]] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

# history setup --------------------------------------------------------
# prevent commands that start with a space from going into history and
# ignore duplicate commands
HISTCONTROL=ignoreboth

HISTFILESIZE=1000
HISTSIZE=1000
# Enable history appending instead of overwriting.
shopt -s histappend
# useful when running multiple terminals
PROMPT_COMMAND=`history -a`

#do not add this commands into history
HISTIGNORE='ls:bg:fg:history'
# ----------------------------------------------------------------------

# change directory without typing cd
shopt -s autocd

# prompt setup ---------------------------------------------------------
PS1="$(if [[ ${EUID} == 0 ]]
then echo '\[\033[01;31m\]\w'
else echo '\[\033[01;32m\]\w'
fi)\$([[ \$? != 0 ]] && echo \" \[\033[01;31m\]:(\")\[\033[00m\] "
# ----------------------------------------------------------------------

# window title setup ---------------------------------------------------
case ${TERM} in
    xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
        PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
        ;;
    screen)
        PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
        ;;
esac
# ----------------------------------------------------------------------

# aliases --------------------------------------------------------------
alias ls='ls -F --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias lla='ll -A'
alias grep='grep --colour=auto'
which colordiff >/dev/null && alias diff='colordiff'
# ----------------------------------------------------------------------

# some nice functions --------------------------------------------------
# cd and ls in one shot
cdls() {
    local dir=$1
    test -z "${dir}" && dir="${HOME}"
    cd "${dir}" && ls
}

cdll() {
    local dir=$1
    test -z "${dir}" && dir="${HOME}"
    cd "${dir}" && ll
}

# classic archive extractor
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2) tar xvjf $1   ;;
            *.tar.gz)  tar xvzf $1   ;;
            *.bz2)     bunzip2 $1    ;;
            *.rar)     unrar x $1    ;;
            *.gz)      gunzip $1     ;;
            *.tar)     tar xvf $1    ;;
            *.tbz2)    tar xvjf $1   ;;
            *.tgz)     tar xvzf $1   ;;
            *.zip)     unzip $1      ;;
            *.Z)       uncompress $1 ;;
            *.7z)      7z x $1       ;;
            *)         echo "'$1' cannot be extracted via $0" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
# ----------------------------------------------------------------------

# color man pages
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
}
