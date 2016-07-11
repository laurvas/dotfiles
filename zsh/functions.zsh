# cd and ls in one shot
cdls() {
    local dir=$1
    test -z "$dir" && dir="$HOME"
    cd "$dir" && ls
}

cdll() {
    local dir=$1
    test -z "$dir" && dir="$HOME"
    cd "$dir" && ll
}

# classic archive extractor
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2) tar xvjf $1   ;;
            *.tar.gz)  tar xvzf $1   ;;
            *.bz2)     bunzip2 $1    ;;
            *.rar)     unrar x $1    ;;
            *.gz)      gunzip $1     ;;
            *.tar)     tar xvf $1    ;;
            *.tbz2)    tar xvjf $1   ;;
            *.tgz)     tar xvzf $1   ;;
            *.zip)     unzip $1      ;;
            *.Z)       uncompress $1 ;;
            *.7z)      7z x $1       ;;
            *)         echo "'$1' cannot be extracted via $0" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# and packer
pk() {
    if [ $2 ]; then
        case $1 in
            tbz)    tar cjvf "$2.tar.bz2" "$2"    ;;
            tgz)    tar czvf "$2.tar.gz"  "$2"    ;;
            tar)    tar cpvf "$2.tar"     "$2"    ;;
            bz2)    bzip "$2"                     ;;
            gz)     gzip -c -9 -n "$2" >  "$2.gz" ;;
            zip)    zip -r "$2.zip" "$2"          ;;
            7z)     7z a "$2".7z "$2"             ;;
            *)      echo "'$1' cannot be packed via $0" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# color man pages
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
}
