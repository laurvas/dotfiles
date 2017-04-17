if [[ -n "$SSH_CLIENT" || -n "$SSH2_CLIENT" ]]; then
    if [[ $EUID == 0 ]]; then
        PROMPT=$'%F{red}%B%~ %b%f' # root
    else
        PROMPT=$'%F{yellow}%B%~ %b%f' # regular user
    fi
    # right prompt with hostname or bad smiley
    RPROMPT=$'%(?,%F{blue}ssh %n@%m%f,%F{red}%B:(%b%f)'

else # not SSH
    if [[ $EUID == 0 ]]; then
        PROMPT=$'%F{red}%B%~ %b%f' # root
    else
        PROMPT=$'%F{green}%B%~ %b%f' # regular user
    fi
    # right prompt with hostname or bad smiley
    RPROMPT=$'%(?,%F{blue}%m%f,%F{red}%B:(%b%f)'
fi
