if [[ -n "$SSH_CLIENT" || -n "$SSH2_CLIENT" ]]; then
    if [[ $EUID == 0 ]]; then
        PROMPT=$'%{\e[1;31m%}%~ %{\e[0m%}' # root
    else
        PROMPT=$'%{\e[1;33m%}%~ %{\e[0m%}' # regular user
    fi
    # right prompt with hostname or bad smiley
    RPROMPT=$'%(?,%{\e[34m%}ssh %n@%m%{\e[0m%},%{\e[1;31m%}:(%{\e[0m%})'
else # not SSH
    if [[ $EUID == 0 ]]; then
        PROMPT=$'%{\e[1;31m%}%~ %{\e[0m%}' # root
    else
        PROMPT=$'%{\e[1;32m%}%~ %{\e[0m%}' # regular user
    fi
    # right prompt with hostname or bad smiley
    RPROMPT=$'%(?,%{\e[34m%}%m%{\e[0m%},%{\e[1;31m%}:(%{\e[0m%})'
fi
