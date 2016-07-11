HISTFILE=~/.zhistory
HISTSIZE=3000
SAVEHIST=3000
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS # remove blank lines from history file
# if the command starts with a whitespace, don't add it to history
setopt HIST_IGNORE_SPACE
# append every single command to $HISTFILE immediately after hitting ENTER
setopt INC_APPEND_HISTORY
# history sharng is needed too rarely to keep it enabled. Instead use "fc -R" to read history file when you need to enter command from other termianl.
unsetopt SHARE_HISTORY
