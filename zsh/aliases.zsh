alias ls='ls -F --color=auto'
alias ll='ls -l --color=auto -h'
alias la='ls -A --color=auto'
alias lla='ll -A --color=auto -h'
alias grep='grep --colour=auto'
hash colordiff 2>/dev/null && alias diff='colordiff'

alias rm='rm -r'
alias cp='nocorrect cp -r'
hash scp 2>/dev/null && alias scp='scp -r'
alias mkdir='nocorrect mkdir -p'

# don't try to correct typos
alias mv='nocorrect mv'
