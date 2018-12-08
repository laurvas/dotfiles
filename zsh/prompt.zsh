setopt prompt_subst

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*:*' check-for-changes true # can be slow on big repos
zstyle ':vcs_info:*:*' unstagedstr '%F{red}'
zstyle ':vcs_info:*:*' actionformats "[%F{green}%u%b%f %a]"
zstyle ':vcs_info:*:*' formats       "[%F{green}%u%b%f]"

if [[ -n "$SSH_CLIENT" || -n "$SSH2_CLIENT" ]]; then
    if [[ $EUID == 0 ]]; then
        PROMPT=$'%F{red}%B%~ %b%f' # root
    else
        PROMPT=$'%F{yellow}%B%~ %b%f' # regular user
    fi
    # right prompt with hostname or bad smiley
    RPROMPT=$'%(?,${vcs_info_msg_0_} %F{blue}ssh %n@%m%f,%F{red}%B:(%b%f)'

else # not SSH
    if [[ $EUID == 0 ]]; then
        PROMPT=$'%F{red}%B%~ %b%f' # root
    else
        PROMPT=$'%F{green}%B%~ %b%f' # regular user
    fi
    # right prompt with hostname or bad smiley
    RPROMPT=$'%(?,${vcs_info_msg_0_} %F{blue}%m%f,%F{red}%B:(%b%f)'
fi
