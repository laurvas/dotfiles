# don't guess preferred mode, always use emacs-style keybindings
bindkey -e

# to show hotkey symbol, press ctrl+V, than hotkey
bindkey -M isearch '^R' history-incremental-search-backward
bindkey -M isearch '^S' history-incremental-search-forward
bindkey "^[[5~" history-beginning-search-backward # pg up
bindkey "^[[6~" history-beginning-search-forward  # pg down

bindkey "^[[3~" delete-char           # delete
bindkey "^W" backward-delete-word     # delete instead of kill
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

case $TERM in
    rxvt|rxvt-unicode|rxvt-256color|rxvt-unicode-256color)
        bindkey '^[Od' emacs-backward-word # ctrl + left arrow
        bindkey '^[Oc' emacs-forward-word  # ctrl + right arrow
	bindkey '^[[7~' beginning-of-line  # home
	bindkey '^[[8~' end-of-line        # end
        ;;
    *)
        bindkey '^[[1;5D' emacs-backward-word # ctrl + left arrow
        bindkey '^[[1;5C' emacs-forward-word  # ctrl + right arrow
	bindkey '^[[H' beginning-of-line  # home
	bindkey '^[[F' end-of-line        # end
        ;;
esac

export WORDCHARS='_-' # symbols, that are a part of a word
