alias ls='ls -F --color=auto'
alias ll='ls -l --color=auto -h'
alias la='ls -A --color=auto'
alias lla='ll -A --color=auto -h'
alias grep='grep --colour=auto'
hash colordiff 2>/dev/null && alias diff='colordiff'

# don't try to correct typos
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'

# aliases for file extensions
alias -s txt=${EDITOR}
