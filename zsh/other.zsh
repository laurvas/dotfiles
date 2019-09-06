typeset -U path
path=(~/bin $path)

setopt autocd      # change directory without typing cd
setopt correctall  # correct typos
test $SHLVL -eq 3 && setopt ignore_eof # close only nested shells using Ctrl+D
setopt NO_BEEP

# enable completion
autoload -U compinit && compinit

# use arrow keys to navigate completion suggestions
setopt menucomplete
zstyle ':completion:*' menu select=1 _complete _ignored _approximate

# enable autosuggestions https://github.com/zsh-users/zsh-autosuggestions
AUTOSUG=/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
if [[ $TERM != linux && -f $AUTOSUG ]]; then
	source $AUTOSUG
fi
