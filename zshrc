typeset -U path
path=(~/bin $path)

# history setup --------------------------------------------------------
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=1000
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS # remove blank lines from history file
# if the command starts with a whitespace, don't add it to history
setopt HIST_IGNORE_SPACE
# append every single command to $HISTFILE immediately after hitting ENTER
setopt INC_APPEND_HISTORY
# shares the histories of multiple Z-Shells; commands from one active Zsh are
# then placed in the other shell's history
setopt SHARE_HISTORY
# ----------------------------------------------------------------------

setopt autocd      # change directory without typing cd
setopt correctall  # correct typos
setopt NO_BEEP

autoload -U compinit
compinit

# use arrow keys to navigate completion suggestions
setopt menucomplete
zstyle ':completion:*' menu select=1 _complete _ignored _approximate

# hotkeys setup --------------------------------------------------------
# to show hotkey symbol, press ctrl+V, than hotkey
bindkey -M isearch '^R' history-incremental-search-backward
bindkey -M isearch '^S' history-incremental-search-forward
bindkey "^[[3~" delete-char           # delete
case $TERM in
rxvt|rxvt-unicode|rxvt-256color|rxvt-unicode-256color)
    #bindkey "^[OF" end-of-line            # end
    #bindkey "^[OH" beginning-of-line      # home
    #bindkey "^[[1~" beginning-of-line
    #bindkey "^[[4~" end-of-line
    bindkey '^[Od' emacs-backward-word # ctrl + left arrow
    bindkey '^[Oc' emacs-forward-word  # ctrl + right arrow
    bindkey "^[[5~" history-beginning-search-backward # pg up
    bindkey "^[[6~" history-beginning-search-forward  # pg down
;;
*)
    #bindkey "^[OF" end-of-line            # end
    #bindkey "^[OH" beginning-of-line      # home
    #bindkey "^[[1~" beginning-of-line
    #bindkey "^[[4~" end-of-line
    bindkey '^[[1;5D' emacs-backward-word # ctrl + left arrow
    bindkey '^[[1;5C' emacs-forward-word  # ctrl + right arrow
    bindkey "^[[5~" history-beginning-search-backward # pg up
    bindkey "^[[6~" history-beginning-search-forward  # pg down
;;
esac
export WORDCHARS='_-' # symbols, that are a part of a word

# prompt setup ---------------------------------------------------------
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
    # right prompt with hostname or bad smiley
    RPROMPT=$'%(?,%{\e[34m%}ssh %n@%m%{\e[0m%},%{\e[31m%}:(%{\e[0m%})'
    if [[ $EUID == 0 ]]; then
        PROMPT=$'%{\e[1;31m%}%~ %{\e[0m%}' # root
    else
        PROMPT=$'%{\e[1;33m%}%~ %{\e[0m%}' # regular user
    fi
else # not SSH
    # right prompt with hostname or bad smiley
    RPROMPT=$'%(?,%{\e[34m%}%m%{\e[0m%},%{\e[1;31m%}:(%{\e[0m%})'
    if [[ $EUID == 0 ]]; then
        PROMPT=$'%{\e[1;31m%}%~ %{\e[0m%}' # root
    else
        PROMPT=$'%{\e[1;32m%}%~ %{\e[0m%}' # regular user
    fi
fi
# ----------------------------------------------------------------------

# window title setup ---------------------------------------------------
case $TERM in
termite|*xterm*|rxvt|rxvt-unicode|rxvt-256color|rxvt-unicode-256color|(dt|k|E)term)
    precmd ()
    {
        if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
            print -Pn "\e]0;%n@%m:%~\a"
        else
            if [[ $EUID == 0 ]]; then
                print -Pn "\e]0;# %~\a" # root
            else
                print -Pn "\e]0;%~\a"   # regular user
            fi
        fi
    }
    preexec ()
    {
        if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
            print -Pn "\e]0;%n@%m $1\a"
        else
            if [[ $EUID == 0 ]]; then
                print -Pn "\e]0;# $1\a" # root
            else
                print -Pn "\e]0;$1\a"   # regular user
            fi
        fi
    }
    ;;
esac
# ----------------------------------------------------------------------

# aliases --------------------------------------------------------------
alias ls='ls -F --color=auto'
alias ll='ls -l --color=auto -h'
alias la='ls -A --color=auto'
alias lla='ll -A --color=auto -h'
alias grep='grep --colour=auto'
hash colordiff 2>/dev/null && alias diff='colordiff'

# aliases for file extensions
alias -s txt=${EDITOR}
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
