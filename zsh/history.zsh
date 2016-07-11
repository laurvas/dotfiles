HISTFILE=~/.zhistory
HISTSIZE=2000
SAVEHIST=2000
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
