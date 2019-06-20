alias vim='nvim'
alias gita='git add'
alias gitd='git diff'
alias gitchk='git checkout'
alias gits='git status'
gitcmt () {
    message=$1
    git commit -m ${message}
}
alias dstamp='date +%Y%m%d'


exe_cpp () {
    name=$1
    g++ ${name}.cpp -g -o ${name} -std=c++14 && ./${name}
}

# iTerm2 tab titles
export DISABLE_AUTO_TITLE="true"
unset PROMPT_COMMAND
function title {
    if [ "$1" ]
    then
        echo -ne "\033]0;${*}\007"
    fi
}

alerm () {
    sleep_time=$1
    audio=/Users/Naoki/Projects/diary/audio/old_school_bell.mp3
    sleep $sleep_time; afplay $audio 
}
