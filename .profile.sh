
alias vim=nvim
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
function title {
    if [ "$1" ]
    then
        export PROMPT_COMMAND='__bp_precmd_invoke_cmd'
        echo -ne "\033]0;${*}\007"
    else
        export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/\~}\007";__bp_precmd_invoke_cmd'
    fi
}
title
