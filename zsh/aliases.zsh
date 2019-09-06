alias ls='ls -F --color=auto'
alias ll='ls -lh'
alias la='ls -A'
alias lla='ll -A'
alias grep='grep --colour=auto'
hash colordiff 2>/dev/null && alias diff='colordiff'

alias rm='rm -r'
alias cp='nocorrect cp -r'
hash scp 2>/dev/null && alias scp='scp -r'
alias mkdir='nocorrect mkdir -p'

# don't try to correct typos
alias mv='nocorrect mv'
