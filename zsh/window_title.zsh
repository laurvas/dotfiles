case $TERM in
termite|*xterm*|rxvt|rxvt-unicode|rxvt-256color|rxvt-unicode-256color|(dt|k|E)term)
    precmd ()
    {
        if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" || $EUID == 0 ]]; then
            print -Pn "\e]0;%n@%m:%~\a"
        else
            print -Pn "\e]0;%~\a"   # regular user
        fi
    }

    preexec ()
    {
        if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" || $EUID == 0 ]]; then
            print -Pn "\e]0;%n@%m $1\a"
        else
            print -Pn "\e]0;$1\a"   # regular user
        fi
    }
    ;;
esac
